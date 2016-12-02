using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Payment_PayByNetBanking : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        string txn_id = "";
        if (Session["CIT_MARTRANSACTIONID"] != null)
        {
            txn_id = Session["CIT_MARTRANSACTIONID"].ToString() + "T" + System.DateTime.Now.ToString("yyyyMMddHHmmssffff");
        }
        if (Session["CIT_AMOUNT"] != null)
        {
            citrusAmount.Value = HttpContext.Current.Session["CIT_AMOUNT"].ToString();
        }
        if (Session["CIT_NAME"] != null)
        {
            citrusFirstName.Value = Session["CIT_NAME"].ToString();
            citrusLastName.Value = Session["CIT_NAME"].ToString();
        }
        if (Session["CIT_EMAIL"] != null)
        {
            citrusEmail.Value = HttpContext.Current.Session["CIT_EMAIL"].ToString();
        }
        if (Session["CIT_PHONE"] != null)
        {
            citrusMobile.Value = HttpContext.Current.Session["CIT_PHONE"].ToString();
        }

         string access_key = "DQPW4Y3F1ZP9BHKRU2J2";
         string bankid = Request.QueryString["bid"].ToString();
         string secret_key = "2d2ed82733071d05c98378f5b989e423a218554a";
            
         //string return_url = "http://www.russsh.com/Payment/SampleResponse.aspx";

         //string vanityUrl = "russshpay";

         //Need to change with your Return URL
         string returnURL = "https://www.russsh.com/Task_Payment/PaymentResponse.aspx?BOOKID=" + txn_id;
         citrusReturnUrl.Value = "https://www.russsh.com/Task_Payment/PaymentResponse.aspx?BOOKID=" + txn_id;
         //Need to change with your Notify URL
         string notifyUrl = "https://www.russsh.com/Task_Payment/TransactionResponse.aspx";
        
        Int32 unixTimestamp = (Int32)(DateTime.UtcNow.Subtract(new DateTime(1970, 1, 1))).TotalSeconds;
        // txn_id = Session["CIT_MARTRANSACTIONID"].ToString() +"T"+System.DateTime.Now.ToString("yyyyMMddHHmmssffff");
        string amount = Session["CIT_AMOUNT"].ToString();
        string data_string = "merchantAccessKey=" + access_key + "&transactionId=" + txn_id + "&amount=" + amount;

        byte[] key = Encoding.ASCII.GetBytes(secret_key);
        System.Security.Cryptography.HMACSHA1 hmac = new System.Security.Cryptography.HMACSHA1(key);
        System.IO.MemoryStream stream = new System.IO.MemoryStream(Encoding.ASCII.GetBytes(data_string));
        string signature = BitConverter.ToString(hmac.ComputeHash(stream)).Replace("-", "").ToLower();


        citrusMerchantTxnId.Value = txn_id;
        citrusAmount.Value = amount;
        citrusSignature.Value = signature;
       // bankid.Value = bankid;
        citrusAvailableOptions.Value = bankid;
		for (int i = 0; i <= citrusAvailableOptions.Items.Count - 1; i++)
        {
            if (citrusAvailableOptions.Items[i].Value == bankid)
            {
                citrusAvailableOptions.Items[i].Selected = true;
                
            }
        }
        citrusFirstName.Value = Session["CIT_NAME"].ToString();
        citrusLastName.Value = Session["CIT_NAME"].ToString();
        citrusEmail.Value =Session["CIT_EMAIL"].ToString();
        citrusMobile.Value = Session["CIT_PHONE"].ToString();
        citrusAmount.Value = Session["CIT_AMOUNT"].ToString();
        citrusMerchantTxnId.Value = txn_id;
      
    }
}