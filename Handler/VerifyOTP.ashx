<%@ WebHandler Language="C#" Class="VerifyOTP" %>

using System;

using System.Web;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;


public class VerifyOTP : IHttpHandler
{
    SqlConnection con = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    DataSet ds = new DataSet();
    SqlDataAdapter da;
    string error = "";
    public void ProcessRequest(HttpContext context)
    {

        context.Response.ContentType = "text/plain";
        con.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
        DataSet ds = new DataSet();
        string ClientID = "";
        if (context.Request.QueryString["CLIENTID"] != "" && context.Request.QueryString["CLIENTID"] != null)
        {
            ClientID = context.Request.QueryString["CLIENTID"];
        }
        string success = "N";
        try
        {
            con.Open();
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "update ACTIVATION_RECORD set MO_VERIFIED='Y' where CLIENTID=" + ClientID;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            success = "Y";
        }
        catch (Exception e)
        {
        }
        context.Response.Write(success);

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}