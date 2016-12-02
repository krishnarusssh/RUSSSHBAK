using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using ASPSnippets.GoogleAPI;
using System.Web.Script.Serialization;
public partial class googletest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GoogleConnect.ClientId = "91098301541-s3bl45ll36gqgntna70h05buolath3jv.apps.googleusercontent.com";
        GoogleConnect.ClientSecret = "ePZO2QHUiEu-DDLOy4syg2MY";
        GoogleConnect.RedirectUri = Request.Url.AbsoluteUri.Split('?')[0];
        if (!IsPostBack == true)
        {


           //from Google



            if (!string.IsNullOrEmpty(Request.QueryString["code"]))
            {
                string code = Request.QueryString["code"];
                string json = GoogleConnect.Fetch("me", code);
                GoogleProfile profile = new JavaScriptSerializer().Deserialize<GoogleProfile>(json);
                lblId.Text = profile.Id;
                lblName.Text = profile.DisplayName;
                lblEmail.Text = profile.Emails.Find(email => email.Type == "account").Value;
                lblGender.Text = profile.Gender;
                lblType.Text = profile.ObjectType;
                ProfileImage.ImageUrl = profile.Image.Url;
                pnlProfile.Visible = true;
                btnLogin.Enabled = false;
            }
                if (Request.QueryString["error"] == "access_denied")
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
                }
          
           

        }
    }

    protected void Login(object sender, EventArgs e)
    {
        GoogleConnect.Authorize("profile", "email");
    }
    protected void Clear(object sender, EventArgs e)
    {
        GoogleConnect.Clear();
    }





    public class GoogleProfile
    {
        public string Id { get; set; }
        public string DisplayName { get; set; }
        public Image Image { get; set; }
        public List<Email> Emails { get; set; }
        public string Gender { get; set; }
        public string ObjectType { get; set; }
    }

    public class Email
    {
        public string Value { get; set; }
        public string Type { get; set; }
    }

    public class Image
    {
        public string Url { get; set; }
    }
}

