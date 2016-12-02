<%@ WebHandler Language="C#" Class="CancelTaskwithSub" %>

using System;
using System.Web;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

public class CancelTaskwithSub : IHttpHandler {

    SqlConnection con = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    DataSet ds = new DataSet();
    SqlDataAdapter da;
    string error = "";
    public void ProcessRequest(HttpContext context)
    {
        con.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
        DataSet ds = new DataSet();
        string TaskId = null;
        string CancelledBy = null;
        string Reason = "";
        string Subject = "";
        string Comment = "";
        string Result = "N";
        if (context.Request.QueryString["TaskId"] != "" && context.Request.QueryString["TaskId"] != null)
        {
            TaskId = context.Request.QueryString["TaskId"];
        }
        if (context.Request.QueryString["CancelledBy"] != "" && context.Request.QueryString["CancelledBy"] != null)
        {
            CancelledBy = context.Request.QueryString["CancelledBy"];
        }
        if (context.Request.QueryString["Reason"] != "" && context.Request.QueryString["Reason"] != null)
        {
            Reason = context.Request.QueryString["Reason"];
        }
        if (context.Request.QueryString["Subject"] != "" && context.Request.QueryString["Subject"] != null)
        {
            Subject = context.Request.QueryString["Subject"];
        }
        if (context.Request.QueryString["Comment"] != "" && context.Request.QueryString["Comment"] != null)
        {
            Comment = context.Request.QueryString["Comment"];
        }
        if (TaskId != null && CancelledBy != null && Reason != "" && Subject !="" && Comment !="")
        {
            try
            {
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "insert into CancelledTasks(TaskID,CancelledBy,Reason,Subject,Comment) values(" + TaskId + "," + CancelledBy + ",'" + Reason + "','" + Subject + "','" + Comment + "')";
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                error = e.ToString();
            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
        }

        context.Response.Write(Result);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}