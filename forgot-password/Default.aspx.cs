using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class forgot_password_Default : System.Web.UI.Page
{
    CrmClass crmObj = new CrmClass();
    string ans = "N";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnContinue_Click(object sender, EventArgs e)
    {
        string emailpass = crmObj.getpassword(txtEmailID.Text.ToString());
        if (emailpass != "N" )
        {
            string text = System.IO.File.ReadAllText(Server.MapPath("~/mail_formats/confirmation.txt"));
            text = text.Replace("$USERNAME$", txtEmailID.Text.ToString());
            text = text.Replace("$LOGINID$", txtEmailID.Text.ToString());
            text = text.Replace("$PASSWORD$", emailpass);
            ans = crmObj.SendConfirmationEmail(txtEmailID.Text.ToString(), txtEmailID.Text.ToString(), text);

        }
        if (ans == "Y")
        {
          
          
            lblMessage0.Text = "Login details has been sent to your email address. Please check your mailbox.";
        }

    }
}