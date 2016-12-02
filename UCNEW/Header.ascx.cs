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
            
		 string sPath = System.Web.HttpContext.Current.Request.Url.AbsolutePath;
            sPath = sPath.Replace("/", "$");
            sPath = sPath.ToString().ToLower();
          
            if (sPath == "$default.aspx")
            { 
              home_link.Attributes["class"] = "active";
                lastmile_link.Attributes["class"] = "";
                 pricing_link.Attributes["class"] = "";
                 help_link.Attributes["class"] = "";
                 contactus_link.Attributes["class"] = "";
                 offer_link.Attributes["class"] = "";
		 service_link.Attributes["class"] ="";
               
            }
            if (sPath == "$contact-us$default.aspx")
            {
                home_link.Attributes["class"] = "";
                lastmile_link.Attributes["class"] = "";
                pricing_link.Attributes["class"] = "";
                help_link.Attributes["class"] = "";
                contactus_link.Attributes["class"] = "active";
                offer_link.Attributes["class"] = "";
		service_link.Attributes["class"] ="";

            }
            if (sPath == "$help-center$default.aspx")
            {
                home_link.Attributes["class"] = "";
                lastmile_link.Attributes["class"] = "";
                pricing_link.Attributes["class"] = "";
                help_link.Attributes["class"] = "active";
                contactus_link.Attributes["class"] = "";
                offer_link.Attributes["class"] = "";
		service_link.Attributes["class"] ="";

            }
            if (sPath == "$pricing$default.aspx")
            {
                home_link.Attributes["class"] = "";
                lastmile_link.Attributes["class"] = "";
                pricing_link.Attributes["class"] = "active";
                help_link.Attributes["class"] = "";
                contactus_link.Attributes["class"] = "";
              offer_link.Attributes["class"] = "";
		service_link.Attributes["class"] ="";

            }
            if (sPath == "$for-business$default.aspx")
            {
                home_link.Attributes["class"] = "";
                lastmile_link.Attributes["class"] = "active";
                pricing_link.Attributes["class"] = "";
                help_link.Attributes["class"] = "";
                contactus_link.Attributes["class"] = "";
              offer_link.Attributes["class"] = "";
		service_link.Attributes["class"] ="";

            }
            if (sPath == "$offers$default.aspx")
            {
                home_link.Attributes["class"] = "";
                lastmile_link.Attributes["class"] = "";
                pricing_link.Attributes["class"] = "";
                help_link.Attributes["class"] = "";
                contactus_link.Attributes["class"] = "";
              offer_link.Attributes["class"] = "active";
 		service_link.Attributes["class"] ="";

            }
	    if (sPath.Contains("$services$") == true)
            {
                home_link.Attributes["class"] = "";
                lastmile_link.Attributes["class"] = "";
                pricing_link.Attributes["class"] = "";
                help_link.Attributes["class"] = "";
                contactus_link.Attributes["class"] = "";
               offer_link.Attributes["class"] = "";
 		 service_link.Attributes["class"] = "active";
            }




	    if (Session != null)
            {
                if (Session["CLIENT_NAME"] == null || Session["CLIENT_NAME"]=="")
                {
                    Session["CLIENT_ID"] = "";
                    Session["CLIENT_CONTACT"] = "";
                    Session["CLIENT_NAME"] = "";
                    profilemenu.Visible = false;
                    loginlink.Visible = true;
		    trackinglogin.Visible = true;
                    booktasklink.InnerHtml = "<a href='#' data-toggle='modal' data-target='#login'>BOOK NOW</a>";
		  
                    headergrid.Attributes["class"] = "col-md-12";
                   rightsidelogin.Visible = true;
                }
                else
                {
                    if (Session["CLIENT_NAME"].ToString().Length > 10)
                    {
                        loggedInUserName.InnerHtml =  Session["CLIENT_NAME"].ToString().Substring(0,8)+"..";
                    }
                    else
                    {
                        loggedInUserName.InnerHtml = Session["CLIENT_NAME"].ToString();
                    }
                   rightsidelogin.Visible = false;
                    profilemenu.Visible = true;
                    loginlink.Visible = false;
                    trackinglogin.Visible = false;
                    booktasklink.InnerHtml = "<a href='https://www.russsh.com/BookTask'>BOOK NOW</a>";
                    headergrid.Attributes["class"] = "col-md-11";
       
                }
            }
	    
              

        }
           
    }
}