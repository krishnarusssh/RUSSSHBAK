using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
//using System.Transactions;
using System.Net;
using System.Net.Mail;

/// <summary>
/// Summary description for WebMethod
/// </summary>
public class WebMethodClass
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection LocalConn = new SqlConnection();
    DataSet ds = new DataSet();
    SqlDataAdapter da;
    string error = "";

    public void LocalConnection_Class(SqlConnection Localconn)
    {
        try
        {
            if (Localconn.State == ConnectionState.Open)
            {
                return;
            }
            else
            {
                Localconn.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
                Localconn.Open();
            }
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
    }
    public DataSet ValidateTaskid(int Taskid)
    {
        DataSet ds1 = new DataSet();
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("ValidateTaskid", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Taskid", SqlDbType.Int).Value = Taskid;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds1);
            return ds1;
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds1;


    }

    public DataSet CheckOTP(int Taskid, int OTP)
    {
        DataSet dsOtp = new DataSet();
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("CheckOTPTracking", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Taskid", SqlDbType.Int).Value = Taskid;
            cmd.Parameters.Add("@OTP", SqlDbType.Int).Value = OTP;
            da = new SqlDataAdapter(cmd);
            da.Fill(dsOtp);
            return dsOtp;
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return dsOtp;


    }

    public DataSet SendOTP(int Taskid)
    {
        DataSet ds2 = new DataSet();
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("SetOtpTracking", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Taskid", SqlDbType.Int).Value = Taskid;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds2);
            return ds2;
        }
        catch (Exception e)
        {
            error = e.ToString();
        }
        finally
        {
            cmd.Dispose();
            LocalConn.Close();
        }
        return ds2;


    }

}