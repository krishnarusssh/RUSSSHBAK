<%@ WebHandler Language="C#" Class="TaskRequestQuote" %>

using System;
using System.Web;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

public class TaskRequestQuote : IHttpHandler {
    SqlConnection con = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    DataSet ds = new DataSet();
    SqlDataAdapter da;
    string error = "";
    public void ProcessRequest (HttpContext context) {
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
        string PromoCode = "";
        string TaskDate="";
        string IsExpress="";
        string TaskMode="";
        string ClientXMl = "";

        if (context.Request.Form["SERVICECATEGORY"] != "" && context.Request.Form["SERVICECATEGORY"] != null)
        {
            Service_Category = Convert.ToInt32(context.Request.Form["SERVICECATEGORY"]);
        }
        if (context.Request.Form["PRODUCTVALUE"] != "" && context.Request.Form["PRODUCTVALUE"] != null)
        {
            ProductValue =  Convert.ToInt32(context.Request.Form["PRODUCTVALUE"]);
        }
        if (context.Request.Form["PRODUCTWEIGHT"] != "" && context.Request.Form["PRODUCTWEIGHT"] != null)
        {
            ProductWeight = Convert.ToInt32( context.Request.Form["PRODUCTWEIGHT"]);
        }
        if (context.Request.Form["RETURNSERVICECATEGORY"] != "" && context.Request.Form["RETURNSERVICECATEGORY"] != null)
        {
            ReturnService_Category = Convert.ToInt32( context.Request.Form["RETURNSERVICECATEGORY"]);
        }
        if (context.Request.Form["RETURNPRODUCTVALUE"] != "" && context.Request.Form["RETURNPRODUCTVALUE"] != null)
        {
            ReturnProductValue = Convert.ToInt32(context.Request.Form["RETURNPRODUCTVALUE"]);
        }
        if (context.Request.Form["RETURNPRODUCTWEIGHT"] != "" && context.Request.Form["RETURNPRODUCTWEIGHT"] != null)
        {
            ReturnProductWeight = Convert.ToInt32(context.Request.Form["RETURNPRODUCTWEIGHT"]);
        }
        if (context.Request.Form["PICKUPAREAID"] != "" && context.Request.Form["PICKUPAREAID"] != null)
        {
            PickUpAreaId = Convert.ToInt32( context.Request.Form["PICKUPAREAID"]);
        }
        if (context.Request.Form["PICKUPCITYID"] != "" && context.Request.Form["PICKUPCITYID"] != null)
        {
            PickUpCityId = Convert.ToInt32(context.Request.Form["PICKUPCITYID"]);
        }
        if (context.Request.Form["DROPOFFAREAID"] != "" && context.Request.Form["DROPOFFAREAID"] != null)
        {
            DropOffAreaId = Convert.ToInt32(context.Request.Form["DROPOFFAREAID"]);
        }
        if (context.Request.Form["DROPOFFCITYID"] != "" && context.Request.Form["DROPOFFCITYID"] != null)
        {
            DropOffCityId = Convert.ToInt32(context.Request.Form["DROPOFFCITYID"]);
        }
        //int PaymentMode;
        //string ApplyInsurance;
        //string PromoCode;
        //string TaskDate;
        //string IsExpress;
        //string TaskMode;
        if (context.Request.Form["PAYMENTMODE"] != "" && context.Request.Form["PAYMENTMODE"] != null)
        {
            PaymentMode = Convert.ToInt32(context.Request.Form["PAYMENTMODE"]);
        }
        if (context.Request.Form["APPLYINSURANCE"] != "" && context.Request.Form["APPLYINSURANCE"] != null)
        {
            ApplyInsurance = context.Request.Form["APPLYINSURANCE"];
        }
        if (context.Request.Form["PROMOCODE"] != "" && context.Request.Form["PROMOCODE"] != null)
        {
            PromoCode = context.Request.Form["PROMOCODE"];
        }
        if (context.Request.Form["TASKDATE"] != "" && context.Request.Form["TASKDATE"] != null)
        {
            TaskDate = context.Request.Form["TASKDATE"];
        }
        if (context.Request.Form["ISEXPRESS"] != "" && context.Request.Form["ISEXPRESS"] != null)
        {
            IsExpress = context.Request.Form["ISEXPRESS"];
        }
        if (context.Request.Form["TASKMODE"] != "" && context.Request.Form["TASKMODE"] != null)
        {
            TaskMode = context.Request.Form["TASKMODE"];
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
            ClientXMl = DataTableToJsonObj(dtable);
            //  ClientXMl = ds.GetXml();
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