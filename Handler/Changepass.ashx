<%@ WebHandler Language="C#" Class="Changepass" %>
using System;
using System.Web;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.SessionState;

public class Changepass : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    DefaultClass DefObj = new DefaultClass();
    SqlConnection con = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    DataSet ds = new DataSet();
    SqlDataAdapter da;
    string ans = "";
    string Clientid = " ";
    string Password = " ";
    public void ProcessRequest (HttpContext context)
    {
        con.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
        
        if (System.Web.HttpContext.Current.Session != null)
        {
            Clientid = System.Web.HttpContext.Current.Session["CLIENT_ID"].ToString();
        }
        if (context.Request.QueryString["Password"] != "" && context.Request.QueryString["Password"] != null)
        {
            Password = context.Request.QueryString["Password"];
        }
        if (Clientid != "" && Password != "")
        {
            ds = DefObj.SetNewPass(Clientid, Password);
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (ds.Tables[0].Rows[0].ItemArray[0].ToString() == "Y")
                    { 
                      ans = "Y";
                    }
                    else
                    {
                        ans = "N";
                    }
                }
            }
        }
        context.Response.Write(ans);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}