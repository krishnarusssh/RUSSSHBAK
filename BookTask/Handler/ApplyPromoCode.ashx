<%@ WebHandler Language="C#" Class="ApplyPromoCode" %>
using System;
using System.Web;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.SessionState;

public class ApplyPromoCode : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        string error = "";
        con.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();

        int ClientID = 0;
        string PromoCode = "";
        int Rid = 1;
        double Total = 0;
        int Cid = 9664;
        int discount = 0;
        int TotalNew = 0;
        int DAmt = 0;
        if (context.Request.QueryString["rid"] != "" && context.Request.QueryString["rid"] != null)
        {
            Rid = Convert.ToInt32(MyExtenstionMethods.DecryptString(context.Request.QueryString["rid"].ToString()));
        }
        if (context.Request.QueryString["cid"] != "" && context.Request.QueryString["cid"] != null)
        {
            ClientID = Convert.ToInt32(MyExtenstionMethods.DecryptString(context.Request.QueryString["cid"].ToString()));
        }
        if (context.Request.QueryString["pcode"] != "" && context.Request.QueryString["pcode"] != null)
        {
            PromoCode = context.Request.QueryString["pcode"].ToString();
        }
        if (Rid != 0 && ClientID != 0 && PromoCode != "")
        { 
            DataSet ds1 = new DataSet();
            con.Open();
            cmd = new SqlCommand("GetBooktaskData", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@rid", SqlDbType.Int).Value = Rid;
            cmd.Parameters.Add("cid", SqlDbType.Int).Value = Cid;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds1);
            if (ds1.Tables.Count > 0)
            {
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    Total = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[34].ToString());
                }
            }
            DataSet ds2 = new DataSet();
            cmd = new SqlCommand("ApplyPromo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Clientid", SqlDbType.Int).Value = ClientID;
            cmd.Parameters.Add("@Pcode", SqlDbType.NVarChar, 10).Value = PromoCode;
            cmd.Parameters.Add("@Amount", SqlDbType.Int).Value = Total;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds2);
           
            if (ds2.Tables.Count > 0)
            {
                if (ds2.Tables[0].Rows.Count > 0)
                {
                    TotalNew = Convert.ToInt32(ds2.Tables[0].Rows[0].ItemArray[0].ToString());
                    DAmt = Convert.ToInt32(ds2.Tables[0].Rows[0].ItemArray[1].ToString());
                    DataSet ds3 = new DataSet();
                    cmd = new SqlCommand("InsertPromoCodeUse", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Cid", SqlDbType.Int).Value = ClientID;
                    cmd.Parameters.Add("@Pcode", SqlDbType.NVarChar, 10).Value = PromoCode;
                    cmd.Parameters.Add("@TotalAmount", SqlDbType.Int).Value = Total;
                    cmd.Parameters.Add("@Discount", SqlDbType.Int).Value = DAmt;
                    cmd.Parameters.Add("@Famt", SqlDbType.Int).Value = TotalNew;
                    cmd.Parameters.Add("@Rid", SqlDbType.Int).Value = Rid;
                    da = new SqlDataAdapter(cmd);
                    da.Fill(ds3);
                }
            }
            
        }
        context.Response.Write(TotalNew + "," + DAmt);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}