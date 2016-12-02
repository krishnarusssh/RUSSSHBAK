using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Header : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
         if (!Page.IsPostBack)
        {
            if (Session != null)
            {
                if (Session["CLIENT_NAME"] == null || Session["CLIENT_NAME"]=="")
                {
                    Session["CLIENT_ID"] = "";
                    Session["CLIENT_CONTACT"] = "";
                    Session["CLIENT_NAME"] = "";
                    profilemenu.Visible = false;
                    loginlink.Visible = true;
                      booktasklink.InnerHtml = "<a href='#' data-toggle='modal' data-target='#login'>BOOK NOW</a>";
		  
                    headergrid.Attributes["class"] = "col-md-12";
                   
                }
                else
                {
                    if (Session["CLIENT_NAME"].ToString().Length > 10)
                    {
                        loggedInUserName.InnerHtml = " Member";
                    }
                    else
                    {
                        loggedInUserName.InnerHtml = Session["CLIENT_NAME"].ToString();
                    }
                   
                    profilemenu.Visible = true;
                    loginlink.Visible = false;
                    booktasklink.InnerHtml = "<a href='https://www.russsh.com/BookTask'>BOOK NOW</a>";
                    headergrid.Attributes["class"] = "col-md-11";
       
                }
            }
        }
           
    }
}