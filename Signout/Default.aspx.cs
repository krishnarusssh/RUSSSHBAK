using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASPSnippets.FaceBookAPI;
using System.Web.Script.Serialization;
using System.Net;
using System.IO;
public partial class Signout_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)



    {
        

	Session.Clear();

FaceBookConnect.API_Key = "337488946374891";
        FaceBookConnect.API_Secret = "179dbd85ce3d835f9414ef3ac486e502";
        //Set the cookies value
        try
        {
            try
            {
                  FaceBookConnect.Logout(Session["FBCODE"].ToString());
            }
            catch (Exception w3)
            {
            }
            try
            {

                WebClient client = new WebClient();
                client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                Stream data = client.OpenRead("https://accounts.google.com/Logout");
                StreamReader reader = new StreamReader(data);
                string s = reader.ReadToEnd();
                Console.WriteLine(s);
                data.Close();
                reader.Close();
                
                
                
            }
            catch (Exception w1)
            {
            }
          
            
            
            HttpCookie logincookie = Request.Cookies["LOGINCOOKIE"];
            logincookie.Expires = DateTime.Now.AddDays(-5);
            Response.Cookies.Add(logincookie);

            HttpCookie loginname = Request.Cookies["LOGINNAME"];
            loginname.Expires = DateTime.Now.AddDays(-5);
            Response.Cookies.Add(loginname);
        }
        catch (Exception e11)
        {
        }
      
     Response.Redirect("../");
    }
}