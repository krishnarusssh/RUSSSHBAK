<%@ Page Language="C#" AutoEventWireup="true" CodeFile="return_process.aspx.cs" Inherits="return_process" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<%
  

    
String secretKey = "ju6tygh7u7tdg554k098ujd5468o";
String checksumString = null;

checksumString = CheckSumResponse.ChecksumCalculator.getResponseChecksumString(Request).Trim();
Boolean checksumMatch = CheckSumResponse.ChecksumCalculator.verifyChecksum(secretKey, checksumString, Request.Form["checksum"]);

if (checksumMatch)
{
    /*String orderid = Request.Form["orderid"];
    String isSuccess = Request.Form["issuccess"];
    String amount = Request.Form["amount"];
    */

    String statuscode = Request.Form["statuscode"];
    String message = Request.Form["statusmessage"];

    if (statuscode == "0")
    {
        // if txn is successful from mobikwik only then make a checkstatus api call // else you can display the error message received 

        String secret_key = "ju6tygh7u7tdg554k098ujd5468o";   // You can change this
        String merchant_id = "MBK9002";                       // You can change this 

        // this makes a check status api call 
        Dictionary<String, String> returnDict = CheckStatusAPI.CheckStatusAPI.verifyTransaction(merchant_id, Session["OrderId"].ToString(), Session["Amount"].ToString(), secret_key, Session["url"].ToString());
        if (returnDict["flag"] == "true")
        {
            /*
            Response.Write("Status Message: " + message);
            Response.Write("<br></br>");
            Response.Write("Data Received in Check Status API Call : <br/>");
            Response.Write("Status Code: " + returnDict["statuscode"]);
            Response.Write("<br>Order Id: " + returnDict["orderid"]);
            Response.Write("<br>Order type: " + returnDict["ordertype"]);
            Response.Write("<br>Amount paid: " + returnDict["amount"]);
            Response.Write("<br>Ref Id: " + returnDict["refid"]);
            Response.Write("<br>Status Message: " + returnDict["statusmessage"]);
            Response.Write("<br>Received Checksum: " + returnDict["checksum"]);
            */
            string state1 = returnDict["statusmessage"];
            string pgtxnid = returnDict["refid"] + "-MOB";
            string amount = returnDict["amount"];
            string marchant_txt_id = returnDict["orderid"];
           
            CrmClass objcrm = new CrmClass();
			objcrm.InsertCitrusTransactionResult(state1,pgtxnid, amount,marchant_txt_id );
            if (state1 == "success")
            {
                string bkid = "";
                bkid = marchant_txt_id;
                System.Data.SqlClient.SqlConnection LocalConn = new  System.Data.SqlClient.SqlConnection();
                LocalConn.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
                LocalConn.Open();
                System.Data.SqlClient.SqlDataAdapter da;
                System.Data.DataSet ds = new  System.Data.DataSet();
                System.Data.SqlClient.SqlCommand cmd = new  System.Data.SqlClient.SqlCommand();
                cmd = new  System.Data.SqlClient.SqlCommand("UpdateBookTaskOnlineTransactionID", LocalConn);
                cmd.CommandType =  System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@BookingID", System.Data.SqlDbType.Int).Value = Convert.ToInt32(bkid);
                cmd.Parameters.Add("@TransactionID", System.Data.SqlDbType.VarChar, 50).Value = pgtxnid ;
                da = new  System.Data.SqlClient.SqlDataAdapter(cmd);
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
                    System.Net.WebClient client = new  System.Net.WebClient();
                    client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");

                    string MessagePart = Server.UrlEncode("Dear " + Name + ", Thank you for booking your task with Russsh.com You will receive your confirmation within the next 20 minutes.");
                    System.IO.Stream data = client.OpenRead("http://enterprise.smsgupshup.com/GatewayAPI/rest?method=SendMessage&send_to=" + contactNo + "&msg=" + MessagePart + "&msg_type=TEXT&userid=2000148575&auth_scheme=plain&password=getmypeon&v=1.1&format=text");
                    System.IO.StreamReader reader = new System.IO.StreamReader(data);
                    string s = reader.ReadToEnd();
                    Console.WriteLine(s);
                    data.Close();
                    reader.Close();

                }

            Session["NEWBOOKINGID"] = bkid;
            Response.Redirect("../confirmation");
            
            }
                     
                       
        }
        else if (returnDict["flag"] == "false")
            
            
        {
            Response.Write("Sorry! Payment failed due to some technical reason. Pls call us at 8080808315");
            
            //Response.Write("Fraud Detected.");
        }
        else
        {
            Response.Write("Sorry! Payment failed due to some technical reason. Pls call us at 8080808315");
            //Response.Write("CheckStatus API Call could not be made."); // some error occured
        }
    }

    // The payment failed
    else
    {
        Response.Write("Sorry! Payment failed due to some technical reason. Pls call us at 8080808315");
        //Response.Write("Payment Failed due to the reason :- " + message);
        // Now save state of order ID in your database that the transaction has failed.
    }
}
else
{
    Response.Write("Sorry! Payment failed due to some technical reason. Pls call us at 8080808315");
   // Response.Write("Checksum received in response is not equal to what we calculated. Fraud Detected. ");
}
%>    
    
</body>
</html>
