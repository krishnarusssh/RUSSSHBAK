<%@ WebHandler Language="C#" Class="Signin" %>

using System;
using System.Web;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.SessionState;

public class Signin : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        DefaultClass DefObj = new DefaultClass();
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        string error = "";
        string Name = " ";
        string Password = " ";
        string Email = " ";
        string Mobile = " ";
        string successFlag = "";
        string AccountID = "";
        con.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
        if (context.Request.QueryString["Name"] != "" && context.Request.QueryString["Name"] != null)
        {
            Name = context.Request.QueryString["Name"];
        }
        if (context.Request.QueryString["Password"] != "" && context.Request.QueryString["Password"] != null)
        {
            Password = context.Request.QueryString["Pass"];
        }
        if (context.Request.QueryString["Email"] != "" && context.Request.QueryString["Email"] != null)
        {
            Email = context.Request.QueryString["Email"];
        }
        if (context.Request.QueryString["Mobile"] != "" && context.Request.QueryString["Mobile"] != null)
        {
            Mobile = context.Request.QueryString["Mobile"];
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
        ds = DefObj.RegisterWebClient(0, FName, LName, Email, Password, actcode, mootp, "I", "", "", "N", Mobile);
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                successFlag = ds.Tables[0].Rows[0].ItemArray[0].ToString();
                AccountID = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                ClientId = ds.Tables[0].Rows[0].ItemArray[1].ToString();
            }
        }

        if (successFlag == "Y")
        {
            if (mootp != "")
            {
                //Send Message

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

            //    divtop.Visible = false;
            //    validationsection.Visible = true;


           ///}
            //else if (successFlag == "E")
            //{
            //    Session["REG_FLAG"] = "E";
            //    Session["MESSAGE_HEADER"] = "Already Registered.";
            //    Session["MESSAGE_TEXT"] = "Oops! This mobile number has already been registered with us. If you have forgotten your username or password <a href='../forget-password/'>CLICK HERE</a> or try registering with a different number.";
            //    Response.Redirect("~/message_confirmation");
            //}
            //else if (successFlag == "N")
            //{
            //    Session["REG_FLAG"] = "N";
            //    Session["MESSAGE_HEADER"] = "Registration Failed";
            //    Session["MESSAGE_TEXT"] = "Hi,There are some issue setting up this account. Please try again or contact us! ";
            //    Response.Redirect("~/message_confirmation");      //}
        
        }
        context.Response.Write(mootp + "," + successFlag + "," + ClientId);
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}