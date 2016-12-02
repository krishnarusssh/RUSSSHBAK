using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Wallet_Add_Fund : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if (!IsPostBack == true)
        {
            if (Session["CLIENT_ID"] == null)
            {
                Response.Redirect("../");
            }
        }
    }
    protected void btn500_Click(object sender, EventArgs e)
    {

    }
}