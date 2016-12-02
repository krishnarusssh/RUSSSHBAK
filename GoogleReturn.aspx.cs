using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Net;
using System.IO;
using ASPSnippets.GoogleAPI;
using System.Web.Script.Serialization;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class GoogleReturn : System.Web.UI.Page
{
    DefaultClass ObjDef = new DefaultClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        GoogleConnect.ClientId = "91098301541-s3bl45ll36gqgntna70h05buolath3jv.apps.googleusercontent.com";
        GoogleConnect.ClientSecret = "ePZO2QHUiEu-DDLOy4syg2MY";
        GoogleConnect.RedirectUri =  "https://www.russsh.com/GoogleReturn.aspx";

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
            string Email = profile.Emails.Find(email => email.Type == "account").Value;
            string Name = profile.DisplayName;
            string Id = profile.Id;
            DataSet ds = new DataSet();
            ds = ObjDef.CheckSocialLogin(Id.ToString(), "G");

            //ProfileImage.ImageUrl = profile.Image.Url;
            //pnlProfile.Visible = true;
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (ds.Tables[0].Rows[0].ItemArray[0].ToString() == "Y")
                    {
                        Session["CLIENT_ID"] = ds.Tables[0].Rows[0].ItemArray[1].ToString();
                        Session["CLIENT_CONTACT"] = ds.Tables[0].Rows[0].ItemArray[3].ToString();
                        Session["CLIENT_NAME"] = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                        string url =  "https://www.russsh.com/about-us/Test.aspx?CLIENT_ID=" + ds.Tables[0].Rows[0].ItemArray[1].ToString() + "&CLIENT_CONTACT=" + ds.Tables[0].Rows[0].ItemArray[3].ToString() + "&CLIENT_NAME=" + ds.Tables[0].Rows[0].ItemArray[2].ToString() + "&type=d";
                        Response.Redirect(url);

                    }
                    else
                    {
                        //txtsname.Value = Name;
                        //txtsemail.Value = Email;
                        Response.Redirect("https://www.russsh.com/about-us/Test.aspx?CLIENT_ID=" + ds.Tables[0].Rows[0].ItemArray[1].ToString() + "&CLIENT_CONTACT=" + ds.Tables[0].Rows[0].ItemArray[3].ToString() + "&CLIENT_NAME=" + Name + "&APPID=" + Id + "&type=Gmail&source=G&Email=" + Email + "");
                        // Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "onsign();", true);
                    }
                }
            }
          
        }
        if (Request.QueryString["error"] == "access_denied")
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
        }
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