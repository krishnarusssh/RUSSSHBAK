<%@ WebHandler Language="C#" Class="ValidateLogin" %>
using System;
using System.Web;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.SessionState;

public class ValidateLogin : IHttpHandler, IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        DefaultClass DefObj = new DefaultClass();
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        string error = "";
        string Name = " ";
        string Password = " ";
        con.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
        if (context.Request.QueryString["Name"] != "" && context.Request.QueryString["Name"] != null)
        {
            Name = context.Request.QueryString["Name"];
        }
        if (context.Request.QueryString["Password"] != "" && context.Request.QueryString["Password"] != null)
        {
            Password = context.Request.QueryString["Password"];
        }
        string ans = "";
        string ClientID = "0";
        string ClientName = "";
        string ClientContact = "";
	    string CEmail = "";
        if (Name != " " && Password != " ")
        {
            ds = DefObj.ValidateClientLogin(Name, Password);
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (ds.Tables[0].Rows[0].ItemArray[0].ToString() == "Y")
                    {
                        ans = "Y";
                        //System.Web.SessionState.IRequiresSessionState
                        ClientID = ds.Tables[0].Rows[0].ItemArray[1].ToString();
                        ClientName = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                        ClientContact = ds.Tables[0].Rows[0].ItemArray[3].ToString();
	                    CEmail = ds.Tables[0].Rows[0].ItemArray[4].ToString();
                        if (System.Web.HttpContext.Current.Session != null)
                        {
                            System.Web.HttpContext.Current.Session["CLIENT_ID"] = ClientID;
                            System.Web.HttpContext.Current.Session["CLIENT_CONTACT"] = ClientContact;
                            System.Web.HttpContext.Current.Session["CLIENT_NAME"] = ClientName;
	                        System.Web.HttpContext.Current.Session["CLIENT_EMAIL"] = CEmail;
                            string cid = System.Web.HttpContext.Current.Session["CLIENT_ID"].ToString();
                           
                        }
                        else
                        {
                            System.Web.HttpContext.Current.Session["CLIENT_ID"] = ClientID;
                            //  context.Session["CLIENT_EMAIL"] = txtEmail.Text;
	                        System.Web.HttpContext.Current.Session["CLIENT_EMAIL"] = CEmail;
                            System.Web.HttpContext.Current.Session["CLIENT_CONTACT"] = ClientContact;
                            System.Web.HttpContext.Current.Session["CLIENT_NAME"] = ClientName;
                            
                        }
                        

                    }
                    else
                    {
                        ans = "N";
                        ClientID = "0";
                        ClientName = "";
                        ClientContact = "";
                        context.Session["CLIENT_ID"] = "0";
                        context.Session["CLIENT_EMAIL"] = "";
                        context.Session["CLIENT_CONTACT"] = "";
                        context.Session["CLIENT_NAME"] = "";
                    }
                }
            }
        }


        context.Response.Write(ClientID + "," + ClientName + "," + ClientContact);  
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}