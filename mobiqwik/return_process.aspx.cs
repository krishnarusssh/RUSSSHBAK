using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Text;
using System.Security.Cryptography;
using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Xml;

public partial class return_process : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}

namespace CheckSumResponse
{
    public class ChecksumCalculator
    {
        public static string toHex(byte[] bytes)
        {
            StringBuilder hex = new StringBuilder(bytes.Length * 2);
            foreach (byte b in bytes)
                hex.AppendFormat("{0:x2}", b);
            return hex.ToString();


        }

        public static string calculateChecksum(string secretkey, string allparamvalues)
        {

            byte[] dataToEncryptByte = Encoding.UTF8.GetBytes(allparamvalues);
            byte[] keyBytes = Encoding.UTF8.GetBytes(secretkey);
            HMACSHA256 hmacsha256 = new HMACSHA256(keyBytes);
            byte[] checksumByte = hmacsha256.ComputeHash(dataToEncryptByte);
            String checksum = toHex(checksumByte);

            return checksum;
        }

        public static Boolean verifyChecksum(String secretKey, String allParamVauleExceptChecksum, String checksumReceived)
        {

            byte[] dataToEncryptByte = Encoding.UTF8.GetBytes(allParamVauleExceptChecksum);
            byte[] keyBytes = Encoding.UTF8.GetBytes(secretKey);
            HMACSHA256 hmacsha256 = new HMACSHA256(keyBytes);
            byte[] checksumCalculatedByte = hmacsha256.ComputeHash(dataToEncryptByte); ;
            String checksumCalculated = toHex(checksumCalculatedByte);

            if (checksumReceived.Equals(checksumCalculated))
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public static String getResponseChecksumString(HttpRequest Request)
        {
            String checksumString = "";
            // System.Text.StringBuilder displayValues = new System.Text.StringBuilder();

            String statuscode = Request.Form["statuscode"];
            String orderid = Request.Form["orderid"];
            String amount = Request.Form["amount"];
            String mid = Request.Form["mid"];
            String statusmessage = Request.Form["statusmessage"];
            
            checksumString = "'" + statuscode + "''" + orderid + "''" + amount + "''" + statusmessage + "''" + mid + "'";

            return checksumString;
        }

       
    }
    
}

namespace CheckStatusAPI
{
    public class CheckStatusAPI
    {
        // This function makes check-status api call // it is master function 
		public static Dictionary<String,String> verifyTransaction(String MerchantId, String OrderId , String Amount,String WorkingKey, String url)
		{		
		    
			Dictionary<String,String> returnDict = new Dictionary<String,String>();

            String checksumString = "'"+MerchantId+"''"+OrderId+"'";

            String checksum = CheckSumResponse.ChecksumCalculator.calculateChecksum(WorkingKey, checksumString);

            // creates the post data for the POST request
            string postData = ("mid="+MerchantId+"&orderid="+OrderId+"&checksum="+checksum+"&ver=2");

            // create the POST request
            HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create(url);
            webRequest.Method = "POST";
            webRequest.ContentType = "application/x-www-form-urlencoded";
            webRequest.ContentLength = postData.Length;

            // POST the data
            using (StreamWriter requestWriter2 = new StreamWriter(webRequest.GetRequestStream()))
            {
                requestWriter2.Write(postData);
            }

            //  This actually does the request and gets the response back
            HttpWebResponse resp = (HttpWebResponse)webRequest.GetResponse();

            string responseData = string.Empty;

            using (StreamReader responseReader = new StreamReader(webRequest.GetResponse().GetResponseStream()))
            {
                // dumps the HTML from the response into a string variable
                responseData = responseReader.ReadToEnd();
            }

            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.LoadXml(responseData);

            String receivedstatuscode = xmlDocument.SelectSingleNode("wallet/statuscode").InnerText.Trim();
            String receivedorderid = xmlDocument.SelectSingleNode("wallet/orderid").InnerText.Trim();
            String receivedrefid = xmlDocument.SelectSingleNode("wallet/refid").InnerText.Trim();
            String receivedamount = xmlDocument.SelectSingleNode("wallet/amount").InnerText.Trim();
            String receivedstatusmessage = xmlDocument.SelectSingleNode("wallet/statusmessage").InnerText.Trim();
            String receivedordertype = xmlDocument.SelectSingleNode("wallet/ordertype").InnerText.Trim();
            String receivedchecksum = xmlDocument.SelectSingleNode("wallet/checksum").InnerText.Trim();

            String checksumString2 = "'" + receivedstatuscode + "''" + receivedorderid + "''" + receivedrefid + "''" + receivedamount + "''" + receivedstatusmessage + "''" + receivedordertype + "'";

            String checksum2 = CheckSumResponse.ChecksumCalculator.calculateChecksum(WorkingKey, checksumString2);

            if ((checksum2 == receivedchecksum) && (OrderId == receivedorderid) && (Convert.ToDouble(Amount) == Convert.ToDouble(receivedamount)))
            {
                returnDict.Add("statuscode", receivedstatuscode);
                returnDict.Add("orderid", receivedorderid);
                returnDict.Add("refid", receivedrefid);
                returnDict.Add("amount", receivedamount);
                returnDict.Add("statusmessage", receivedstatusmessage);
                returnDict.Add("ordertype", receivedordertype);
                returnDict.Add("checksum", receivedchecksum);
                returnDict.Add("flag", "true");
            }
            else
            {
                returnDict.Add("flag", "false");
            }

            return returnDict;
		}
    }
}