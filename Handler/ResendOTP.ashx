<%@ WebHandler Language="C#" Class="ResendOTP" %>
using System;
using System.Web;
using System.Data;
using System.Text;

public class ResendOTP : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string mootp = "";
        string ClientId = "";
        string Name = " ";
        string Mobile = " ";
        Random r = new Random();
        int randNum = r.Next(10000);
        string FiveDigitNumber = randNum.ToString("D6");
        mootp = FiveDigitNumber;
        
        if (context.Request.QueryString["Name"] != "" && context.Request.QueryString["Name"] != null)
        {
            Name = context.Request.QueryString["Name"];
        }
         
        if (context.Request.QueryString["Mobile"] != "" && context.Request.QueryString["Mobile"] != null)
        {
            Mobile = context.Request.QueryString["Mobile"];
        }
        if (Mobile != "" && Name != "")
        {
            System.Net.WebClient client = new System.Net.WebClient();
            client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");

            string DestinationMobile = Mobile;
            string MessagePart = "Dear " + Name + " The OTP for sign up to russsh.com is  " + mootp;

            System.IO.Stream data = client.OpenRead("http://enterprise.smsgupshup.com/GatewayAPI/rest?method=SendMessage&send_to=" + DestinationMobile + "&msg=" + MessagePart + "&msg_type=TEXT&userid=2000148575&auth_scheme=plain&password=getmypeon&v=1.1&format=text");
            System.IO.StreamReader reader = new System.IO.StreamReader(data);
            string s = reader.ReadToEnd();
            Console.WriteLine(s);
            data.Close();
            reader.Close();
        }
        context.Response.Write(mootp);
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}