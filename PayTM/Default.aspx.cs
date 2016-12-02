using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using paytm;
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
        String merchantKey = "yKoGcpHCda8Euk8C";

        string firstname = "";
        string amount = "";
        string phone = "";
        string productinfo = "";
        string email = "";
        string customerid = "";
            if (Session["PTM_CLIENTID"] != null)
        {
            customerid = Session["PTM_CLIENTID"].ToString();
        }
        if (Session["PTM_EMAIL"] != null)
        {
            email = Session["PTM_EMAIL"].ToString();
        }
        if (Session["PTM_NAME"] != null)
        {
            firstname = Session["PTM_NAME"].ToString();
        }
        if (Session["PTM_AMOUNT"] != null)
        {
            amount = Session["PTM_AMOUNT"].ToString();
        }
        if (Session["PTM_PHONE"] != null)
        {
            phone = Session["PTM_PHONE"].ToString();
        }
        if (Session["PTM_MARTRANSACTIONID"] != null)
        {
            productinfo = Session["PTM_MARTRANSACTIONID"].ToString();
        }


        string paytmURL = "https://secure.paytm.in/oltp-web/processTransaction?orderid=" + productinfo;

Dictionary<string, string> parameters = new Dictionary<string, string>();
parameters.Add("MID", "RUSSSH32212362169702");
parameters.Add("CHANNEL_ID", "WEB");
parameters.Add("INDUSTRY_TYPE_ID", "Retail120");
parameters.Add("WEBSITE", "russshweb");
parameters.Add("EMAIL", email);
parameters.Add("MOBILE_NO", phone);
parameters.Add("CUST_ID", customerid);
parameters.Add("ORDER_ID", productinfo);
parameters.Add("TXN_AMOUNT", amount);
parameters.Add("PAYMENT_MODE_ONLY", "NB");
parameters.Add("CALLBACK_URL","https://www.russsh.com/PayTM/PayTmReturn.aspx"); //This parameter is not mandatory. Use this to pass the callback url dynamically.

string checksum = CheckSum.generateCheckSum(merchantKey, parameters);


string outputHTML = "<html>";
outputHTML += "<head>";
outputHTML += "<title>Merchant Check Out Page</title>";
outputHTML += "</head>";
outputHTML += "<body>";
outputHTML += "<center><h1>Please do not refresh this page...</h1></center>";
outputHTML += "<form method='post' action='" + paytmURL + "' name='f1'>";
outputHTML += "<table border='1'>";
outputHTML += "<tbody>";
foreach (string key in parameters.Keys)
{
    outputHTML += "<input type='hidden' name='" + key + "' value='" + parameters[key] + "'>";
}
outputHTML += "<input type='hidden' name='CHECKSUMHASH' value='" + checksum + "'>";
outputHTML += "</tbody>";
outputHTML += "</table>";
outputHTML += "<script type='text/javascript'>";
outputHTML += "document.f1.submit();";
outputHTML += "</script>";
outputHTML += "</form>";
outputHTML += "</body>";
outputHTML += "</html>";
Response.Write(outputHTML);



    }
}