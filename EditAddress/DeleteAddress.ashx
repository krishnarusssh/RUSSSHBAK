<%@ WebHandler Language="C#" Class="DeleteAddress" %>
using System;
using System.Web;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

public class DeleteAddress : IHttpHandler
{      
        SqlCommand cmd = new SqlCommand();
        SqlConnection LocalConn = new SqlConnection();          
        public void ProcessRequest (HttpContext context) {
                LocalConn.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
                string AddressID = "0";
                string Result = "N";
                if (context.Request.QueryString["AddressID"] != "" && context.Request.QueryString["AddressID"] != null)
                {
                    AddressID = context.Request.QueryString["AddressID"].ToString();
                }

                    LocalConn.Open();
                    cmd = new SqlCommand();
                    cmd.Connection = LocalConn;
                    cmd.CommandText = "update [dbo].[ClientAddress_Master] set status='N' where AddressID=" + AddressID;
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    LocalConn.Close();
                    context.Response.Write(Result);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}