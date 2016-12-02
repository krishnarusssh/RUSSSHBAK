using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test : System.Web.UI.Page
{
      protected void Page_Load(object sender, EventArgs e)
    {
        string cid = Request.QueryString["CLIENT_ID"];
        string ccontact = Request.QueryString["CLIENT_CONTACT"];
        string cname = Request.QueryString["CLIENT_NAME"];

        
 string type = "";
        if (Request.QueryString["type"] != "" && Request.QueryString["type"] != null)
        {
            type = Request.QueryString["type"];
 Session["ProfilePic"]="none";
            if (type == "Test")
            {
                // CLIENT_ID=&CLIENT_CONTACT=&CLIENT_NAME=&APPID="+ Id +"&type=Test
                
                Session["PlatForm"] = "F";
                Session["AppID"] = Request.QueryString["APPID"]; ;
                Session["Email"] = Request.QueryString["Email"];
                Session["Name"] = Request.QueryString["CLIENT_NAME"];
                Session["ProfilePic"]=Request.QueryString["pu"];
                Response.Redirect("https://www.russsh.com/signin/LinkYourAccount.aspx");
            }
 if(type == "Gmail")
                        {
                           Session["PlatForm"] = "G";
                        Session["AppID"] = Request.QueryString["APPID"]; ;
                        Session["Email"] = Request.QueryString["Email"];
                        Session["Name"] = Request.QueryString["CLIENT_NAME"];
                        Response.Redirect("https://www.russsh.com/signin/LinkYourAccount.aspx");
                         
                        }
else
{
    
                    Session["CLIENT_ID"] = cid;
                    Session["CLIENT_CONTACT"] = ccontact;
                    Session["CLIENT_NAME"] = cname;
                    Response.Redirect("../BookTask/");
        
}
        }
 else
        {
            if (Session != null)
            {
                if (Session["CLIENT_ID"] == null)
                {
                    Session["CLIENT_ID"] = cid;
                    Session["CLIENT_CONTACT"] = ccontact;
                    Session["CLIENT_NAME"] = cname;
                    Response.Redirect("../BookTask/");
                }
            }
         
        }
        
    }
     
}