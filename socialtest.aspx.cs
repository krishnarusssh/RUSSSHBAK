using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using ASPSnippets.FaceBookAPI;
using System.Web.Script.Serialization;
public partial class socialtest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //FaceBookConnect.API_Key = "337488946374891";
        //FaceBookConnect.API_Secret = "179dbd85ce3d835f9414ef3ac486e502";
        FaceBookConnect.API_Key = "571340489679825";
        FaceBookConnect.API_Secret = "b291547ce3d0a6d05f3a681cf8763e95";
      
        if (!IsPostBack == true)
        {



            if (Request.QueryString["logout"] == "true")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User has logged out from Facebook')", true);
                return;
            }

            if (Request.QueryString["error"] == "access_denied")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User has denied access.')", true);
                return;
            }

            //from facebook
           
                string code = Request.QueryString["code"];
                if (!string.IsNullOrEmpty(code))
                {
                    string data = FaceBookConnect.Fetch(code, "me");
                    Session["FBCODE"] = Request.QueryString["code"];
                    FaceBookUser faceBookUser = new JavaScriptSerializer().Deserialize<FaceBookUser>(data);
                    faceBookUser.PictureUrl = string.Format("https://graph.facebook.com/{0}/picture", faceBookUser.Id);

                    Response.Write(faceBookUser.Name);
                }
           
         }
    }

   

    protected void Login(object sender, EventArgs e)
    {
        FaceBookConnect.Authorize("user_photos,email", Request.Url.AbsoluteUri.Split('?')[0]);
    }
    protected void Logout(object sender, EventArgs e)
    {
        FaceBookConnect.Logout(Request.QueryString["code"]);
    }


   
}
public class FaceBookUser
{
    public string Id { get; set; }
    public string Name { get; set; }
    public string UserName { get; set; }
    public string PictureUrl { get; set; }
    public string Email { get; set; }
}
