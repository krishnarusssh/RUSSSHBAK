using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
public partial class contactus_confirmation_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string Flag="";
        string msghdr="";
        string msgtxt = "";
        //CrmClass cc = new CrmClass();
        if (Session["REG_FLAG"] != null)
        {
             Flag = Session["REG_FLAG"].ToString();
        }
        if (Session["MESSAGE_HEADER"] != null)
        {
             msghdr = Session["MESSAGE_HEADER"].ToString();
        }
        if (Session["MESSAGE_TEXT"] != null)
        {
             msgtxt = Session["MESSAGE_TEXT"].ToString();
        }

        
            ErrorHeading.InnerHtml = msghdr.ToString();
            ErrorDescription.InnerHtml = msgtxt.ToString();
       
    }


//public string SendContactUsEmail(string RecipantEmailID, string RecipantName, string EmailBody)
//    {
//        string ans = "N";


//        MailAddress from = new MailAddress("task@russsh.com", "RUSSSH");
//        MailAddress toemail = new MailAddress(RecipantEmailID, RecipantName);

//        System.Net.Mail.MailMessage Email1 = new System.Net.Mail.MailMessage(from, toemail);

//        Email1.Subject = "New Enquiry Received ";

//        Email1.Body = EmailBody;
//        Email1.IsBodyHtml = true;


//        Email1.Sender = new MailAddress("task@russsh.com", "RUSSSH");
//        Email1.Priority = System.Net.Mail.MailPriority.High;
//        System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient();
//        System.Net.NetworkCredential basicAuthenticationInfo = new System.Net.NetworkCredential("task@russsh.com", "Russsh1380");
//        mailClient.UseDefaultCredentials = true;
//        mailClient.Host = "us2.smtp.mailhostbox.com";
//        mailClient.Port = 25;
//        mailClient.EnableSsl = true;
//        mailClient.Credentials = basicAuthenticationInfo;

//        try
//        {
//            mailClient.Send(Email1);
//            ans = "Y";
//        }
//        catch (Exception ee)
//        {
//           // error = ee.ToString();
//            ans = "N";
//        }


//        return ans;
//    }
}