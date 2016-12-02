using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using ASPSnippets.FaceBookAPI;
using System.Web.Script.Serialization;

public partial class ProcessSocialLogin_Process : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CrmClass crm = new CrmClass();
        DataSet ds = new DataSet();
        string Email = "";
        string Name = "";
        if (Request.QueryString["Email"] != "" && Request.QueryString["Email"] != null)
        {
            Email = Request.QueryString["Email"].ToString();
        }
        if (Request.QueryString["Name"] != "" && Request.QueryString["Name"] != null)
        {
            Name = Request.QueryString["Name"].ToString();
        }
        if (Name != "" && Email != "")
        {
            ds = crm.ValidateFBLogin(Email, Name);
        }
        else
        {
            Response.Redirect("../signin/");
        }

       
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
                    Session["CLIENT_ID"] = ClientID;
                    Session["CLIENT_EMAIL"] = Email;
                    Session["CLIENT_CONTACT"] = ClientContact;
                    Session["CLIENT_NAME"] = ClientName;
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
           
            
            
            logincookie.Value = ClientID + "-" + ClientName + "-" + ClientContact + "-" + Email;
            logincookie.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(logincookie);

            HttpCookie loginname = new HttpCookie("LOGINNAME");
            loginname.Value = ClientName;
            loginname.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(loginname);


            ClientScript.RegisterStartupScript(GetType(), "hwa", "setCookie('" + "LOGINCOOKIE" + "','" + ClientID + "-" + ClientName + "-" + ClientContact + "-" + Email + "',1);", true);
            ClientScript.RegisterStartupScript(GetType(), "hwa", "setCookie('" + "LOGINNAME" + "','" + ClientName + "',1);", true);

            // ClientScript.RegisterStartupScript(GetType(), "hwa", "setCookie('" + "LOGINCOOKIE" + "','" + ClientID + "-" + ClientName + "-" + ClientContact + "-" + Email + "',1);", true);
            // ClientScript.RegisterStartupScript(GetType(), "hwa", "setCookie('" + "LOGINNAME" + "','" + ClientName + "',1);", true);
            Response.Redirect("../ViewProfile");
        }
        else
        {

           Response.Redirect("../signin");
            // lblError.InnerHtml = "Unauthorised Login Detected!";

        }   
            
            
    }
}