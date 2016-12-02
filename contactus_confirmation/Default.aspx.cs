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
        //CrmClass cc = new CrmClass();
        string Name = "";
        string Email = "";
        string Massage = "";

        if (Request.Form["Name"] != "" && Request.Form["Name"] != null)
        {
            Name = Request.Form["Name"];
        }
        if (Request.Form["Email"] != "" && Request.Form["Email"] != null)
        {
            Email = Request.Form["Email"];
        }
        if (Request.Form["Massage"] != "" && Request.Form["Massage"] != null)
        {
            Massage = Request.Form["Massage"];
        }
        string ANS="N";
        if (Name != "" && Email != "" && Massage != "")
        {
            string str = "Enquiry Received from <br>";
            str = str + "Name :" + Name+"<br>";
            str = str + "Email :" + Email+"<br>";
            str = str + "Message :" + Massage+"<br>";

            ANS = SendContactUsEmail("task@russsh.com", Name, str);
        }

        if (ANS == "Y")
        {
            ErrorHeading.InnerHtml = "Enquiry Sent Successfully.";
            ErrorDescription.InnerHtml = "<b style='color:green;'>Thank You for your enquiry. We will get back to you shortly.</b>";
        }
        else
        {
            ErrorHeading.InnerHtml = "Enquiry Failed .";
            ErrorDescription.InnerHtml = "<b style='color:red;'>Sorry! Something went wrong. Please check all entries and try again.</b>";
        }


    }


public string SendContactUsEmail(string RecipantEmailID, string RecipantName, string EmailBody)
    {
        string ans = "N";


        MailAddress from = new MailAddress("task@russsh.com", "RUSSSH");
        MailAddress toemail = new MailAddress(RecipantEmailID, RecipantName);

        System.Net.Mail.MailMessage Email1 = new System.Net.Mail.MailMessage(from, toemail);

        Email1.Subject = "New Enquiry Received ";

        Email1.Body = EmailBody;
        Email1.IsBodyHtml = true;


        Email1.Sender = new MailAddress("task@russsh.com", "RUSSSH");
        Email1.Priority = System.Net.Mail.MailPriority.High;
        System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient();
        System.Net.NetworkCredential basicAuthenticationInfo = new System.Net.NetworkCredential("task@russsh.com", "Business1380");
        mailClient.UseDefaultCredentials = false;
        mailClient.Host = "smtp.gmail.com";
        mailClient.Port = 587;
        mailClient.EnableSsl = true;
        mailClient.Credentials = basicAuthenticationInfo;

        try
        {
            mailClient.Send(Email1);
            ans = "Y";
        }
        catch (Exception ee)
        {
           // error = ee.ToString();
            ans = "N";
        }


        return ans;
    }
}