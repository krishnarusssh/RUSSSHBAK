using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Orders_Details : System.Web.UI.Page
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
           if (Session["CLIENT_ID"] == null)
           	 {
Response.Redirect("../Signin/");
		}

            string ClientID = "0";

           
		try
            {
                if (Session["CLIENT_ID"] != "" && Session["CLIENT_ID"] != null)
                {
                    ClientID = Session["CLIENT_ID"].ToString();
                }
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
                Response.Redirect("../Orders");
            }

            DataSet DsValidate = new DataSet();
            DsValidate=CrmObj.VaidateTaskIDwithClientID(Convert.ToInt32(Request.QueryString["TaskID"]), Convert.ToInt32(ClientID));
            int Countt = 0;
            if (DsValidate.Tables.Count > 0)
            {
                if (DsValidate.Tables[0].Rows.Count > 0)
                {
                    Countt = Convert.ToInt32(DsValidate.Tables[0].Rows[0].ItemArray[0].ToString()); 
                }
            }

            if (Countt > 0)
            {
                if (Request.QueryString["TaskID"] != null && Request.QueryString["TaskID"] != "")
                {


                    FillTaskDetail(Request.QueryString["TaskID"].ToString(), ClientID);
                }
            }
            else
            {
                Response.Redirect("../Orders");
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
    public void FillTaskDetail(string Task_ID,string ClID)
    {
        DataSet dsv = new DataSet();
        string TaskID = Task_ID;
        try
        {


            dsv = new DataSet();
            open_conenction();
            cmd = new SqlCommand();
            cmd = new SqlCommand("GetTaskInfomation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@TaskID", SqlDbType.Int).Value = Convert.ToInt32(TaskID);
            da = new SqlDataAdapter(cmd);
            da.Fill(dsv);

        }
        catch (Exception ee)
        {
        }
        finally
        {
            cmd.Dispose();
            con.Close();
        }

        if (dsv.Tables.Count > 0)
        {

            if (dsv.Tables[1].Rows.Count > 0)
            {
                lblTaskID.Text = TaskID;
                lblTaskCategory.Text = dsv.Tables[1].Rows[0].ItemArray[2].ToString();
                lblTaskDescription.Text = dsv.Tables[1].Rows[0].ItemArray[3].ToString();
                lblTaskDate.Text = dsv.Tables[1].Rows[0].ItemArray[1].ToString();
                char[] deli1 = new char[] { '/' };
                string[] stt = dsv.Tables[1].Rows[0].ItemArray[1].ToString().Split(deli1,
                                 StringSplitOptions.RemoveEmptyEntries);

                lblTaskDate.Text = dsv.Tables[1].Rows[0].ItemArray[1].ToString();
                //txtDate.Text = stt[2] + "-" + stt[1] + "-" + stt[0];


                //txtDate.ReadOnly = true;
                if (dsv.Tables[1].Rows[0].ItemArray[4].ToString() == "1")
                {
                    lblTaskPackage.Text = "Advanced";


                }
                else if (dsv.Tables[1].Rows[0].ItemArray[4].ToString() == "2")
                {
                    lblTaskPackage.Text = "Express";


                }

                else if (dsv.Tables[1].Rows[0].ItemArray[4].ToString() == "3")
                {
                    lblTaskPackage.Text = "Same Day";


                }

                if (dsv.Tables[1].Rows[0].ItemArray[5].ToString() == "Single")
                {
                    lblTaskMode.Text = "Single";

                    if (dsv.Tables[0].Rows[0].ItemArray[4].ToString() != "NONE")
                    {

                        lblTaskMode.Text = "Multi Drop-Off";
                    }

                }
                else if (dsv.Tables[1].Rows[0].ItemArray[5].ToString() == "Return")
                {
                    lblTaskMode.Text = "Return";
                    if (dsv.Tables[0].Rows[0].ItemArray[4].ToString() != "NONE")
                    {

                        lblTaskMode.Text = "Multi Drop-Off";

                    }

                }
                else if (dsv.Tables[1].Rows[0].ItemArray[5].ToString() == "COD")
                {

                    lblTaskMode.Text = "COD";
                    try
                    {
                        lblCODAmount.Text = dsv.Tables[1].Rows[0].ItemArray[8].ToString();
                    }
                    catch (Exception e23)
                    {
                        lblCODAmount.Text = "0";
                    }

                    if (dsv.Tables[0].Rows[0].ItemArray[4].ToString() != "NONE")
                    {
                        lblTaskMode.Text = "Multi Drop-Off";

                    }
                }

                if (dsv.Tables[0].Rows[0].ItemArray[9].ToString() == "2")
                {
                    lblPaymentCollect.Text = "From Wallet";
                }
                else
                {
                    if (dsv.Tables[1].Rows[0].ItemArray[6].ToString() == "1")
                    {
                        lblPaymentCollect.Text = "From Pick-up point";
                    }
                    else if (dsv.Tables[1].Rows[0].ItemArray[7].ToString() == "1")
                    {
                        lblPaymentCollect.Text = "From Drop-off point";
                    }
                }
               

            }

            if (dsv.Tables[2].Rows.Count > 0)
            {
                lblPickupName.Text = dsv.Tables[2].Rows[0].ItemArray[0].ToString();
                lblPickupAddress.Text = dsv.Tables[2].Rows[0].ItemArray[1].ToString();
                lblPickupArea.Text = dsv.Tables[2].Rows[0].ItemArray[2].ToString();
                lblPickupCity.Text = dsv.Tables[2].Rows[0].ItemArray[3].ToString();
                lblPickupMobile.Text = dsv.Tables[2].Rows[0].ItemArray[4].ToString();
                lblPickupPinCode.Text = dsv.Tables[2].Rows[0].ItemArray[5].ToString();
                lblPickupTime.Text = dsv.Tables[2].Rows[0].ItemArray[6].ToString();

            }
            if (dsv.Tables[3].Rows.Count > 0)
            {
                lblDropoffName.Text = dsv.Tables[3].Rows[0].ItemArray[0].ToString();
                lblDropoffAddress.Text = dsv.Tables[3].Rows[0].ItemArray[1].ToString();
                lblDropoffArea.Text = dsv.Tables[3].Rows[0].ItemArray[2].ToString();
                lblDropoffCity.Text = dsv.Tables[3].Rows[0].ItemArray[3].ToString();
                lblDropoffMobile.Text = dsv.Tables[3].Rows[0].ItemArray[4].ToString();
                lblDropoffPincode.Text = dsv.Tables[3].Rows[0].ItemArray[5].ToString();
                lblDropoffTime.Text = dsv.Tables[3].Rows[0].ItemArray[6].ToString();


            }

            if (dsv.Tables[4].Rows.Count > 0)
            {
                lblTaskCategory.Text = dsv.Tables[4].Rows[0].ItemArray[0].ToString();
                lblPickupTime.Text = dsv.Tables[4].Rows[0].ItemArray[1].ToString();
                lblDropoffTime.Text = dsv.Tables[4].Rows[0].ItemArray[2].ToString();
                //checking if already assigned


            }

        
            tbldetailview.Visible = true;


        }
    }


    protected void btnorders_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Orders");
    }
    protected void btnReorder_Click(object sender, EventArgs e)
    {

        string OrderNo = lblTaskID.Text;
        Session["REORDERTASKID"] = lblTaskID.Text;
        Response.Redirect("../BookTask/");
            
    }
}