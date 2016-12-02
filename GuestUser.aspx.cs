using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.SessionState;

public partial class GuestUser : System.Web.UI.Page, IHttpHandler
{
    private HttpContext context;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString.Count > 0)
            {
                if (Request.QueryString["Verifiedcode"] != null || Request.QueryString["Verifiedcode"] != "")
                {
                    hdnVcode.Value = Request.QueryString["Verifiedcode"].ToString();
                }
            }
        }
    }
    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        Guest DefObj = new Guest();
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();             
        SqlDataAdapter da;
        string error = "";
        string Name = " ";
        string Password = "GUser";
        string Email = " ";
        string Mobile = " ";
        string successFlag = "";
        string AccountID = "";


        //For checking verified user or not....
        string strVcode = "";
        con.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();

        if (hdnVcode.Value != "" && hdnVcode.Value != null)
        {
            strVcode = hdnVcode.Value;
        }
        bool isVerified = false;
         DataTable dt1 = DefObj.VerifyVerificationCode(strVcode);
         if (dt1.Rows.Count > 0)
         {
           
                isVerified = true;
         }
        if (isVerified == true)
        {

            if (txtsname.Value != "" && txtsname.Value != null)
            {
                Name = txtsname.Value;
            }
            if (txtsemail.Value != "" && txtsemail.Value != null)
            {
                Email = txtsemail.Value;
            }
            if (txtsmobile.Value != "" && txtsemail.Value != null)
            {
                Mobile = txtsmobile.Value;
            }

            string[] words = Name.Split(' ');
            string FName = "";
            string LName = "";
            if (words.Length > 1)
            {
                FName = words[0].ToString();
                LName = words[1].ToString();
            }
            else
            {
                FName = Name;
            }
            Guid g;
            // Create and display the value of two GUIDs.
            g = Guid.NewGuid();
            string actcode = g.ToString();
            string mootp = "";
            string ClientId = "";
            Random r = new Random();
            int randNum = r.Next(10000);
            string FiveDigitNumber = randNum.ToString("D6");
            mootp = FiveDigitNumber;
            DataSet ds2 = new DataSet();
            ds2 = DefObj.RegisterWebClientGuestUser(0, FName, LName, Email, Password, actcode, mootp, "I", "", "", "N", Mobile);
            if (ds2.Tables.Count > 0)
            {
                if (ds2.Tables[0].Rows.Count > 0)
                {
                    successFlag = ds2.Tables[0].Rows[0].ItemArray[0].ToString();
                    AccountID = ds2.Tables[0].Rows[0].ItemArray[2].ToString();
                    ClientId = ds2.Tables[0].Rows[0].ItemArray[1].ToString();
                }
            }
            if (successFlag == "Y" || successFlag == "E" ||successFlag == "1" )   //E : Existing User  And Y: Newly Created User
            {
                if (mootp != "")
                {
                    //Send Message
		/*                   
			 System.Net.WebClient client = new System.Net.WebClient();
                    client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");

                    string DestinationMobile = Mobile;
                    string MessagePart = "Dear " + Name + " The OTP for sign up to russsh.com is  " + mootp;

                    System.IO.Stream data = client.OpenRead("http://enterprise.smsgupshup.com/GatewayAPI/rest?method=SendMessage&send_to=" + DestinationMobile + "&msg=" + MessagePart + "&msg_type=TEXT&userid=2000148575&auth_scheme=plain&password=getmypeon&v=1.1&format=text");
                    System.IO.StreamReader reader = new System.IO.StreamReader(data);
                    string s = reader.ReadToEnd();
                    Console.WriteLine(s);
                    data.Close();
                    reader.Close();*/
                }
                string str = mootp + "," + successFlag + "," + ClientId;

                System.Web.HttpContext.Current.Session["CLIENT_ID"] = ClientId;
                System.Web.HttpContext.Current.Session["CLIENT_CONTACT"] = Mobile;
                System.Web.HttpContext.Current.Session["CLIENT_NAME"] = Name;
                System.Web.HttpContext.Current.Session["CLIENT_EMAIL"] = Email;
                string cid = System.Web.HttpContext.Current.Session["CLIENT_ID"].ToString();

                System.Web.HttpContext.Current.Session["Vcode"] = strVcode;
                Response.Redirect("~/BookTaskGuestUser/Default.aspx?VID="+strVcode);
            } // End of E : Existing User  And Y: Newly Created User
        } // End of is verified
        else
        {
            signupfail.Attributes.Add("style", "display:block");

        }
    }
   
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}