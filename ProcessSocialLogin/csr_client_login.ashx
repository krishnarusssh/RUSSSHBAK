<%@ WebHandler Language="C#" Class="csr_client_login" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class csr_client_login : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        CrmClass crm = new CrmClass();
        DataSet ds = new DataSet();
        string Email = "";
        string Name = "";
        string EmpID = "0";
        if (context.Request.QueryString["Email"] != "" && context.Request.QueryString["Email"] != null)
        {
            Email = context.Request.QueryString["Email"].ToString();
        }
        if (context.Request.QueryString["Name"] != "" && context.Request.QueryString["Name"] != null)
        {
            Name = context.Request.QueryString["Name"].ToString();
        }
        if (context.Request.QueryString["EmpID"] != "" && context.Request.QueryString["EmpID"] != null)
        {
            EmpID = context.Request.QueryString["EmpID"].ToString();
        }
        ds = crm.ValidateFBLogin(Email, Name);
        string ans = "";
        string ClientID = "0";
        string ClientName = "";
        string ClientContact = "";

        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0].ItemArray[0].ToString() == "Y")
                {
                    ans = "Y";
                    ClientID = ds.Tables[0].Rows[0].ItemArray[1].ToString();
                    ClientName = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                    ClientContact = ds.Tables[0].Rows[0].ItemArray[3].ToString();
                }
                else
                {
                    ans = "N";
                    ClientID = "0";
                    ClientName = "";
                    ClientContact = "";
                }
            }
        }


        if (ans == "Y")
        {
            HttpCookie logincookie = new HttpCookie("LOGINCOOKIE");
            //Set the cookies value
            logincookie.Value = ClientID + "-" + ClientName + "-" + ClientContact + "-" + Email + "-" + EmpID;
            logincookie.Expires = DateTime.Now.AddDays(1);
            context.Response.Cookies.Add(logincookie);

            HttpCookie loginname = new HttpCookie("LOGINNAME");
            loginname.Value = ClientName;
            loginname.Expires = DateTime.Now.AddDays(1);
            context.Response.Cookies.Add(loginname);


            // ClientScript.RegisterStartupScript(GetType(), "hwa", "setCookie('" + "LOGINCOOKIE" + "','" + ClientID + "-" + ClientName + "-" + ClientContact + "-" + Email + "',1);", true);
            // ClientScript.RegisterStartupScript(GetType(), "hwa", "setCookie('" + "LOGINNAME" + "','" + ClientName + "',1);", true);
            context.Response.Redirect("../BookTask");
        }
        else
        {

            context.Response.Redirect("../signin");
            // lblError.InnerHtml = "Unauthorised Login Detected!";

        }   
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}