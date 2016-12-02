<%@ WebHandler Language="C#" Class="TransactionRequest" %>
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Security.Cryptography;
using System.Text;
using System.IO;

public class TransactionRequest : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string access_key = "DQPW4Y3F1ZP9BHKRU2J2";
        string secret_key = "2d2ed82733071d05c98378f5b989e423a218554a";
        string return_url = "https://www.russsh.com/MobilePaymentHandlers/returnData.aspx";
        Int32 unixTimestamp = (Int32)(DateTime.UtcNow.Subtract(new DateTime(1970, 1, 1))).TotalSeconds;
        string txn_id = unixTimestamp.ToString();
        Random rnd = new Random();
        int rnd1 = rnd.Next(10000, 99999);
        txn_id = txn_id + rnd1.ToString();
        // txn_id=context.Request.QueryString["txxxnid"];
        string value = context.Request.QueryString["amount"];
        string data_string = "merchantAccessKey=" + access_key + "&transactionId=" + txn_id + "&amount=" + value;
        byte[] key = Encoding.ASCII.GetBytes(secret_key);​ //secret key​
        HMACSHA1 hmac = new HMACSHA1(key);
        MemoryStream stream = new MemoryStream(Encoding.ASCII.GetBytes(data_string));​ //data to be encoded​
        string signature = BitConverter.ToString(hmac.ComputeHash(stream))
        .Replace("-", "").ToLower();
        String retval = "{\"merchantTxnId\"" + ":";
        retval = retval + "\"" + txn_id + "\",";
        retval = retval + "\"amount\":";
        retval = retval + "{\"value\":";
        retval = retval + "\"" + value + "\",";
        retval = retval + "\"currency\":\"INR\"},";
        retval = retval + "\"requestSignature\":";
        retval = retval + "\"" + signature + "\",";
        retval = retval + "\"merchantAccessKey\":";
        retval = retval + "\"" + access_key + "\",";
        retval = retval + "\"returnUrl\":";
        retval = retval + "\"" + return_url + "\"}";
        context.Response.Write(retval);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}