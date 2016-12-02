using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class singin_confirmation_Default : System.Web.UI.Page
{
    CrmClass CRMObj = new CrmClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        string EmialId = "";
        string Password = "";
        if (Request.Form["EmailID"] != "" && Request.Form["EmailID"] != null)
                {
                    EmialId = Request.Form["EmailID"];
                }
        if (Request.Form["Password"] != "" && Request.Form["Password"] != null)
        {
            Password = Request.Form["Password"];
        }
        DataSet dsssr = CRMObj.ValidateClientLogin(EmialId, Password);
        string status = " ";
        if (dsssr.Tables.Count > 0)
        {
            if (dsssr.Tables[0].Rows.Count > 0)
            {
                status = dsssr.Tables[0].Rows[0].ItemArray[0].ToString();
            }
        }
        if (status == "Y")
        {
             ErrorHeading.InnerText = "Login Sucessfull...";
        }
        else
        {
            ErrorHeading.InnerText = "Error In Login Credentials...";
            ErrorDescription.InnerText = "Fail to login with provieded EmailId and Password Please Login Again ";
        }

    }
}