using System;
using System.Collections.Generic;
using System.Linq;


using System.Web.UI.WebControls;
using paytm;

using System.Data;
using System.Web;
using System.Web.Security;

using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Collections.Specialized;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Drawing;
using System.Configuration;
using System.Security.Cryptography;
using System.Configuration;



public partial class PayTMReturn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String merchantKey = "yKoGcpHCda8Euk8C"; // Replace the with the Merchant Key provided by Paytm at the time of registration.

Dictionary<string, string> parameters = new Dictionary<string, string>();
string paytmChecksum = "";

string state1 = string.Empty;
string pgtxnid = string.Empty;
string amount = string.Empty;
string marchant_txt_id = string.Empty;


foreach (string key in Request.Form.Keys)
{
   parameters.Add(key.Trim(), Request.Form[key].Trim());
   if (key.Trim() == "STATUS")
   {
       state1 = Request.Form[key].Trim();
   }
   if (key.Trim() == "TXNAMOUNT")
   {
       amount = Request.Form[key].Trim();
   }
   if (key.Trim() == "TXNID")
   {
       pgtxnid = Request.Form[key].Trim() + "-PTM";
   }
   if (key.Trim() == "ORDERID")
   {
       marchant_txt_id = Request.Form[key].Trim();
   }
}

CrmClass objcrm = new CrmClass();
objcrm.InsertCitrusTransactionResult(state1, pgtxnid, amount, marchant_txt_id);
   if (state1 == "TXN_SUCCESS")
                {

                    string bkid = "";
                    bkid = marchant_txt_id;
                    SqlConnection LocalConn = new SqlConnection();
                    LocalConn.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
                    LocalConn.Open();
                    SqlDataAdapter da;
                    DataSet ds = new DataSet();
                    SqlCommand cmd = new SqlCommand();
                    cmd = new SqlCommand("UpdateBookTaskOnlineTransactionID", LocalConn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@BookingID", SqlDbType.Int).Value = Convert.ToInt32(bkid);
                     cmd.Parameters.Add("@TransactionID", SqlDbType.VarChar, 50).Value = pgtxnid;
                    da = new SqlDataAdapter(cmd);
                    da.Fill(ds);

                    string contactNo = "";
                    string ClientID = "0";
                    string Name = "";
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            contactNo = ds.Tables[0].Rows[0].ItemArray[0].ToString();
                            ClientID = ds.Tables[0].Rows[0].ItemArray[1].ToString();
                            Name = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                        }
                    }
                    cmd.Dispose();
                    LocalConn.Close();
                    if (Name != "" && contactNo != "")
                    {
                        WebClient client = new WebClient();
                        client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");

                        string MessagePart = Server.UrlEncode("Dear " + Name + ", Thank you for booking your task with Russsh.com You will receive your confirmation within the next 20 minutes.");
                        Stream data = client.OpenRead("http://enterprise.smsgupshup.com/GatewayAPI/rest?method=SendMessage&send_to=" + contactNo + "&msg=" + MessagePart + "&msg_type=TEXT&userid=2000148575&auth_scheme=plain&password=getmypeon&v=1.1&format=text");
                        StreamReader reader = new StreamReader(data);
                        string s = reader.ReadToEnd();
                        Console.WriteLine(s);
                        data.Close();
                        reader.Close();

                    }


if (parameters.ContainsKey("CHECKSUMHASH"))
{
   paytmChecksum = parameters["CHECKSUMHASH"];
   parameters.Remove("CHECKSUMHASH");
}
try
{
Session["PTM_CLIENTID"]=null;
Session["PTM_EMAIL"]=null;
Session["PTM_NAME"] =null;
Session["PTM_AMOUNT"]=null;
Session["PTM_PHONE"]=null;
Session["PTM_PHONE"]=null;
}
catch(Exception ee)
{

}
  Session["NEWBOOKINGID"] =bkid;
  Response.Redirect("../confirmation");



}

/*
if (CheckSum.verifyCheckSum(merchantKey, parameters, paytmChecksum))
{
}
else
{
   Response.Write("Transaction Failed");
} */
    
}
}