using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Task_Payment_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string BookingID = "";

            if (Request.QueryString["NEWBOOKINGID"] != "" && Request.QueryString["NEWBOOKINGID"] != null)
            {
                BookingID = Request.QueryString["NEWBOOKINGID"].ToString();
            }
            else
            if (Session["NEWBOOKINGID"] != null)
            {
                BookingID = Session["NEWBOOKINGID"].ToString();
            }


        }
    }
}