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
/// Summary description for BookTask
/// </summary>
public class BookTask
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

    public DataSet GetCards(int ClientID)
    {
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("GetCards", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Clientid", SqlDbType.Int).Value = ClientID;
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
    public DataSet GetRequestData(int Rid, int Cid)
    {
        DataSet ds1 = new DataSet();
        try
        {
            LocalConnection_Class(LocalConn);
            cmd = new SqlCommand("GetRequestData", LocalConn);
            cmd.CommandType = CommandType.StoredProcedure;
              cmd.Parameters.Add("@Requestid", SqlDbType.Int).Value = Rid;
            cmd.Parameters.Add("@Clientid", SqlDbType.Int).Value = Cid;
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

}