using System;
using System.Data;

public partial class WebMethod : System.Web.UI.Page
{
      
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [System.Web.Services.WebMethod()]
    // IMPORTANT: pass the parameter by querystring
    [System.Web.Script.Services.ScriptMethod(UseHttpGet = true)]
    public static string TestParGet(int id)
    {
      WebMethodClass ObjWeb = new WebMethodClass();
      string ans = "N";
      string mobileNo = "";
      string OTP = "";
      string Email = "";
      DataSet dsTracking = ObjWeb.ValidateTaskid(Convert.ToInt32(id.ToString()));
         if (dsTracking.Tables.Count > 0)
         {
             if (dsTracking.Tables[0].Rows.Count > 0)
             {
                 try
                 {
                     ans = dsTracking.Tables[0].Rows[0].ItemArray[0].ToString();
                     mobileNo = dsTracking.Tables[0].Rows[0].ItemArray[1].ToString();
                     OTP = dsTracking.Tables[0].Rows[0].ItemArray[2].ToString();
                     Email = dsTracking.Tables[0].Rows[0].ItemArray[3].ToString();
                     if (ans == "Y")
                     {
                         /// Sms OTP
                         //System.Net.WebClient client = new System.Net.WebClient();
                         //client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");

                         //string DestinationMobile = mobileNo;
                         //string MessagePart = "Hi "+ mobileNo +",Your One Time Password is " + OTP +" Please enter this OTP on the Russsh.com website and follow the on-screen instructions.";

                         //System.IO.Stream data = client.OpenRead("http://enterprise.smsgupshup.com/GatewayAPI/rest?method=SendMessage&send_to=" + DestinationMobile + "&msg=" + MessagePart + "&msg_type=TEXT&userid=2000148575&auth_scheme=plain&password=getmypeon&v=1.1&format=text");
                         //System.IO.StreamReader reader = new System.IO.StreamReader(data);
                         //string s = reader.ReadToEnd();
                         //Console.WriteLine(s);
                         //data.Close();
                         //reader.Close();

                         /// OTP EMAIL

                         //// System.Net.Mail.MailMessage Email1 = new System.Net.Mail.MailMessage("contact@getmypeon.com", "chandsitare7@gmail.com");
                         //System.Net.Mail.MailMessage Email1 = new System.Net.Mail.MailMessage();

                         ////  Email1.From = new System.Net.Mail.MailAddress("task@russsh.com", "Russsh");

                         //Email1.From = new System.Net.Mail.MailAddress("\"Russsh\" <task@russsh.com>");
                         //Email1.To.Add(Email);
                         //Email1.CC.Add("support@russsh.com");
                         //Email1.Subject = "OTP for Russsh Forgot Password";
                         //string str = "Dear " + Email + " The OTP for forgot password to russsh.com is  " + OTP;


                         //Email1.Body = str;
                         //Email1.IsBodyHtml = true;
                         //Email1.ReplyToList.Add("task@russsh.com");
                         //Email1.Headers.Add("Reply-To", "task@russsh.com");
                         //Email1.Sender = new System.Net.Mail.MailAddress("task@russsh.com", "Russsh");
                         //Email1.Priority = System.Net.Mail.MailPriority.High;
                         //System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient();
                         ////System.Net.NetworkCredential basicAuthenticationInfo = new System.Net.NetworkCredential("contact@getmypeon.com", "Business1380");
                         //System.Net.NetworkCredential basicAuthenticationInfo = new System.Net.NetworkCredential("task@russsh.com", "Business1380");
                         //mailClient.UseDefaultCredentials = true;
                         //mailClient.Host = "smtp.gmail.com";
                         //mailClient.Port = 587;
                         //mailClient.EnableSsl = true;

                         //mailClient.Credentials = basicAuthenticationInfo;
                         
                     }
                 }
                 catch (Exception)
                 {
                     ans = "N";
                     mobileNo = "";
                     OTP = "";
                    // throw;
                 }
             }
         }
        return "" + ans+","+mobileNo+","+OTP;
    }


    [System.Web.Services.WebMethod()]
    // IMPORTANT: pass the parameter by querystring
    [System.Web.Script.Services.ScriptMethod(UseHttpGet = true)]
    public static string CheckOTP(int Taskid,int otp)
    {
        WebMethodClass ObjWeb = new WebMethodClass();
        string ans1 = "N";
        DataSet Dso = ObjWeb.CheckOTP(Convert.ToInt32(Taskid.ToString()),Convert.ToInt32(otp.ToString()));
        if (Dso.Tables.Count > 0)
        {
            if (Dso.Tables[0].Rows.Count > 0)
            {
                ans1 = Dso.Tables[0].Rows[0].ItemArray[0].ToString();
            }
        }
        return ans1;
    }


    [System.Web.Services.WebMethod()]
    // IMPORTANT: pass the parameter by querystring
    [System.Web.Script.Services.ScriptMethod(UseHttpGet = true)]
    public static string SendOTP(int id)
    {
        WebMethodClass ObjWeb = new WebMethodClass();
        string ans = "N";
        string mobileNo = "";
        string OTP = "";
        string Email = "";
        DataSet dsTracking = ObjWeb.SendOTP(Convert.ToInt32(id.ToString()));
        if (dsTracking.Tables.Count > 0)
        {
            if (dsTracking.Tables[0].Rows.Count > 0)
            {
                try
                {
                    ans = dsTracking.Tables[0].Rows[0].ItemArray[0].ToString();
                    mobileNo = dsTracking.Tables[0].Rows[0].ItemArray[1].ToString();
                    OTP = dsTracking.Tables[0].Rows[0].ItemArray[2].ToString();
                    Email = dsTracking.Tables[0].Rows[0].ItemArray[3].ToString();
                    if (ans == "Y")
                    {
                        /// Sms OTP
                        System.Net.WebClient client = new System.Net.WebClient();
                        client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");

                        string DestinationMobile = mobileNo;
                        string MessagePart = "Hi " + mobileNo + ",Your One Time Password is " + OTP + " Please enter this OTP on the Russsh.com website and follow the on-screen instructions.";

                        System.IO.Stream data = client.OpenRead("http://enterprise.smsgupshup.com/GatewayAPI/rest?method=SendMessage&send_to=" + DestinationMobile + "&msg=" + MessagePart + "&msg_type=TEXT&userid=2000148575&auth_scheme=plain&password=getmypeon&v=1.1&format=text");
                        System.IO.StreamReader reader = new System.IO.StreamReader(data);
                        string s = reader.ReadToEnd();
                        Console.WriteLine(s);
                        data.Close();
                        reader.Close();

                        /// OTP EMAIL

                        //// System.Net.Mail.MailMessage Email1 = new System.Net.Mail.MailMessage("contact@getmypeon.com", "chandsitare7@gmail.com");
                        //System.Net.Mail.MailMessage Email1 = new System.Net.Mail.MailMessage();

                        ////  Email1.From = new System.Net.Mail.MailAddress("task@russsh.com", "Russsh");

                        //Email1.From = new System.Net.Mail.MailAddress("\"Russsh\" <task@russsh.com>");
                        //Email1.To.Add(Email);
                        //Email1.CC.Add("support@russsh.com");
                        //Email1.Subject = "OTP for Russsh Forgot Password";
                        //string str = "Dear " + Email + " The OTP for forgot password to russsh.com is  " + OTP;


                        //Email1.Body = str;
                        //Email1.IsBodyHtml = true;
                        //Email1.ReplyToList.Add("task@russsh.com");
                        //Email1.Headers.Add("Reply-To", "task@russsh.com");
                        //Email1.Sender = new System.Net.Mail.MailAddress("task@russsh.com", "Russsh");
                        //Email1.Priority = System.Net.Mail.MailPriority.High;
                        //System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient();
                        ////System.Net.NetworkCredential basicAuthenticationInfo = new System.Net.NetworkCredential("contact@getmypeon.com", "Business1380");
                        //System.Net.NetworkCredential basicAuthenticationInfo = new System.Net.NetworkCredential("task@russsh.com", "Business1380");
                        //mailClient.UseDefaultCredentials = true;
                        //mailClient.Host = "smtp.gmail.com";
                        //mailClient.Port = 587;
                        //mailClient.EnableSsl = true;

                        //mailClient.Credentials = basicAuthenticationInfo;

                    }
                }
                catch (Exception)
                {
                    ans = "N";
                    mobileNo = "";
                    OTP = "";
                    // throw;
                }
            }
        }
        return "" + ans + "," + mobileNo + "," + OTP;
    }


}