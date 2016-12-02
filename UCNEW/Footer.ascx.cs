using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
 
using System.Collections.Specialized;
using System.Web.Script.Serialization;
using System.Data;
using System.Data.SqlClient;
using ASPSnippets.GoogleAPI;

public partial class UserControls_Footer : System.Web.UI.UserControl
{
    DefaultClass ObjDef = new DefaultClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        GoogleConnect.ClientId = "91098301541-s3bl45ll36gqgntna70h05buolath3jv.apps.googleusercontent.com";
        GoogleConnect.ClientSecret = "ePZO2QHUiEu-DDLOy4syg2MY";
        GoogleConnect.RedirectUri = "https://www.russsh.com/GoogleReturn.aspx";
	SetFacebookData();
        if (!Page.IsPostBack)
        {
            if (Session != null)
            {
                if (Session["CLIENT_ID"] == null)
                {
                    Session["CLIENT_ID"] = "";
                    Session["CLIENT_CONTACT"] = "";
                    Session["CLIENT_NAME"] = "";
                }
            }
        }
    }


    public void SetFacebookData()
    {
        string Email = "";
        string Name = "";
        string Id = "";
        string BDate = "";
        string gender = "";
string profilepic="";
        if (Request.QueryString["code"] != null)
        {

            FacebookManager objFBMgr = new FacebookManager();
            string accesstoken = objFBMgr.GetAccessToken(Request.QueryString["code"], "Default.aspx");
            string userDetails = objFBMgr.GetUserDetails(accesstoken);
            if (userDetails != "")
            {
                JavaScriptSerializer serializer1 = new JavaScriptSerializer();
                List<UserDetails1> listUserDetails = serializer1.Deserialize<List<UserDetails1>>("[" + HttpUtility.HtmlDecode(userDetails) + "]");
                Email = listUserDetails[0].email;
                Name = listUserDetails[0].name;
                Id = listUserDetails[0].id;
                BDate= listUserDetails[0].birthday;
                gender = listUserDetails[0].gender;
               // profilepic=listUserDetails[0].PictureUrl;
                DataSet ds = new DataSet();
                ds= ObjDef.CheckSocialLogin(Id.ToString(), "F");
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        if (ds.Tables[0].Rows[0].ItemArray[0].ToString() == "Y")
                        {
                           Session["CLIENT_ID"] = ds.Tables[0].Rows[0].ItemArray[1].ToString();
                           Session["CLIENT_CONTACT"] = ds.Tables[0].Rows[0].ItemArray[3].ToString();
                           Session["CLIENT_NAME"] = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                           Session["CLIENT_EMAIL"] = ds.Tables[0].Rows[0].ItemArray[4].ToString();
 //Session["CLIENT_PIC"]=profilepic;
                           string url = "http://www.russsh.com/about-us/Test.aspx?CLIENT_ID=" + ds.Tables[0].Rows[0].ItemArray[1].ToString() + "&CLIENT_CONTACT=" + ds.Tables[0].Rows[0].ItemArray[3].ToString() + "&CLIENT_NAME=" + ds.Tables[0].Rows[0].ItemArray[2].ToString() + "&type=d&pic="+profilepic;
                           Response.Redirect(url);
                          
                        }
                        else
                        {
     
                            //txtsname.Value = Name;
                            //txtsemail.Value = Email;
                            Response.Redirect("http://www.russsh.com/about-us/Test.aspx?CLIENT_ID=" + ds.Tables[0].Rows[0].ItemArray[1].ToString() + "&CLIENT_CONTACT=" + ds.Tables[0].Rows[0].ItemArray[3].ToString() + "&CLIENT_NAME=" + Name + "&APPID=" + Id + "&type=Test&source=F&Email=" + Email + "");
                           // Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "onsign();", true);
                        }
                    }
                }
            }
        }

    }
   
 protected void GLogin_Click(object sender, EventArgs e)
    {
        GoogleConnect.Authorize("profile", "email");
    }

}
public class UserDetails1
{
    public UserDetails1() { }
    public string id { get; set; }
    public string name { get; set; }
    public string first_name { get; set; }
    public string last_name { get; set; }
    public string birthday { get; set; }
    public string gender { get; set; }
    public string email { get; set; }
    public string profilepic {get; set;}
}
