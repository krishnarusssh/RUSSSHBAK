using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Payment_PayByCard : System.Web.UI.Page
{
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        
    protected void Page_Load(object sender, EventArgs e)
    {
con.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
        string txn_id ="";
        if (Session["CIT_MARTRANSACTIONID"] != null)
        {

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
            string cdata = "0";
            if (Request.QueryString["Data"] != "" && Request.QueryString["Data"] != null)
            {
                cdata = Request.QueryString["Data"].ToString();
                string[] words = cdata.Split('_');
               string[] words2 = GetCardType(words[0].ToString().Substring(0, 6)).Split(',');
               
               citrusCardType.Value = words2[1];
                citrusNumber.Value =  words[0];
                citrusCardHolder.Value =  words[1];
                citrusExpiry.Value =  words[2]+"/"+words[3];
                citrusCvv.Value = words[4];
                  string _isSave = "0";
                _isSave = words[5];
                if (_isSave == "1")
                {
                    DataSet ds1 = new DataSet();
                    con.Open();
                    cmd = new SqlCommand("CCD", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@ClientID", SqlDbType.Int).Value = Convert.ToInt32(Session["CLIENT_ID"].ToString());
                    cmd.Parameters.Add("@CardNo", SqlDbType.NVarChar).Value = MyExtenstionMethods.EncryptString(words[0]);
                    cmd.Parameters.Add("@CardHolderName", SqlDbType.NVarChar).Value = MyExtenstionMethods.EncryptString(words[1]);
                    cmd.Parameters.Add("@CardType", SqlDbType.NVarChar).Value = MyExtenstionMethods.EncryptString(words2[1]);
                    cmd.Parameters.Add("@ExpiryMonth", SqlDbType.NVarChar).Value = MyExtenstionMethods.EncryptString(words[2]);
                    cmd.Parameters.Add("@ExpiryYear", SqlDbType.NVarChar).Value = MyExtenstionMethods.EncryptString(words[3]);
                    da = new SqlDataAdapter(cmd);
                    da.Fill(ds1);
                    DataTable dtable = ds1.Tables[0];
                
                }
                for (int i = 0; i <= citrusScheme.Items.Count - 1; i++)
                {
                    if (citrusScheme.Items[i].Value == words2[0])
                    {
                        citrusScheme.Items[i].Selected = true;

                    }
                }
            }
            
            //string bankid = Request.QueryString["bid"].ToString();
            string secret_key = "2d2ed82733071d05c98378f5b989e423a218554a"; 

            //string return_url = "http://www.russsh.com/Payment/SampleResponse.aspx";

            //string vanityUrl = "russshpay";

            //Need to change with your Return URL
            string returnURL = "https://www.russsh.com/Task_Payment/PaymentResponse.aspx?BOOKID=" + txn_id;
            citrusReturnUrl.Value = "https://www.russsh.com/Task_Payment/PaymentResponse.aspx?BOOKID=" + txn_id;
            //Need to change with your Notify URL
            string notifyUrl = "https://www.russsh.com/Task_Payment/TransactionResponse.aspx";

            Int32 unixTimestamp = (Int32)(DateTime.UtcNow.Subtract(new DateTime(1970, 1, 1))).TotalSeconds;
           
            string amount = Session["CIT_AMOUNT"].ToString();
            string data_string = "merchantAccessKey=" + access_key + "&transactionId=" + txn_id + "&amount=" + amount;

            byte[] key = Encoding.ASCII.GetBytes(secret_key);
            System.Security.Cryptography.HMACSHA1 hmac = new System.Security.Cryptography.HMACSHA1(key);
            System.IO.MemoryStream stream = new System.IO.MemoryStream(Encoding.ASCII.GetBytes(data_string));
            string signature = BitConverter.ToString(hmac.ComputeHash(stream)).Replace("-", "").ToLower();


            citrusMerchantTxnId.Value = txn_id;
            citrusAmount.Value = amount;
            citrusSignature.Value = signature;
            citrusFirstName.Value = Session["CIT_NAME"].ToString();
            citrusLastName.Value = Session["CIT_NAME"].ToString();
            citrusEmail.Value = Session["CIT_EMAIL"].ToString();
            citrusMobile.Value = Session["CIT_PHONE"].ToString();
            citrusAmount.Value = Session["CIT_AMOUNT"].ToString();
            citrusMerchantTxnId.Value = txn_id;

        }
        else
        {
            Response.Redirect("../");
        }
    }
    public string GetCardType(string cno)
    {
        string result = "N";
        try
        {
            using (WebClient client = new WebClient())
            {

                byte[] response =
                client.UploadValues("https://binlist.net/json/" + cno, new NameValueCollection());

                result = System.Text.Encoding.UTF8.GetString(response);
            }

            dynamic stuff = JsonConvert.DeserializeObject(result);
            // card_type card type credit card debit card 
            return stuff.brand + "," + stuff.card_type;
        }
        catch (Exception)
        {

            return result;
        }

    }
}