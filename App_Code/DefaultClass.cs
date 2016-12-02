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
/// Summary description for DefaultClass
/// </summary>
public class DefaultClass
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
    public DataSet ValidateClientLogin(string EmailID, string Password)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("ValidateClientLogin", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@EmailID", SqlDbType.VarChar, 100).Value = EmailID;
            cmd.Parameters.Add("@Password", SqlDbType.VarChar, 100).Value = Password;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
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
        return ds;
    }
    public DataSet CheckSocialLogin(string SID, string PLATFORM)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("CheckSocialLogin", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@SID", SqlDbType.VarChar, 100).Value = SID;
            cmd.Parameters.Add("@PLATFORM", SqlDbType.VarChar, 100).Value = PLATFORM;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
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
        return ds;
    }
     public DataSet RegisterWebClient(int ClientID, string FirstName, string LastName, string EmailID, string Password, string EmailActivationCode, string MobileOTP, string ClientType, string CompanyName, string WebUrl, string Loyalty, string MobileNo)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("RegisterWebClient", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ClientID", SqlDbType.Int).Value = ClientID;
            cmd.Parameters.Add("@Fname", SqlDbType.NVarChar).Value = FirstName;
            cmd.Parameters.Add("@LName", SqlDbType.NVarChar).Value = LastName;
            cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = EmailID;
            cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 50).Value = Password;
            cmd.Parameters.Add("@ActivationCode", SqlDbType.NVarChar, 100).Value = EmailActivationCode;
            cmd.Parameters.Add("@OTP", SqlDbType.NVarChar, 5).Value = MobileOTP;
            cmd.Parameters.Add("@ClientType", SqlDbType.Char, 1).Value = ClientType;
            cmd.Parameters.Add("@CompanyName", SqlDbType.NVarChar, 50).Value = CompanyName;
            cmd.Parameters.Add("@WebUrl", SqlDbType.NVarChar, 500).Value = WebUrl;
            cmd.Parameters.Add("@Loyalty", SqlDbType.Char, 1).Value = Loyalty;
            cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar, 10).Value = MobileNo;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
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
        return ds;
    }
  public DataSet GetClientid(string Uid)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("GetClientid", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Uid", SqlDbType.VarChar, 100).Value = Uid;

            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
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
        return ds;
    }
    public DataSet SetNewPass(string CLientid, string pass)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("SetNewPass", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Clientid", SqlDbType.Int).Value = Convert.ToInt32(CLientid);
            cmd.Parameters.Add("@Password", SqlDbType.VarChar, 100).Value = pass;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
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
        return ds;
    }
}