<%@ WebHandler Language="C#" Class="Test" %>

using System;
using System.Web;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

public class Test : IHttpHandler 
{
    public void ProcessRequest (HttpContext context) 
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        string error = "";
        con.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
        int Service_Category = 0  ;
        int ProductValue = 0;
        int ProductWeight = 0;
        int ReturnService_Category = 0;
        int ReturnProductValue = 0;
        int ReturnProductWeight = 0;
        int PickUpAreaId = 0;
        int PickUpCityId = 0;
        int DropOffAreaId = 0;
        int DropOffCityId = 0;
        int PaymentMode = 0;
        string ApplyInsurance = "";
        string PromoCode = "N";
        string TaskDate="";
        string IsExpress="";
        string TaskMode="";
        string ClientXMl = "";

        if (context.Request.QueryString["SERVICECATEGORY"] != "" && context.Request.QueryString["SERVICECATEGORY"] != null)
        {
            Service_Category = Convert.ToInt32(context.Request.QueryString["SERVICECATEGORY"]);
        }
        if (context.Request.QueryString["PRODUCTVALUE"] != "" && context.Request.QueryString["PRODUCTVALUE"] != null)
        {
            ProductValue =  Convert.ToInt32(context.Request.QueryString["PRODUCTVALUE"]);
        }
        if (context.Request.QueryString["PRODUCTWEIGHT"] != "" && context.Request.QueryString["PRODUCTWEIGHT"] != null)
        {
            ProductWeight = Convert.ToInt32( context.Request.QueryString["PRODUCTWEIGHT"]);
        }
        if (context.Request.QueryString["RETURNSERVICECATEGORY"] != "" && context.Request.QueryString["RETURNSERVICECATEGORY"] != null)
        {
            ReturnService_Category = Convert.ToInt32( context.Request.QueryString["RETURNSERVICECATEGORY"]);
        }
        if (context.Request.QueryString["RETURNPRODUCTVALUE"] != "" && context.Request.QueryString["RETURNPRODUCTVALUE"] != null)
        {
            ReturnProductValue = Convert.ToInt32(context.Request.QueryString["RETURNPRODUCTVALUE"]);
        }
        if (context.Request.QueryString["RETURNPRODUCTWEIGHT"] != "" && context.Request.QueryString["RETURNPRODUCTWEIGHT"] != null)
        {
            ReturnProductWeight = Convert.ToInt32(context.Request.QueryString["RETURNPRODUCTWEIGHT"]);
        }
        if (context.Request.QueryString["PICKUPAREAID"] != "" && context.Request.QueryString["PICKUPAREAID"] != null)
        {
            PickUpAreaId = Convert.ToInt32( context.Request.QueryString["PICKUPAREAID"]);
        }
        if (context.Request.QueryString["PICKUPCITYID"] != "" && context.Request.QueryString["PICKUPCITYID"] != null)
        {
            PickUpCityId = Convert.ToInt32(context.Request.QueryString["PICKUPCITYID"]);
        }
        if (context.Request.QueryString["DROPOFFAREAID"] != "" && context.Request.QueryString["DROPOFFAREAID"] != null)
        {
            DropOffAreaId = Convert.ToInt32(context.Request.QueryString["DROPOFFAREAID"]);
        }
        if (context.Request.QueryString["DROPOFFCITYID"] != "" && context.Request.QueryString["DROPOFFCITYID"] != null)
        {
            DropOffCityId = Convert.ToInt32(context.Request.QueryString["DROPOFFCITYID"]);
        }
        if (context.Request.QueryString["PAYMENTMODE"] != "" && context.Request.QueryString["PAYMENTMODE"] != null)
        {
            PaymentMode = Convert.ToInt32(context.Request.QueryString["PAYMENTMODE"]);
        }
        if (context.Request.QueryString["APPLYINSURANCE"] != "" && context.Request.QueryString["APPLYINSURANCE"] != null)
        {
            ApplyInsurance = context.Request.QueryString["APPLYINSURANCE"];
        }
        if (context.Request.QueryString["PROMOCODE"] != "" && context.Request.QueryString["PROMOCODE"] != null)
        {
            PromoCode = context.Request.QueryString["PROMOCODE"];
        }
        else
        {
            PromoCode = "N";
        }
        if (context.Request.QueryString["TASKDATE"] != "" && context.Request.QueryString["TASKDATE"] != null)
        {
            TaskDate = context.Request.QueryString["TASKDATE"];
        }
        if (context.Request.QueryString["ISEXPRESS"] != "" && context.Request.QueryString["ISEXPRESS"] != null)
        {
            IsExpress = context.Request.QueryString["ISEXPRESS"];
        }
        if (context.Request.QueryString["TASKMODE"] != "" && context.Request.QueryString["TASKMODE"] != null)
        {
            TaskMode = context.Request.QueryString["TASKMODE"];
        }
   
        try
        {
            DataSet ds1 = new DataSet();
            con.Open();
            cmd = new SqlCommand("TaskRequest_QuoteWeb", con);                                                         
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Service_Category", SqlDbType.Int).Value = Service_Category;
            cmd.Parameters.Add("@ProductValue", SqlDbType.Int).Value = ProductValue;
            cmd.Parameters.Add("@ProductWeight", SqlDbType.Int).Value = ProductWeight;
            cmd.Parameters.Add("@TaskDate", SqlDbType.VarChar,10).Value = TaskDate;
            cmd.Parameters.Add("@IsExpress", SqlDbType.Char,1).Value = IsExpress;
            cmd.Parameters.Add("@TaskMode", SqlDbType.Char,10).Value = TaskMode;
            cmd.Parameters.Add("@ReturnService_Category", SqlDbType.Int).Value = ReturnService_Category;
            cmd.Parameters.Add("@ReturnProductValue", SqlDbType.Int).Value = ReturnProductValue;
            cmd.Parameters.Add("@ReturnProductWeight", SqlDbType.Int).Value = ReturnProductWeight;
            cmd.Parameters.Add("@PickUpAreaId", SqlDbType.Int).Value = PickUpAreaId;
            cmd.Parameters.Add("@PickUpCityId", SqlDbType.Int).Value = PickUpCityId;
            cmd.Parameters.Add("@DropOffAreaId", SqlDbType.Int).Value = DropOffAreaId;
            cmd.Parameters.Add("@DropOffCityId", SqlDbType.Int).Value = DropOffCityId;
            cmd.Parameters.Add("@ApplyInsurance", SqlDbType.Char,1).Value = ApplyInsurance;
            cmd.Parameters.Add("@PromoCode", SqlDbType.VarChar, 50).Value = PromoCode;
            cmd.Parameters.Add("@PaymentMode", SqlDbType.Int).Value = PaymentMode;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds1);
            DataTable dtable = ds1.Tables[0];

            int i = 0;

          

            ClientXMl = dtable.Rows[0].ItemArray[0].ToString().Trim() + "," + dtable.Rows[0].ItemArray[1].ToString().Trim() + "," + dtable.Rows[0].ItemArray[2].ToString().Trim() + "," + dtable.Rows[0].ItemArray[3].ToString().Trim() + "," + dtable.Rows[0].ItemArray[4].ToString().Trim() + "," + dtable.Rows[0].ItemArray[5].ToString().Trim() + "," + dtable.Rows[0].ItemArray[6].ToString().Trim() ;
            //  ClientXMl = ds.GetXml();
        }
        catch (Exception e)
        {
            ClientXMl = e.ToString();
           //ClientXMl = "0,0,0,NONE,0,0,0";
        }
        finally
        {
            cmd.Dispose();
            con.Close();
        }
        context.Response.Write(ClientXMl);
        
    }

    public string DataTableToJsonObj(DataTable dt)
    {
        DataSet ds1 = new DataSet();
        ds1.Merge(dt);
        StringBuilder JsonString = new StringBuilder();
        if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
        {
            JsonString.Append("{");
            JsonString.Append("\"TASKQUOTE\":");
            JsonString.Append("[");
            for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
            {
                JsonString.Append("{");
                // JsonString.Append("\"ID\":" + "\"" + i + "\",");
                for (int j = 0; j < ds1.Tables[0].Columns.Count; j++)
                {
                    if (j < ds1.Tables[0].Columns.Count - 1)
                    {
                        JsonString.Append("\"" + ds1.Tables[0].Columns[j].ColumnName.ToString() + "\":" + "\"" + ds1.Tables[0].Rows[i][j].ToString() + "\",");
                    }
                    else if (j == ds1.Tables[0].Columns.Count - 1)
                    {
                        JsonString.Append("\"" + ds1.Tables[0].Columns[j].ColumnName.ToString() + "\":" + "\"" + ds1.Tables[0].Rows[i][j].ToString() + "\"");
                    }
                }
                if (i == ds1.Tables[0].Rows.Count - 1)
                {
                    JsonString.Append("}");
                }
                else
                {
                    JsonString.Append("},");
                }
            }
            JsonString.Append("]}");
            return JsonString.ToString();
        }
        else
        {
            return null;
        }
    }  
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}