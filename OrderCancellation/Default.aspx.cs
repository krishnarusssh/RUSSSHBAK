using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class OrderCancellation_Default : System.Web.UI.Page
{
    CrmClass CrmObj = new CrmClass();
    DataSet ds = new DataSet();
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    SqlDataReader dr;
   
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack == true)
        {
		
           
            string ClientID = "0";
            try
            { ClientID = Session["CLIENT_ID"].ToString(); ;
                hndcid.Value = ClientID;
            }
            catch (Exception e1)
            {
            }

		


         
            bool IsValidOrderID = true;
            try
            {
                int o = Convert.ToInt32(Request.QueryString["TaskID"]);
            }
            catch (Exception e1)
            {
                IsValidOrderID = false;
            }
            if (!IsValidOrderID)
            {
                Response.Redirect("../OrderCancellation");
            }
            lblTaskID.Text = Request.QueryString["TaskID"].ToString();
            DataSet DsValidate = new DataSet();
            DsValidate = CrmObj.GetTaskStatus(Convert.ToInt32(Request.QueryString["TaskID"]));
            string status = "";
            if (DsValidate.Tables.Count > 0)
            {
                if (DsValidate.Tables[0].Rows.Count > 0)
                {
                    status = DsValidate.Tables[0].Rows[0].ItemArray[0].ToString();
                }
            }
              
            else
            {
                Response.Redirect("../OrderCancellation");
            }
            hndstatus.Value = status;
            if (status == "0")
            {
                lblmsg.Text = "Order is deleted from system.";
            }
            if(status=="N")
            {
                lblmsg.Text = "Do you want to delete this Order.";
            }
            if (status == "Y")
            {
                lblmsg.Text = "This Order is confirmed . Cancellation charge Rs. 100 will be applicable.";
            }

        }
    }
    public void open_conenction()
    {
        con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
        try
        {
            con.Open();
        }
        catch (Exception e)
        { }
    }
  
    protected void btnorders_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Orders");
    }
    
    protected void btnconfirm_Click(object sender, EventArgs e)
    {

        DataSet ds = CrmObj.CancelTask(Convert.ToInt32(Request.QueryString["TaskID"].ToString()), Convert.ToInt32(Session["CLIENT_ID"].ToString()), hndstatus.Value.ToString(), txtresone.Text.ToString());
        Response.Redirect("../Orders");
    }
}