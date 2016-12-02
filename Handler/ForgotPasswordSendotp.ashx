<%@ WebHandler Language="C#" Class="ForgotPasswordSendotp" %>

using System;
using System.Web;
using System.Data;
using System.Text;

public class ForgotPasswordSendotp : IHttpHandler ,System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        DefaultClass DefObj = new DefaultClass();
        DataSet ds = new DataSet();
        string mootp = "";
        string ClientId = "";
        string type = " ";
        string destination = " ";
        Random r = new Random();
        int randNum = r.Next(10000);
        string FiveDigitNumber = randNum.ToString("D6");
        mootp = FiveDigitNumber;
        string ans = "";


        if (context.Request.QueryString["type"] != "" && context.Request.QueryString["type"] != null)
        {
            type = context.Request.QueryString["type"];
        }

        if (context.Request.QueryString["destination"] != "" && context.Request.QueryString["destination"] != null)
        {
            destination = context.Request.QueryString["destination"];
        }
        string successFlag = "";
        string Clientid = "";
        ds = DefObj.GetClientid(destination);
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                successFlag = ds.Tables[0].Rows[0].ItemArray[0].ToString();
                Clientid = ds.Tables[0].Rows[0].ItemArray[1].ToString();
                context.Session["CLIENT_ID"]  = Clientid;
            }
        }
        if (successFlag == "Y")
        {
            if (type == "Mobile")
            {
                System.Net.WebClient client = new System.Net.WebClient();
                client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                string Name = "User";
                string DestinationMobile = destination;
                //string MessagePart = "Dear " + User + " .The OTP for sign up to russsh.com is " + mootp;
                string MessagePart = "Dear " + Name + " The OTP for sign up to russsh.com is  " + mootp;

                System.IO.Stream data = client.OpenRead("http://enterprise.smsgupshup.com/GatewayAPI/rest?method=SendMessage&send_to=" + DestinationMobile + "&msg=" + MessagePart + "&msg_type=TEXT&userid=2000148575&auth_scheme=plain&password=getmypeon&v=1.1&format=text");
                System.IO.StreamReader reader = new System.IO.StreamReader(data);
                string s = reader.ReadToEnd();
                Console.WriteLine(s);
                data.Close();
                reader.Close();
                ans = "Y" + "," + mootp;
            }
            if (type == "Email")
            {

               

                // System.Net.Mail.MailMessage Email1 = new System.Net.Mail.MailMessage("contact@getmypeon.com", "chandsitare7@gmail.com");
                System.Net.Mail.MailMessage Email1 = new System.Net.Mail.MailMessage();

                //  Email1.From = new System.Net.Mail.MailAddress("task@russsh.com", "Russsh");

                Email1.From = new System.Net.Mail.MailAddress("\"Russsh\" <task@russsh.com>");
                Email1.To.Add(destination);
                Email1.CC.Add("support@russsh.com");
                Email1.Subject = "OTP for Russsh Forgot Password";
                string str = "Dear " + destination + " The OTP for forgot password to russsh.com is  " + mootp;


                Email1.Body = str;
                Email1.IsBodyHtml = true;
                Email1.ReplyToList.Add("task@russsh.com");
                Email1.Headers.Add("Reply-To", "task@russsh.com");
                Email1.Sender = new System.Net.Mail.MailAddress("task@russsh.com", "Russsh");
                Email1.Priority = System.Net.Mail.MailPriority.High;
                System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient();
                //System.Net.NetworkCredential basicAuthenticationInfo = new System.Net.NetworkCredential("contact@getmypeon.com", "Business1380");
                System.Net.NetworkCredential basicAuthenticationInfo = new System.Net.NetworkCredential("task@russsh.com", "Business1380");
                mailClient.UseDefaultCredentials = true;
                mailClient.Host = "smtp.gmail.com";
                mailClient.Port = 587;
                mailClient.EnableSsl = true;

                mailClient.Credentials = basicAuthenticationInfo;
                try
                {
                    mailClient.Send(Email1);
                    ans = "Y" + "," + mootp;
                }
                catch (Exception ee)
                {

                    ans = "N" + "," + mootp;
                }


            }
        }
        else
        {
            ans ="No"+","+mootp ;
        }

        context.Response.Write(ans);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}