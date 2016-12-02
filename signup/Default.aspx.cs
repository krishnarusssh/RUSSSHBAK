using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.IO;
using ASPSnippets.FaceBookAPI;
using System.Web.Script.Serialization;
using System.Configuration;
public partial class signup_Default : System.Web.UI.Page
{
    CrmClass CRMObj = new CrmClass();
    SqlDataAdapter da;
     SqlConnection con = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataReader dr;
    DataSet ds;
    string successFlag ;
    string actcode  ;
    string mootp ;
    protected void Page_Load(object sender, EventArgs e)
    {
       con.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
        FaceBookConnect.API_Key = "337488946374891";
        FaceBookConnect.API_Secret = "179dbd85ce3d835f9414ef3ac486e502";
        
        if (!IsPostBack == true)
        {
            validationsection.Visible = false;
            if (Request.QueryString["logout"] == "true")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User has logged out from Facebook')", true);
                return;
            }

            if (Request.QueryString["error"] == "access_denied")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User has denied access.')", true);
                return;
            }

            string code = Request.QueryString["code"];

            if (!string.IsNullOrEmpty(code))
            {
                string data = FaceBookConnect.Fetch(code, "me");

                Session["FBCODE"] = Request.QueryString["code"];
                FaceBookUser faceBookUser = new JavaScriptSerializer().Deserialize<FaceBookUser>(data);
                faceBookUser.PictureUrl = string.Format("https://graph.facebook.com/{0}/picture", faceBookUser.Id);

                string AppID = faceBookUser.Id;
                string Name = faceBookUser.Name;
                string Email = faceBookUser.Email;
                string PlatForm = "F";
                int c = 0;
                if (Email == null)
                {
                    Email = "NONE";
                    c = 1;
                    Session["AppID"] = AppID;
                    Session["Name"] = Name;
                    Session["Email"] = Email;
                    Session["PlatForm"] = PlatForm;
                    Response.Redirect("https://www.russsh.com/signin/LinkYourAccount.aspx");
                }

                ds = CRMObj.ProcessSocialLogin(Name, Email, AppID, PlatForm);
                string ans = "";
                string ClientID = "0";
                string ClientName = "";
                string ClientContact = "";

                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {

                        string ClientEmail = "";
                        string RussshSocialID = "";

                        ClientID = ds.Tables[0].Rows[0].ItemArray[0].ToString();
                        ClientName = ds.Tables[0].Rows[0].ItemArray[1].ToString();
                        ClientEmail = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                        ClientContact = ds.Tables[0].Rows[0].ItemArray[3].ToString();
                        RussshSocialID = ds.Tables[0].Rows[0].ItemArray[4].ToString();


                        Response.Redirect("https://www.russsh.com/BookTask");


                    }
                }


            }


        }
    }
    

    protected void Login(object sender, EventArgs e)
    {
        FaceBookConnect.Authorize("user_photos,email", Request.Url.AbsoluteUri.Split('?')[0]);
    }
    protected void Logout(object sender, EventArgs e)
    {
        FaceBookConnect.Logout(Request.QueryString["code"]);
    }
    protected void txtSubmit_Click(object sender, EventArgs e)

    {
        Guid g;
        // Create and display the value of two GUIDs.
        g = Guid.NewGuid();
        actcode = g.ToString();

        Random r = new Random();
        int randNum = r.Next(10000);
        string FiveDigitNumber = randNum.ToString("D5");
        mootp = FiveDigitNumber;
        DataSet ds = CRMObj.RegisterWebClient(0, txtFname.Text, txtLname.Text, txtEmail .Text, txtPassword.Text, actcode, mootp, "I", "", "", "N", txtMobile.Text);
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                successFlag = ds.Tables[0].Rows[0].ItemArray[0].ToString();
                lblAccountID.Text = ds.Tables[0].Rows[0].ItemArray[2].ToString();
            }
        }

        if (successFlag == "Y")
        {
           
           try
            {
                con.Open();
              cmd = new SqlCommand("update account_master set source =" + Request.QueryString["Source"].ToString() + " where Accountid =" + lblAccountID.Text, con);
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                
                 
            }
            //DataSet DsOTP = new DataSet();
            //DsOTP = CRMObj.Crm_GenerateOTPInDatabase(txtMobile.Text.ToString());
            //string Code = "";
            //if (DsOTP.Tables.Count > 0)
            //{
            //    if (DsOTP.Tables[0].Rows.Count > 0)
            //    {
            //        Code = DsOTP.Tables[0].Rows[0].ItemArray[0].ToString();
            //    }
            //}
            if (mootp != "")
            {
                //Send Message

                WebClient client = new WebClient();
                client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");

                string DestinationMobile = txtMobile.Text;
                string MessagePart = Server.UrlEncode("Dear " + txtFname.Text + " The OTP for sign up to russsh.com is  " + mootp);

                Stream data = client.OpenRead("http://enterprise.smsgupshup.com/GatewayAPI/rest?method=SendMessage&send_to=" + DestinationMobile + "&msg=" + MessagePart + "&msg_type=TEXT&userid=2000148575&auth_scheme=plain&password=getmypeon&v=1.1&format=text");
                StreamReader reader = new StreamReader(data);
                string s = reader.ReadToEnd();
                Console.WriteLine(s);
                data.Close();
                reader.Close();

            }

            divtop.Visible = false;
            validationsection.Visible = true;


        }
        else if (successFlag == "E")
        {
            Session["REG_FLAG"] = "E";
            Session["MESSAGE_HEADER"] = "Already Registered.";
            Session["MESSAGE_TEXT"] = "Oops! This mobile number has already been registered with us. If you have forgotten your username or password <a href='../forget-password/'>CLICK HERE</a> or try registering with a different number.";
            Response.Redirect("~/message_confirmation");
        }
        else if (successFlag == "N")
        {
            Session["REG_FLAG"] = "N";
            Session["MESSAGE_HEADER"] = "Registration Failed";
            Session["MESSAGE_TEXT"] = "Hi,There are some issue setting up this account. Please try again or contact us! ";
            Response.Redirect("~/message_confirmation");
        }
    }
    protected void btnValidate_Click(object sender, EventArgs e)




    {
       
        
        
        
        DataSet dsVerify = new DataSet();
        dsVerify = CRMObj.Crm_VerifyOTP(txtMobile.Text, txtMissedCallNo.Text);
        string success = "N";
        string code = "";
        if (dsVerify.Tables.Count > 0)
        {
            if (dsVerify.Tables[0].Rows.Count > 0)
            {
                success = dsVerify.Tables[0].Rows[0].ItemArray[0].ToString();
                code = dsVerify.Tables[0].Rows[0].ItemArray[1].ToString();
            }
        }
        string status = "";
        if (success == "Y")
        {
            status = "VERIFIED";
            DataSet dsv = new DataSet();
            dsv = CRMObj.Crm_ValidateMobileNo(txtEmail.Text);
            string text = "";
            try
            {
                text = System.IO.File.ReadAllText(Server.MapPath("~/mail_formats/activationmail.txt"));
            }
            catch (Exception eee)
            {
            }
            text = text.Replace("$USERNAME$", txtFname.Text + " " + txtLname.Text);
            text = text.Replace("$CODE$", code);
            string ans = CRMObj.SendActivationEmail(txtEmail.Text, txtFname.Text + " " + txtLname.Text, text);
            Session["REG_FLAG"] = "Y";
            Session["MESSAGE_HEADER"] = "Registered Successfully.";
            Session["MESSAGE_TEXT"] = "Hi, Your have successfully set up account with Russsh! <br><br><a href='../signin'><b>Login to your Account<b></a>";
            Response.Redirect("~/message_confirmation");
        }
        else
        {
            status = "NOT VERIFIED";
            Session["REG_FLAG"] = "N";
            Session["MESSAGE_HEADER"] = "OTP Validation Failed!";
            Session["MESSAGE_TEXT"] = "We could not verify your contact information. Please sign up with a valid Mobile No.";
            Response.Redirect("~/message_confirmation");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        divtop.Visible = true;
        validationsection.Visible = false;
    }


/*
    protected void btnnn_Click(object sender, EventArgs e)
    {
        Response.Redirect("../signin/");
    }*/
}

public class FaceBookUser
{
    public string Id { get; set; }
    public string Name { get; set; }
    public string UserName { get; set; }
    public string PictureUrl { get; set; }
    public string Email { get; set; }
}
