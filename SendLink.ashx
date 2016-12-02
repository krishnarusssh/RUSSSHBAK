<%@ WebHandler Language="C#" Class="SendLink" %>

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
using System.Web.UI;
using System.Drawing;
using System.Configuration;
using System.Security.Cryptography;
using System.Configuration;

public class SendLink : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
       string MobileNo = "";
       
        if (context.Request.QueryString["M"] != "" && context.Request.QueryString["M"] != null)
        {
            MobileNo = context.Request.QueryString["M"];
            if (MobileNo != "")
            {
                WebClient client = new WebClient();
                client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");

              //string MessagePart = context.Server.UrlEncode("Welcome to RUSSSH here's the link for the App - https://goo.gl/EhOvRK");
string MessagePart = context.Server.UrlEncode("Welcome to RUSSSH here's the link for the App - https://play.google.com/store/apps/details?id=com.russsh.admin.russsh");
                Stream data = client.OpenRead("http://enterprise.smsgupshup.com/GatewayAPI/rest?method=SendMessage&send_to=" + MobileNo + "&msg=" + MessagePart + "&msg_type=TEXT&userid=2000148575&auth_scheme=plain&password=getmypeon&v=1.1&format=text");
                StreamReader reader = new StreamReader(data);
                string s = reader.ReadToEnd();
                Console.WriteLine(s);
                data.Close();
                reader.Close();
                context.Response.Redirect("default.aspx");
            }
            else
            {
                context.Response.Redirect("index.html");
            }
            
            
            
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}