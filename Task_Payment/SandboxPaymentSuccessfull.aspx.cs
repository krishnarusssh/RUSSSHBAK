using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
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

public partial class Task_Payment_SandboxPaymentSuccessfull : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CrmClass objcrm = new CrmClass();


        if (!Page.IsPostBack == true)
        {
            try
            {

                string state = Request.Form["TxStatus"].ToString();
                string pgtxnid = Request.Form["pgTxnNo"].ToString();
                string amount = Request.Form["amount"].ToString();
                string marchant_txt_id = Request.Form["TxId"].ToString();
                objcrm.InsertCitrusTransactionResult(state, pgtxnid, amount, marchant_txt_id);
                title1.InnerHtml="Transaction Failed!<br>";
                if (state == "SUCCESS")
                {
                   
 			title1.InnerHtml="Transaction Successfull!<br>";

			 string bkid = "";
                    // bkid = Request.QueryString["BOOKID"];
                    if (Request.QueryString["BOOKID"] != "" && Request.QueryString["BOOKID"] != null)
                    {
                        bkid = Request.QueryString["BOOKID"];
                    }
                    else
                    {
                        bkid = marchant_txt_id;
                    }
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

                    if (state == "")
                    {

                    }



                }


            }
            catch (Exception em)
            {
            }

        }
    }
}