﻿<%@ WebHandler Language="C#" Class="SaveAddress" %>

using System;
using System.Web;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

public class SaveAddress : IHttpHandler {
    SqlConnection con = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    DataSet ds = new DataSet();
    SqlDataAdapter da;
    string error = "";
    public void ProcessRequest (HttpContext context) 
    {
        con.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
        DataSet ds = new DataSet();
        string AddressID = null;
        string ClientID = null;
        string AddressName = "";
        string Address = "";
        string AreaName = "";
        string CityName = "";
        string Landmark = "";
        string PinCode = "000000";
        string MobileNo = "9999999999";
        string CityID = null;
        string AreaID = null;
        string Result = "N";
        if (context.Request.QueryString["AddressID"] != "" && context.Request.QueryString["AddressID"] != null)
        {
            AddressID = context.Request.QueryString["AddressID"];
        }
        if (context.Request.QueryString["ClientID"] != "" && context.Request.QueryString["ClientID"] != null)
        {
            ClientID = context.Request.QueryString["ClientID"];
        }
        if (context.Request.QueryString["AddressName"] != "" && context.Request.QueryString["AddressName"] != null)
        {
            AddressName = context.Request.QueryString["AddressName"];
        }
        if (context.Request.QueryString["Address"] != "" && context.Request.QueryString["Address"] != null)
        {
            Address = context.Request.QueryString["Address"];
        }
        if (context.Request.QueryString["AreaName"] != "" && context.Request.QueryString["AreaName"] != null)
        {
            AreaName = context.Request.QueryString["AreaName"];
        }
        if (context.Request.QueryString["CityName"] != "" && context.Request.QueryString["CityName"] != null)
        {
            CityName = context.Request.QueryString["CityName"];
        }
        if (context.Request.QueryString["Landmark"] != "" && context.Request.QueryString["Landmark"] != null)
        {
            Landmark = context.Request.QueryString["Landmark"];
        }
        if (context.Request.QueryString["PinCode"] != "" && context.Request.QueryString["PinCode"] != null)
        {
            PinCode = context.Request.QueryString["PinCode"];
        }
        if (context.Request.QueryString["MobileNo"] != "" && context.Request.QueryString["MobileNo"] != null)
        {
            MobileNo = context.Request.QueryString["MobileNo"];
        }
        if (context.Request.QueryString["CityID"] != "" && context.Request.QueryString["CityID"] != null)
        {
            CityID = context.Request.QueryString["CityID"];
        }
        if (context.Request.QueryString["AreaID"] != "" && context.Request.QueryString["AreaID"] != null)
        {
            AreaID = context.Request.QueryString["AreaID"];
        }

        if (AddressID != null && ClientID != null && AddressName != "" && Address != "" && MobileNo != "" && CityID != null && AreaID != null && PinCode != null)
        {
            try
            {
                con.Open();
                cmd = new SqlCommand("IUAdditionalAddress_Temp", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@AddressId", SqlDbType.Int).Value = AddressID;
                cmd.Parameters.Add("@ClientId", SqlDbType.Int).Value = ClientID;
                cmd.Parameters.Add("@AddressName", SqlDbType.VarChar, 500).Value = AddressName;
                cmd.Parameters.Add("@Address", SqlDbType.VarChar, 500).Value = Address;
                cmd.Parameters.Add("@Area", SqlDbType.VarChar, 100).Value = AreaName;
                cmd.Parameters.Add("@city", SqlDbType.VarChar, 100).Value = CityName;
                cmd.Parameters.Add("@Landmark", SqlDbType.VarChar, 500).Value = Landmark;
                cmd.Parameters.Add("@Pincode", SqlDbType.VarChar, 50).Value = PinCode;
                cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar, 50).Value = MobileNo;
                cmd.Parameters.Add("@cityid", SqlDbType.Int).Value = Convert.ToInt32(CityID);
                cmd.Parameters.Add("@areaid", SqlDbType.Int).Value = Convert.ToInt32(AreaID);
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