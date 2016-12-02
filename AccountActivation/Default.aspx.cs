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
using System.Net.Mail;


public partial class AccountActivation_Default : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection LocalConn = new SqlConnection();
    DataSet ds = new DataSet();
    SqlDataAdapter da;
    SqlDataReader dr;
    CrmClass objCrm = new CrmClass();
    
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack == true)
        {
            string ans = "N";
            string ActivationCode = "";
            string DBResponse = "N";
            if (Request.QueryString["code"] != "" && Request.QueryString["code"] != null)
            {
                ActivationCode = Request.QueryString["code"].ToString();
                ds = objCrm.ActivateAccount(ActivationCode);

                string EmailID = "";
                string Password = "";
                string Name = "";
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        DBResponse = ds.Tables[0].Rows[0].ItemArray[0].ToString();
                        EmailID = ds.Tables[0].Rows[0].ItemArray[1].ToString();
                        Password = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                        Name = ds.Tables[0].Rows[0].ItemArray[3].ToString();
                    }
                }

                if (EmailID != "" && Password != "")
                {
                    string text = System.IO.File.ReadAllText(Server.MapPath("~/mail_formats/confirmation.txt"));

                    text = text.Replace("$USERNAME$", Name);
                    text = text.Replace("$LOGINID$", EmailID);
                    text = text.Replace("$PASSWORD$", Password);
                    ans = objCrm.SendConfirmationEmail(EmailID, Name, text);

                }

            }

            if (ans == "Y")
            {
                ErrorHeading.InnerHtml = "Account Verified Successfully.";

                ErrorDescription.InnerHtml = "Login details has been sent to your email address. Please check your mailbox.";
            }
            else
            {
                ErrorHeading.InnerHtml = "Account Activation Failed!";
               
                ErrorDescription.InnerHtml = "There is some issue verifying your account. Plese contact us at support@russsh.com";
            }
        }

    }
}