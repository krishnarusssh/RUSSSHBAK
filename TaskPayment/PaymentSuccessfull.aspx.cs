using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class TaskPayment_PaymentSuccessfull : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack == true)
        {
            try
            {
                string state = Request.Form["TxStatus"].ToString();
                string pgtxnid = Request.Form["pgTxnNo"].ToString();
                string amount = Request.Form["amount"].ToString();
                string marchant_txt_id = Request.Form["TxId"].ToString();
                
                if (state == "SUCCESS")
                {
                    SqlConnection LocalConn = new SqlConnection();
                    LocalConn.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
                    LocalConn.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Dispose();
                    cmd = new SqlCommand();
                    cmd.Connection = LocalConn;
                    cmd.CommandText = "update BookTask set CitursTransactionid='" + pgtxnid + "' where [BookTaskId]=" + marchant_txt_id;
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    LocalConn.Close();
                }


            }
            catch (Exception em)
            {
            }

        }
    }
}