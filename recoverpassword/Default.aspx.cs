using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class recoverpassword_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string Email = "";
        if (Request.Form["email"] != "" && Request.Form["email"] != null)
        {
            Email = Request.Form["email"];
        }
    }
}