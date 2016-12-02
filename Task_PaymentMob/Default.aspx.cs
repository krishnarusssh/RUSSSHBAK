using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Collections.Specialized;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using System.Net.Mail;
using System.Configuration;

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
            Response.Write("<script> document.getElementById('form1').submit(); </script>");





        }
    }
}