using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Collections.Specialized;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using System.Configuration;

public partial class Agree : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlDataAdapter da;
    SqlDataReader dr;
    DataSet ds;
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        btnOK.Visible = false;
        string LinkID = "";
        if (Request.QueryString["LINKID"] != "" && Request.QueryString["LINKID"] != null)
        {
            LinkID = Request.QueryString["LINKID"].ToString();
            string TaskID = "";
            string PickupTime = "";
            string TimeID = "0";
            string CLIENTID = "0";
            string AreaName = "";
            string NewDate = "";
            open_conenction();
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select TASKID,NEWTIMEID,(Select top 1 FromToTimeSlot from TimeSlot where TimeSlot.TimeSlotId=NEWTIMEID) as TMS,(select top 1 FkClientId from BookTask where BookTask.BookTaskID=TASKID) as CLID,(Select top 1 AreaName from TaskAddress where FKBookTaskId=TASKID and AddressType=5) as AreaName,(select top 1 Clientname from AlternateDataMaster where AlternateDataMaster.Taskid=Reschedual_Master.TASKID) as CLNAME,LTRIM(convert(varchar(50),newdate,20)),convert(varchar(10),NEWDATE,103) from Reschedual_Master where LINKID='" + LinkID + "' and SENDTO=1";
            dr = cmd.ExecuteReader();
            dr.Read();
            try
            {
                TaskID = dr.GetValue(0).ToString();
                PickupTime = dr.GetValue(2).ToString();
                TimeID = dr.GetValue(1).ToString();
                CLIENTID = dr.GetValue(3).ToString();
                AreaName = dr.GetValue(4).ToString();
                   spn_time.InnerHtml = PickupTime.Replace("-", "").Substring(0, 9) + " on " + dr.GetValue(7).ToString(); ;
                spn_customername.InnerHtml ="Hi! " + dr.GetValue(5).ToString();
				NewDate = dr.GetValue(6).ToString();
            }
            catch (Exception e1)
            {
            }
            dr.Close();
            con.Close();

            if (TaskID != "")
            {
                lblTaskID.Text = TaskID;
                lblTimeID.Text = TimeID;
                lblClientID.Text = CLIENTID;
                lblAreaName.Text = AreaName;
                lblPickUpTime.Text = PickupTime;
   				lblNewDate.Text = NewDate;
                top1.Visible = true;
                expireddiv.Visible = false;
            }
            else
            {
                lblTaskID.Text = "0";
                lblTimeID.Text = "0";
                lblClientID.Text = "0";
                lblAreaName.Text = "";
                lblPickUpTime.Text = "";
   				lblNewDate.Text = "";
                top1.Visible = false;
                expireddiv.Visible = true;
            }
           



        }

        else
        {
            top1.Visible = false;
            expireddiv.Visible = true;
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
    protected void btnYes_Click(object sender, EventArgs e)
    {
        if (lblTaskID.Text != "0" && lblTaskID.Text != "")
        {
            open_conenction();
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "update Reschedual_Master set SENDTO=2 where TASKID=" + lblTaskID.Text;
            cmd.ExecuteNonQuery();

            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "update TaskAddress set FkTimeSlotId=" + lblTimeID.Text + " where FkBookTaskId=" + lblTaskID.Text+" and AddressType=5";
            cmd.ExecuteNonQuery();
            
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "update BookTask set TaskRequestedDate='"+lblNewDate.Text+"' where  BookTaskId=" + lblTaskID.Text;
            cmd.ExecuteNonQuery();
	
           string tm = lblPickUpTime.Text.ToString().Substring(0, 9);

            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "update AlternateDataMaster set Pickupinfo='" + lblAreaName.Text+" RSHD " + tm+"' where Taskid=" + lblTaskID.Text;
            cmd.ExecuteNonQuery();
            
            con.Close();
            btnYes.Enabled = false;
            btnNo.Enabled = false;
            lblError.Text = "Thank you very much for your cooperation.";
            lblError.ForeColor = System.Drawing.Color.Green;
            btnOK.Visible = false;
            top1.Visible = false;
            expireddiv.Visible = false;
        }
    }
    protected void btnNo_Click(object sender, EventArgs e)
    {
        open_conenction();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "update Reschedual_Master set SENDTO=3 where TASKID=" + lblTaskID.Text;
        cmd.ExecuteNonQuery();

         cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "update AlternateDateMaster set IsCancelled=1 where Taskid=" + lblTaskID.Text;
        cmd.ExecuteNonQuery();


        string error = "";
        DataSet dss4 = new DataSet();
        try
        {
          
            cmd = new SqlCommand("CancelOrder", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@TaskId", SqlDbType.Int).Value = Convert.ToInt32(lblTaskID.Text);
            cmd.Parameters.Add("@CancelBy", SqlDbType.Int).Value = Convert.ToInt32(lblClientID.Text);
            cmd.Parameters.Add("@Status", SqlDbType.NVarChar).Value = "N";
            cmd.Parameters.Add("@Reason", SqlDbType.NVarChar).Value = "Re-scheduling disagreed";
            da = new SqlDataAdapter(cmd);
            da.Fill(dss4);
          
        }
        catch (Exception e33)
        {
            error = e.ToString();      
        }
        finally
        {
            cmd.Dispose();
            con.Close();
        }
 
    
        top1.Visible = false;
        expireddiv.Visible = false;
        lblError.Text = "We apologise for not being able to serve you this time. Hope you give us a chance again. - Russsh";
        lblError.ForeColor = System.Drawing.Color.Green;
        btnOK.Visible = false;
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
       // Response.Redirect("https://www.russsh.com");
    }
}