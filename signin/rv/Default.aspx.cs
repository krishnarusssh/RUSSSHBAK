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

public partial class signin_signin : System.Web.UI.Page
{
    DataSet ds;
    CrmClass CrmObj = new CrmClass(); CrmClass CrmOBJ = new CrmClass();
    string[] spiltstr;
    string clientid;
    protected void Page_Load(object sender, EventArgs e)
    {


        FaceBookConnect.API_Key = "337488946374891";
        FaceBookConnect.API_Secret = "179dbd85ce3d835f9414ef3ac486e502";


        if (!IsPostBack == true)
        {

            if (Convert.ToInt32(clientid) > 0)
            {
                Response.Redirect("../ViewProfile/");
            }
            
/*

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

            string code = Request.QueryString["code"];
            if (!string.IsNullOrEmpty(code))
            {
                string data = FaceBookConnect.Fetch(code, "me");
  		 Session["FBCODE"] = Request.QueryString["code"];
                FaceBookUser faceBookUser = new JavaScriptSerializer().Deserialize<FaceBookUser>(data);
                faceBookUser.PictureUrl = string.Format("https://graph.facebook.com/{0}/picture", faceBookUser.Id);

                Response.Redirect("../ProcessSocialLogin/Process.aspx?Email=" + faceBookUser.Email + "&Name=" + faceBookUser.Name);

            }

*/
           
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
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        ds = CrmObj.ValidateClientLogin(txtEmail.Text.Trim(), txtPassword.Text);
        string ans = "";
        string ClientID = "0";
        string ClientName = "";
        string ClientContact = "";

        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
               if (ds.Tables[0].Rows[0].ItemArray[0].ToString() == "Y")
                {
                    ans = "Y";
                    ClientID = ds.Tables[0].Rows[0].ItemArray[1].ToString();
                    ClientName = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                    ClientContact = ds.Tables[0].Rows[0].ItemArray[3].ToString();

                    Session["CLIENT_ID"] = ClientID;
                    Session["CLIENT_EMAIL"] = txtEmail.Text;
                    Session["CLIENT_CONTACT"] = ClientContact;
                    Session["CLIENT_NAME"] = ClientName;

                }
                else
                {
                    ans = "N";
                    ClientID = "0";
                    ClientName = "";
                    ClientContact = "";
                    Session["CLIENT_ID"] = "0";
                    Session["CLIENT_EMAIL"] = "";
                    Session["CLIENT_CONTACT"] = "";
                    Session["CLIENT_NAME"] = "";
                }
            }
        }
        if (ans == "Y")
        {
            HttpCookie logincookie = new HttpCookie("LOGINCOOKIE");
            //Set the cookies value
            logincookie.Value = ClientID + "-" + ClientName + "-" + ClientContact + "-" + txtEmail.Text;
            logincookie.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(logincookie);

            HttpCookie loginname = new HttpCookie("LOGINNAME");
            loginname.Value = ClientName;
            loginname.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(loginname);


            ClientScript.RegisterStartupScript(GetType(), "hwa", "setCookie('" + "LOGINCOOKIE" + "','" + ClientID + "-" + ClientName + "-" + ClientContact + "-" + txtEmail.Text + "',1);", true);
            ClientScript.RegisterStartupScript(GetType(), "hwa", "setCookie('" + "LOGINNAME" + "','" + ClientName + "',1);", true);
            Response.Redirect("../ViewProfile");
        }
        else
        {
            lblError.InnerHtml = "Unauthorised Login Detected!";

        }
    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Response.Redirect("../SignUp");
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
