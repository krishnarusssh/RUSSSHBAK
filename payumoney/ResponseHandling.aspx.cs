using System;
using System.Data;
using System.Web;
using System.Web.Security;


using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


using System.Collections.Generic;
using System.Linq;

using System.Web.UI;
using System.Web.UI.WebControls;
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


public partial class ResponseHandling : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
        
        string [] merc_hash_vars_seq ;
        string merc_hash_string = string.Empty;
        string merc_hash = string.Empty;
        string order_id = string.Empty;

        string state1 = string.Empty;
        string pgtxnid = string.Empty;
        string amount = string.Empty;
        string marchant_txt_id = string.Empty;


        string hash_seq="key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";

        if (Request.Form["status"]=="success")
        {
        
        merc_hash_vars_seq = hash_seq.Split('|');
           Array.Reverse(merc_hash_vars_seq);
            merc_hash_string = ConfigurationManager.AppSettings["SALT"] + "|" + Request.Form["status"];
           int i=0 ;
            string pgtxn = "";
            foreach (string merc_hash_var in merc_hash_vars_seq)
            {
            merc_hash_string += "|";
            merc_hash_string = merc_hash_string +  (Request.Form[merc_hash_var]!=null ? Request.Form[merc_hash_var] : "");
            pgtxn = (Request.Form[merc_hash_var] != null ? Request.Form[merc_hash_var] : "");
            // Response.Write(Request.Form[merc_hash_var]+i.ToString());
            if(i==12)
			{
              marchant_txt_id = Request.Form[merc_hash_var];
			}
			if(i==14)
			{
              pgtxnid = Request.Form[merc_hash_var]+"-PYU";
			}
       			 Response.Write("<br>");
				i++;
            }
            merc_hash = Generatehash512(merc_hash_string).ToLower();
            if (merc_hash!=Request.Form["hash"])
            {

                Response.Write("Transaction failed!!!");
                // Response.Write("Hash value did not matched");
                
            }
            else
            {
                order_id = Request.Form["txnid"];

               // marchant_txt_id = Request.Form["productinfo"];
                state1 = Request.Form["status"];
                amount = Request.Form["amount"];
               // pgtxnid = pgtxn+"-PYU";

                Response.Write("----1st print");
				Response.Write(marchant_txt_id);Response.Write("<br>");
				Response.Write(state1);Response.Write("<br>");
				Response.Write(amount);Response.Write("<br>");
				Response.Write(pgtxnid);Response.Write("<br>");
				Response.Write("-------------");
                CrmClass objcrm = new CrmClass();
				objcrm.InsertCitrusTransactionResult(state1,pgtxnid, amount,marchant_txt_id );
                if (state1 == "success")
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

                    try
                    {
                        Session["PU_NAME"] = null;
                        Session["PU_AMOUNT"] = null;
                        Session["PU_PHONE"] = null;
                        Session["PU_MARTRANSACTIONID"] = null;
                       
                    }
                    catch (Exception ee)
                    {

                    }


		Session["NEWBOOKINGID"] =bkid;
  //Response.Write(bkid);
  		Response.Redirect("../confirmation");

                }

              
               
                //Hash value did not matched
            }

        }

        else
            {
                Response.Write("Transaction failed!!!");
               // Response.Write("Hash value did not matched");
           // osc_redirect(osc_href_link(FILENAME_CHECKOUT, 'payment' , 'SSL', null, null,true));
            
            }
        }

        catch( Exception ex)
        {
            Response.Write("<span style='color:red'>" + ex.Message + "</span>");

        }
    }

      public string Generatehash512(string text)
    {

        byte[] message = Encoding.UTF8.GetBytes(text);

            UnicodeEncoding UE = new UnicodeEncoding();
            byte[] hashValue;
            SHA512Managed hashString = new SHA512Managed();
            string hex = "";
            hashValue = hashString.ComputeHash(message);
            foreach (byte x in hashValue)
            {
                hex += String.Format("{0:x2}", x);
            }
            return hex;

    }



 
}
