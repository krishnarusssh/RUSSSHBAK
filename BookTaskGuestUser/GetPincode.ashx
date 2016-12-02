<%@ WebHandler Language="C#" Class="GetPincode" %>

using System;
using System.Web;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Web.Script.Serialization;

public class GetPincode : IHttpHandler {

    public void ProcessRequest (HttpContext context) 
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        string error = "";
        con.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
        string ClientXMl = "";
        int areaid = 0;
        int pincode = 0;
        if (context.Request.QueryString["AreaId"] != "" && context.Request.QueryString["AreaId"] != null)
        {
            areaid = Convert.ToInt32( context.Request.QueryString["AreaId"].ToString());
        }
        try
        {
            DataSet ds1 = new DataSet();
            con.Open();
            cmd = new SqlCommand("GetPincode", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AreaId", SqlDbType.Int).Value = areaid;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds1);
            if (ds1.Tables.Count > 0)
            {
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    pincode =Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[0].ToString());
                }
            }

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
        context.Response.Write(pincode.ToString());
        
           
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}