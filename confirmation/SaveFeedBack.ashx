<%@ WebHandler Language="C#" Class="SaveFeedBack" %>

using System;
using System.Web;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

public class SaveFeedBack : IHttpHandler
{
    SqlConnection con = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    DataSet ds = new DataSet();
    SqlDataAdapter da;
    string error = "";
    public void ProcessRequest (HttpContext context) 
    {
        con.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
        DataSet ds = new DataSet();
        string TaskId = null;
        string ANS1 = "";
        string ANS2 = "";
        string ANS3 = "";
        string Result = "N";
        if (context.Request.QueryString["TASKID"] != "" && context.Request.QueryString["TASKID"] != null)
        {
            TaskId = context.Request.QueryString["TASKID"];
        }
        if (context.Request.QueryString["ANS1"] != "" && context.Request.QueryString["ANS1"] != null)
        {
            ANS1 = context.Request.QueryString["ANS1"];
        }
        if (context.Request.QueryString["ANS2"] != "" && context.Request.QueryString["ANS2"] != null)
        {
            ANS2 = context.Request.QueryString["ANS2"];
        }
        if (context.Request.QueryString["ANS3"] != "" && context.Request.QueryString["ANS3"] != null)
        {
            ANS3 = context.Request.QueryString["ANS3"];
        }

        if (TaskId != null && ANS1 != "" && ANS2 != "" && ANS3 != "")
        {
            try
            {     
                con.Open();
                cmd = new SqlCommand("InsertTask_Customer_Feedback", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@TASKID", SqlDbType.Int).Value = TaskId;
                cmd.Parameters.Add("@ANS1", SqlDbType.Char, 1).Value = ANS1.Trim();
                cmd.Parameters.Add("@ANS2", SqlDbType.Char, 1).Value = ANS2.Trim();
                cmd.Parameters.Add("@ANS3", SqlDbType.Char, 1).Value = ANS3.Trim();
                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
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

            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (ds.Tables[0].Rows[0].ItemArray[0].ToString() == "I" || ds.Tables[0].Rows[0].ItemArray[0].ToString() == "Y")
                    {
                        Result = "Y";
                    }
                }
            }

        }

        context.Response.Write(Result);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}