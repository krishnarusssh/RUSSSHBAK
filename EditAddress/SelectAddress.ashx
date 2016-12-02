<%@ WebHandler Language="C#" Class="SelectAddress" %>
using System;
using System.Web;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

public class SelectAddress : IHttpHandler
{
    SqlCommand cmd = new SqlCommand();
    SqlDataReader dr;
    SqlConnection LocalConn = new SqlConnection();
    public void ProcessRequest(HttpContext context)
    {
        LocalConn.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
        string AddressID = "0";
       // string Result = "N";
        if (context.Request.QueryString["AddressID"] != "" && context.Request.QueryString["AddressID"] != null)
        {
            AddressID = context.Request.QueryString["AddressID"].ToString();
        }

        LocalConn.Open();
        string cnt = "";
        cmd = new SqlCommand();
        cmd.Connection = LocalConn;
        cmd.CommandText = "Select IsFlagFav from [dbo].[ClientAddress_Master] where AddressID=" + AddressID;
        dr = cmd.ExecuteReader();

        try
        {
            dr.Read();
            cnt = dr.GetValue(0).ToString();
        }
        catch (Exception e1)
        {
            cnt = "";
        }
        dr.Close();
        cmd.Dispose();
        LocalConn.Close();
        if (cnt == "N")
        {
            LocalConn.Open();
            cmd = new SqlCommand();
            cmd.Connection = LocalConn;
            cmd.CommandText = "update [dbo].[ClientAddress_Master] set IsFlagFav='Y' where AddressID=" + AddressID;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            LocalConn.Close();
        }
        else if (cnt == "Y")
        {
            LocalConn.Open();
            cmd = new SqlCommand();
            cmd.Connection = LocalConn;
            cmd.CommandText = "update [dbo].[ClientAddress_Master] set IsFlagFav='N' where AddressID=" + AddressID;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            LocalConn.Close();

            context.Response.Write("Y");
        }

        else
        {
            context.Response.Write("N");
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}