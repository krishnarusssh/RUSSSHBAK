<%@ WebHandler Language="C#" Class="SaveRequest" %>
using System;
using System.Web;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
public class SaveRequest : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        string error = "";
        con.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
        int Service_Category = 0;
        int ProductValue = 0;
        int ProductWeight = 0;
        int ReturnService_Category = 0;
        int ReturnProductValue = 0;
        int ReturnProductWeight = 0;
        int PickUpAreaId = 0;
        int DropOffAreaId = 0;
        string TaskDate = "";
        string IsExpress = "";
        string TaskMode = "";
        string ClientXMl = "";
        int Paddid = 0;
        int Daddid = 0;
        int Cost = 0;
        int Ptime = 0;
        int ClientID = 0;
        int rcost = 0;
        string iname = "N";
        int service = 0;
        if (context.Session["CLIENT_ID"] == null || context.Session["CLIENT_ID"] == "")
        {
            context.Response.Redirect("../");
        }
        else
        {
            ClientID = Convert.ToInt32(context.Session["CLIENT_ID"].ToString());
        }
        string desc = "";
        string rdesc = "";
        
        if (context.Request.QueryString["SERVICECATEGORY"] != "" && context.Request.QueryString["SERVICECATEGORY"] != null)
        {
            Service_Category = Convert.ToInt32(context.Request.QueryString["SERVICECATEGORY"]);
        }
        if (context.Request.QueryString["PRODUCTVALUE"] != "" && context.Request.QueryString["PRODUCTVALUE"] != null)
        {
            ProductValue = Convert.ToInt32(context.Request.QueryString["PRODUCTVALUE"]);
        }
        if (context.Request.QueryString["PRODUCTWEIGHT"] != "" && context.Request.QueryString["PRODUCTWEIGHT"] != null)
        {
            ProductWeight = Convert.ToInt32(context.Request.QueryString["PRODUCTWEIGHT"]);
           
        }
        if (context.Request.QueryString["RETURNSERVICECATEGORY"] != "" && context.Request.QueryString["RETURNSERVICECATEGORY"] != null)
        {
            ReturnService_Category = Convert.ToInt32(context.Request.QueryString["RETURNSERVICECATEGORY"]);
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
            PickUpAreaId = Convert.ToInt32(context.Request.QueryString["PICKUPAREAID"]);
        }
        if (context.Request.QueryString["DROPOFFAREAID"] != "" && context.Request.QueryString["DROPOFFAREAID"] != null)
        {
            DropOffAreaId = Convert.ToInt32(context.Request.QueryString["DROPOFFAREAID"]);
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
        if (context.Request.QueryString["Paddid"] != "" && context.Request.QueryString["Paddid"] != null)
        {
            Paddid = Convert.ToInt32(context.Request.QueryString["Paddid"]);
        }
        if (context.Request.QueryString["Daddid"] != "" && context.Request.QueryString["Daddid"] != null)
        {
            Daddid = Convert.ToInt32(context.Request.QueryString["Daddid"]);
        }
        if (context.Request.QueryString["Cost"] != "" && context.Request.QueryString["Cost"] != null)
        {
            Cost = Convert.ToInt32(context.Request.QueryString["Cost"]);
        }
        if (context.Request.QueryString["Ptime"] != "" && context.Request.QueryString["Ptime"] != null)
        {
            Ptime = Convert.ToInt32(context.Request.QueryString["Ptime"]);
        }
        if (context.Request.QueryString["Desc"] != "" && context.Request.QueryString["Desc"] != null)
        {
            desc = context.Request.QueryString["Desc"];
        }
        if (context.Request.QueryString["Rdesc"] != "" && context.Request.QueryString["Rdesc"] != null)
        {
            rdesc = context.Request.QueryString["Rdesc"];
        }
        if (context.Request.QueryString["IMGNAME"] != "" && context.Request.QueryString["IMGNAME"] != null)
        {
            iname = context.Request.QueryString["IMGNAME"];
        }
        if (context.Request.QueryString["RCOST"] != "" && context.Request.QueryString["RCOST"] != null)
        {
            rcost = Convert.ToInt32(context.Request.QueryString["RCOST"]);
        }
        if (context.Request.QueryString["SERVICE"] != "" && context.Request.QueryString["SERVICE"] != null)
        {
            service = Convert.ToInt32(context.Request.QueryString["SERVICE"]);
        }
        if (IsExpress == "Ë")
        {
            IsExpress = "Y";
        }
        try
        {
            DataSet ds1 = new DataSet();
            con.Open();
            cmd = new SqlCommand("CreateRequest", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ClientId", SqlDbType.Int).Value = ClientID;
            cmd.Parameters.Add("@Tdate", SqlDbType.VarChar, 11).Value = TaskDate;
            cmd.Parameters.Add("@Ptime", SqlDbType.Int).Value = Ptime;
            cmd.Parameters.Add("@Category", SqlDbType.Int).Value = Service_Category;
            cmd.Parameters.Add("@Pval", SqlDbType.Int).Value = ProductValue;
            cmd.Parameters.Add("@Weight", SqlDbType.Int).Value = ProductWeight;
            cmd.Parameters.Add("@Padd", SqlDbType.Int).Value = Paddid;
            cmd.Parameters.Add("@Dadd", SqlDbType.Int).Value = Daddid;
            cmd.Parameters.Add("@Rcat", SqlDbType.Int).Value = ReturnService_Category;
            cmd.Parameters.Add("@Rval", SqlDbType.Int).Value = ReturnProductValue;
            cmd.Parameters.Add("@Rweight", SqlDbType.Int).Value = ReturnProductWeight;
            cmd.Parameters.Add("@Isexpress", SqlDbType.Char, 1).Value = IsExpress;
            cmd.Parameters.Add("@Tasktype", SqlDbType.Char, 10).Value = TaskMode;
            cmd.Parameters.Add("@Desc", SqlDbType.VarChar, 1000).Value = desc;
            cmd.Parameters.Add("@Rdesc", SqlDbType.VarChar, 1000).Value = rdesc;
            cmd.Parameters.Add("@Pareaid", SqlDbType.Int).Value = PickUpAreaId;
            cmd.Parameters.Add("@Dareaid", SqlDbType.Int).Value = DropOffAreaId;
            cmd.Parameters.Add("@Cost", SqlDbType.Int).Value = Cost;
            cmd.Parameters.Add("@Imgname", SqlDbType.VarChar, 200).Value = iname;
            cmd.Parameters.Add("@Rcost", SqlDbType.Int).Value = rcost; 
            cmd.Parameters.Add("@Service", SqlDbType.Int).Value = service; 
            da = new SqlDataAdapter(cmd);
            da.Fill(ds1);
            DataTable dtable = ds1.Tables[0];
            
            ClientXMl = dtable.Rows[0].ItemArray[0].ToString().Trim();
            //  ClientXMl = ds.GetXml();
        }
        catch (Exception e)
        {
            //ClientXMl = e.ToString();
            ClientXMl = "0";
        }
        finally
        {
            cmd.Dispose();
            con.Close();
        }
        context.Response.Write(MyExtenstionMethods.EncryptString(ClientXMl));
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}