using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class signup_confirmation_Default : System.Web.UI.Page
{
    CrmClass ObjCRM = new CrmClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        string FName = "";
        string LName = "";
        string EmailId = "";
        string Mobile = "";
        string Password = "";
        if (Request.Form["FName"] != "" && Request.Form["FName"] != null)
        {
            FName = Request.Form["FName"];
        }
        if (Request.Form["LName"] != "" && Request.Form["LName"] != null)
        {
            LName = Request.Form["LName"];
        }
        if (Request.Form["EmailId"] != "" && Request.Form["EmailId"] != null)
        {
            EmailId = Request.Form["EmailId"];
        }
        if (Request.Form["MNumber"] != "" && Request.Form["MNumber"] != null)
        {
            Mobile = Request.Form["MNumber"];
        }
        if (Request.Form["Password"] != "" && Request.Form["Password"] != null)
        {
            Password = Request.Form["Password"];
        }
        DataSet dssss = ObjCRM.SaveClient(FName, LName, EmailId, Mobile, Password);
        string status = " ";
        if (dssss.Tables.Count > 0)
        {
            if (dssss.Tables[0].Rows.Count > 0)
            {
                status = dssss.Tables[0].Rows[0].ItemArray[0].ToString();
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