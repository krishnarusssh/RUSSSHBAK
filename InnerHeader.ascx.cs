using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InnerHeader : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack == true)
        {
             if (Session["CLIENT_ID"] != null)
                {
                    sidemenu.Visible = true;
                    namelink.InnerHtml = "<img src='https://www.russsh.com/images1/menu.png' style='margin-top:-2px;' />&nbsp;Hi," + Session["CLIENT_NAME"].ToString();
                    loginsignuplabel.Visible = false;
                }
                else
                {
                    sidemenu.Visible = false;
                   
                    loginsignuplabel.Visible = true;
                }
        }
    }
}