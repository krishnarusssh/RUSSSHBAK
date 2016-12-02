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
using System.Web.UI;
using System.Drawing;
using System.Configuration;
using System.Security.Cryptography;
using System.Configuration;
public partial class book_a_task_book : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    SqlDataReader dr;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            string[] spiltstr;
            string clientid;
            HttpCookie cookie = Request.Cookies["LOGINCOOKIE"];
            string c = "NONE";
            try
            {
                c = cookie.Value.ToString();
                spiltstr = c.Split('-');
                clientid = spiltstr[0].ToString();
                if (spiltstr[1].ToString() == "")
                {
                    Response.Redirect("../Signout/");
                }
                else
                {
                    Response.Redirect("../BookTask/");
                }

            }
            catch (Exception e1)
            {
            }

            fillTaskType();
            fillPickUpTimes();
            fillDropOffTimes();
            UpdateCaptchaText();
            UserAccordion.SelectedIndex = 0;
            AccordionPane2.Enabled = false;
            AccordionPane3.Enabled = false;   
        }

    }
  
    protected void txtDate_TextChanged(object sender, EventArgs e)
    {

        if (txtDate.Text == "11/11/2015" || txtDate.Text == "12/11/2015" || txtDate.Text == "11-11-2015" || txtDate.Text == "12-11-2015")
        {
            //lblError.Text = "Note- On account of Diwali, operations at Russsh will be operating from morning 9.00 a.m. to 6.00 a.m. evening on 11th November and 12th November, 2015 for the entire day. From 13th November operation hours will be as usually. ";
            // lblError.ForeColor = System.Drawing.Color.Firebrick;
            // Button2.Enabled = false;
            // return;
        }




        char[] delimiters2 = null;
        string date = null;
        string[] p = null;
        try
        {
            delimiters2 = new char[] { '/' };
        }
        catch (Exception e3131)
        {
        }
        try
        {
            p = txtDate.Text.ToString().Split(delimiters2);
            date = p[2] + "-" + p[1] + "-" + p[0];
        }
        catch (Exception eeee)
        {
            lblError.Text = "Invalid Date Selection!";
            LinkButton1_ModalPopupExtender.Show();
            return;
        }

        DateTime selectedDate = Convert.ToDateTime(date);

        DateTime todayDate = DateTime.Today;

        int diff = Convert.ToInt32((selectedDate - todayDate).TotalDays);
        if (diff < 0)
        {
            lblError.Text = "Task can not be booked back dated!";
            Button2.Enabled = false;
            LinkButton1_ModalPopupExtender.Show();
        }
        else if (diff >= 0)
        {
            lblError.Text = "";
            Button2.Enabled = true;
        }

        string t = DateTime.Now.Hour.ToString();
        string Mins = DateTime.Now.Minute.ToString();
        DateTime dt = new DateTime(Convert.ToInt32(selectedDate.Year.ToString()), Convert.ToInt32(selectedDate.Month.ToString()), Convert.ToInt32(selectedDate.Day.ToString()));
        string din = dt.DayOfWeek.ToString();
        //  Response.Write(din);
        if (din.ToUpper().Equals("SUNDAY"))
        {

            lblExtraAmountFlg.Text = "1";
        }
        else
        {

            lblExtraAmountFlg.Text = "0";
        }


        if (diff == 0)
        {
            rdoAdvanced.Checked = false;
            rdoSameDay.Checked = false;
            rdoExpress.Checked = false;

            rdoAdvanced.Enabled = false;
            rdoSameDay.Enabled = true;
            rdoExpress.Enabled = true;
            rdoSameDay.Checked = true;
            Button2.Enabled = true;
            if (Convert.ToInt32(t) >= 20)
            {
                rdoAdvanced.Checked = false;
                rdoSameDay.Checked = false;
                rdoExpress.Checked = false;

                rdoAdvanced.Enabled = false;
                rdoSameDay.Enabled = true;
                rdoExpress.Enabled = true;

                rdoSameDay.Checked = true;

                Button2.Enabled = true;
                //After hours all booking will be closed
            }

        }
        else if (diff == 1)
        {

            if (Convert.ToInt32(t) <= 19 && Convert.ToInt32(Mins) <= 59)
            {
                rdoAdvanced.Checked = false;
                rdoSameDay.Checked = false;
                rdoExpress.Checked = false;

                rdoAdvanced.Enabled = true;
                rdoSameDay.Enabled = false;
                rdoExpress.Enabled = true;

                rdoAdvanced.Checked = true;

                Button2.Enabled = true;
                //Next Day till 8 pm all booking alowed
            }
            else if (Convert.ToInt32(t) >= 20)
            {
                rdoAdvanced.Checked = false;
                rdoSameDay.Checked = false;
                rdoExpress.Checked = false;

                rdoAdvanced.Enabled = false;
                rdoSameDay.Enabled = true;
                rdoExpress.Enabled = true;
                rdoSameDay.Checked = true;

                Button2.Enabled = true;
                //Next Day after 8 pm pre-book will be disabled
            }
        }

        else if (diff > 1)
        {
            rdoAdvanced.Checked = false;
            rdoSameDay.Checked = false;
            rdoExpress.Checked = false;

            rdoAdvanced.Enabled = true;
            rdoSameDay.Enabled = false;
            rdoExpress.Enabled = true;
            rdoAdvanced.Checked = true;

            Button2.Enabled = true;

        }






    }

    void ManipiulateAmountBox()
    {
        if (rdoCod.Checked == true)
        {
            txtAmount.Visible = true;
            lblMessage.Visible = true;
        }
        else
        {
            txtAmount.Visible = false;
            lblMessage.Visible = false;
        }

    }
    protected void rdoMulti_CheckedChanged(object sender, EventArgs e)
    {
        ManipiulateAmountBox();
    }
    protected void rdoCod_CheckedChanged(object sender, EventArgs e)
    {
        ManipiulateAmountBox();
    }
    protected void rdoOneway_CheckedChanged(object sender, EventArgs e)
    {
        ManipiulateAmountBox();
    }
    protected void rdoReturn_CheckedChanged(object sender, EventArgs e)
    {
        ManipiulateAmountBox();
    }
    
   
   
   


    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/index.html");
    }

   



    private void UpdateCaptchaText()
    {
        txtCaptchaText.Text = string.Empty;
        lblStatus.Visible = false;
        //Store the captcha text in session to validate
        Session["Captcha"] = Guid.NewGuid().ToString().Substring(0, 6);
        imgplace.InnerHtml = "<img src='GenerateCaptcha.ashx' />";
    }

  
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txtDropOffPinCode.Text.ToString().Length < 6)
        {
            lblError.Text = "Invalid Pincode!";
            LinkButton1_ModalPopupExtender.Show();
            return;
        }
        //if (Convert.ToInt32(ddlPickUpTime.SelectedValue) == Convert.ToInt32(ddlDropOffTime.SelectedValue))
        //{
        //    lblError.Text = "Pick-up and Drop-off time can't be same.";
        //    return;
        //}


        open_conenction();
        if (lblID.Text == "0")
        {


            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "insert into Additional_Address(Name,Address,Area,City,Mobile,Pincode,TimeSlot,TimeSlotID,TaskID,GUID) values('" + txtDropoffName.Text + "','" + txtDropOffAddress.Text + "','" + txtDropArea.Text + "','" + txtDropCity.Text + "','" + txtDropOffMobileNo.Text + "','" + txtDropOffPinCode.Text + "','" + ddlDropOffTime.SelectedItem.Text + "'," + ddlDropOffTime.SelectedValue.ToString() + ",0,'" + lblGuid.Text + "')";
            cmd.ExecuteNonQuery();
        }
        else
        {

            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "update Additional_Address set Name='" + txtDropoffName.Text + "',Address='" + txtDropOffAddress.Text + "',Area='" + txtDropArea.Text + "',City='" + txtDropCity.Text + "',Mobile='" + txtDropOffMobileNo.Text + "',Pincode='" + txtDropOffPinCode.Text + "',TimeSlotID=" + ddlDropOffTime.SelectedValue.ToString() + ",TimeSlot='" + ddlDropOffTime.SelectedItem.Text + "' where ID=" + lblID.Text;
            cmd.ExecuteNonQuery();
        }
        con.Close();




        GridView1.DataBind();
        lblID.Text = "0";
        txtDropoffName.Text = "";
        txtDropOffAddress.Text = "";
        txtDropArea.Text = "";
        txtDropCity.Text = "";
        txtDropOffMobileNo.Text = "";
        txtDropOffPinCode.Text = "";

        int a = Convert.ToInt32(lblAddressCount.Text) + 1;
        lblAddressCount.Text = a.ToString();
        lblDropOff_Address.Text = "Enter Drop Address " + a.ToString();


        btnAdd.Text = "[+] Add ";
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "btnDelete")
        {
            Label l = new Label();
            int i = Convert.ToInt32(e.CommandArgument);
            l = GridView1.Rows[i].FindControl("lblAddressID") as Label;
            string AddressID = l.Text;
            open_conenction();
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from Additional_Address where ID=" + AddressID;
            cmd.ExecuteNonQuery();
            con.Close();
            GridView1.DataBind();



            int a = Convert.ToInt32(GridView1.Rows.Count) + 1;
            lblAddressCount.Text = a.ToString();
            lblDropOff_Address.Text = "Enter Drop Address " + a.ToString();



        }

        if (e.CommandName == "btnEdit")
        {
            Label l = new Label();
            int i = Convert.ToInt32(e.CommandArgument);
            l = GridView1.Rows[i].FindControl("lblAddressID") as Label;
            string AddressID = l.Text;
            Label lblName = new Label();
            Label lblAddress = new Label();
            Label lblArea = new Label();
            Label lblCity = new Label();
            Label lblPincode = new Label();
            Label lblMobile = new Label();
            Label lblTimeSlotID = new Label();
            lblName = GridView1.Rows[i].FindControl("lblName") as Label;
            lblAddress = GridView1.Rows[i].FindControl("lblAddress") as Label;
            lblArea = GridView1.Rows[i].FindControl("lblArea") as Label;
            lblCity = GridView1.Rows[i].FindControl("lblCity") as Label;
            lblPincode = GridView1.Rows[i].FindControl("lblPincode") as Label;
            lblMobile = GridView1.Rows[i].FindControl("lblMobile") as Label;
            lblTimeSlotID = GridView1.Rows[i].FindControl("lblTimeSlotID") as Label;
            txtDropoffName.Text = lblName.Text;
            txtDropOffAddress.Text = lblAddress.Text;
            txtDropArea.Text = lblArea.Text;
            txtDropCity.Text = lblCity.Text;
            txtDropOffPinCode.Text = lblPincode.Text;
            txtDropOffMobileNo.Text = lblMobile.Text;
            ddlDropOffTime.SelectedValue = lblTimeSlotID.Text;
            lblID.Text = AddressID;
            btnAdd.Text = "[+] Update";

        }

    }







    

    ///Methiods
    ///
    #region SelfFunctions
    public string TaskBookingEmail(string ToEmailID, string TaskDetail)
    {
        System.Net.Mail.MailMessage Email1 = new System.Net.Mail.MailMessage("krishna.russsh@gmail.com", ToEmailID);
        Email1.Subject = "A New Task Booked! russsh.com";
        string str = "Dear Admin ,<br><br>";

        str = str + TaskDetail + "<br>";

        str = str + "Thanking You<br><br>";
        str = str + "RUSSSH Team<br><br>";
        Email1.Body = str;
        Email1.IsBodyHtml = true;
        Email1.Priority = System.Net.Mail.MailPriority.High;
        System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient();
        System.Net.NetworkCredential basicAuthenticationInfo = new System.Net.NetworkCredential("krishna.russsh@gmail.com", "vidhi4321*");
        mailClient.UseDefaultCredentials = false;
        mailClient.Host = "smtp.gmail.com";
        mailClient.Port = 587;
        mailClient.EnableSsl = true;
        mailClient.Credentials = basicAuthenticationInfo;
        try
        {
            mailClient.Send(Email1);
            return "Y";
        }
        catch (Exception ee)
        {

            return "N";
        }

    }


    public void Reset()
    {
        txtBookedBy.Text = "";
        txtTask.Text = "";
        txtEmail.Text = "";
        txtDate.Text = "";
        txtContactNo.Text = "";

        txtPickupName.Text = "";
        txtPickupAddress.Text = "";

        txtDropoffName.Text = "";
        txtDropOffAddress.Text = "";
    }


    public string GetPassword(string EmailID)
    {
        string returnstring = "0";

        open_conenction();
        DataSet dsss = new DataSet();
        SqlDataAdapter da;
        try
        {
            cmd = new SqlCommand("select Password from UserLoginDetail where Email='" + EmailID + "'", con);
            cmd.CommandType = CommandType.Text;

            da = new SqlDataAdapter(cmd);
            da.Fill(dsss);

        }
        catch (Exception e)
        {
        }
        finally
        {
            cmd.Dispose();
            con.Close();
        }

        if (dsss.Tables.Count > 0)
        {
            if (dsss.Tables[0].Rows.Count > 0)
            {
                returnstring = dsss.Tables[0].Rows[0].ItemArray[0].ToString();
            }
        }




        return returnstring;
    }




    public string BookTask(int CustomerID, string TaskDate, string TaskDetail, string TaskEmail, string TaskContact, string pickuotime, string dropuptime, int TaskType, int PaymentAt, string pickupname, string pickaddress, string pickuplandmark, string dropupname, string dropupaddress, string dropuplandmark, string pmobile, string parea, string pcity, string ppincode, string dmobile, string darea, string dcity, string dpincode, string DropTimeID, string TaskMode, string XmlString)
    {

        string DeliveryOptionSpoorID = "";
        string ModeOfCollectionSpoorID = "";
        string ActualPrice = "";
        if (rdoAdvanced.Checked == true && rdoOneway.Checked == true)
        {
            DeliveryOptionSpoorID = "3";
            ModeOfCollectionSpoorID = "9";
            ActualPrice = "150";
        }
        else if (rdoSameDay.Checked == true && rdoOneway.Checked == true)
        {
            DeliveryOptionSpoorID = "2";
            ModeOfCollectionSpoorID = "4";
            ActualPrice = "200";
        }
        else if (rdoExpress.Checked == true && rdoOneway.Checked == true)
        {
            DeliveryOptionSpoorID = "1";
            ModeOfCollectionSpoorID = "11";
            ActualPrice = "300";
        }


        //for return
        else if (rdoAdvanced.Checked == true && rdoReturn.Checked == true)
        {
            DeliveryOptionSpoorID = "3";
            ModeOfCollectionSpoorID = "10";
            ActualPrice = "300";
        }
        else if (rdoSameDay.Checked == true && rdoReturn.Checked == true)
        {
            DeliveryOptionSpoorID = "2";
            ModeOfCollectionSpoorID = "8";
            ActualPrice = "400";
        }
        else if (rdoExpress.Checked == true && rdoReturn.Checked == true)
        {
            DeliveryOptionSpoorID = "1";
            ModeOfCollectionSpoorID = "5";
            ActualPrice = "550";
        }


        //for COD
        else if (rdoAdvanced.Checked == true && rdoCod.Checked == true)
        {
            DeliveryOptionSpoorID = "4";
            ModeOfCollectionSpoorID = "12";
            ActualPrice = "250";
        }
        else if (rdoSameDay.Checked == true && rdoCod.Checked == true)
        {
            DeliveryOptionSpoorID = "5";
            ModeOfCollectionSpoorID = "13";
            ActualPrice = "300";
        }
        else if (rdoExpress.Checked == true && rdoCod.Checked == true)
        {
            DeliveryOptionSpoorID = "6";
            ModeOfCollectionSpoorID = "14";
            ActualPrice = "400";
        }
        //for Multiple Delivery

        else if (rdoAdvanced.Checked == true && rdoMulti.Checked == true)
        {
            DeliveryOptionSpoorID = "3";
            ModeOfCollectionSpoorID = "10";
            ActualPrice = "300";
        }
        else if (rdoSameDay.Checked == true && rdoMulti.Checked == true)
        {
            DeliveryOptionSpoorID = "2";
            ModeOfCollectionSpoorID = "8";
            ActualPrice = "400";
        }
        else if (rdoExpress.Checked == true && rdoMulti.Checked == true)
        {
            DeliveryOptionSpoorID = "1";
            ModeOfCollectionSpoorID = "5";
            ActualPrice = "550";
        }


        string returnstring = "0";

        open_conenction();
        DataSet dsss = new DataSet();
        SqlDataAdapter da;
        try
        {
            HttpCookie cookie = Request.Cookies["TOKEN"];

            if (XmlString != "")
            {
                cmd = new SqlCommand("BookATaskNew", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@xml", SqlDbType.Xml).Value = XmlString;
            }
            else
            {
                cmd = new SqlCommand("BookATask", con);
                cmd.CommandType = CommandType.StoredProcedure;
            }

            cmd.Parameters.Add("@TaskID", SqlDbType.Int).Value = 0;
            cmd.Parameters.Add("@CustomerID", SqlDbType.Int).Value = CustomerID;
            cmd.Parameters.Add("@TaskDate", SqlDbType.VarChar, 10).Value = TaskDate;
            cmd.Parameters.Add("@TaskDetail", SqlDbType.NVarChar).Value = TaskDetail;
            cmd.Parameters.Add("@TaskEmail", SqlDbType.NVarChar, 50).Value = TaskEmail;
            cmd.Parameters.Add("@TaskContact", SqlDbType.NVarChar, 50).Value = TaskContact;
            cmd.Parameters.Add("@PickupTime", SqlDbType.NVarChar, 50).Value = pickuotime;
            cmd.Parameters.Add("@DropUpTime", SqlDbType.NVarChar, 50).Value = dropuptime;

     

                int PackID = 0;

                if (rdoSameDay.Checked == true)
                {
                    PackID = 3;
                }
                else if (rdoAdvanced.Checked == true)
                {
                    PackID = 1;
                }
                else if (rdoExpress.Checked == true)
                {
                    PackID = 2;
                }

                if (rdoOneway.Checked == true)
                {
                    TaskType = 0;
                }
                else if (rdoReturn.Checked == true)
                {
                    TaskType = 1;
                }
                else if (rdoMulti.Checked == true)
                {
                    TaskType = 0;
                }
                else if (rdoCod.Checked == true)
                {
                    TaskType = 2;
                }

            
            cmd.Parameters.Add("@TaskType", SqlDbType.Int).Value = TaskType;
            cmd.Parameters.Add("@PaymentMethod", SqlDbType.Int).Value = PaymentAt;
            cmd.Parameters.Add("@PickupName", SqlDbType.NVarChar).Value = pickupname;
            cmd.Parameters.Add("@PickupAddress", SqlDbType.NVarChar).Value = pickaddress;
            cmd.Parameters.Add("@PickupLandmark", SqlDbType.NVarChar).Value = pickuplandmark;

            cmd.Parameters.Add("@PickupMobile", SqlDbType.NVarChar, 50).Value = pmobile;
            cmd.Parameters.Add("@PickupArea", SqlDbType.NVarChar, 50).Value = parea;
            cmd.Parameters.Add("@PickupCity", SqlDbType.NVarChar, 50).Value = pcity;
            cmd.Parameters.Add("@PickupPincode", SqlDbType.NVarChar, 50).Value = ppincode;

            cmd.Parameters.Add("@DropOffName", SqlDbType.NVarChar).Value = dropupname;
            cmd.Parameters.Add("@DropOffAddress", SqlDbType.NVarChar).Value = dropupaddress;
            cmd.Parameters.Add("@DropOffLandmark", SqlDbType.NVarChar).Value = dropuplandmark;

            cmd.Parameters.Add("@DropoffMobile", SqlDbType.NVarChar, 50).Value = dmobile;
            cmd.Parameters.Add("@DropoffArea", SqlDbType.NVarChar, 50).Value = darea;
            cmd.Parameters.Add("@DropoffCity", SqlDbType.NVarChar, 50).Value = dcity;
            cmd.Parameters.Add("@DropoffPincode", SqlDbType.NVarChar, 50).Value = dpincode;

            cmd.Parameters.Add("@TaskDescripotionID", SqlDbType.Int).Value = Convert.ToInt32(ddlTaskDetail.SelectedValue);
            cmd.Parameters.Add("@PickUpTimeID", SqlDbType.Int).Value = Convert.ToInt32(ddlPickUpTime.SelectedValue);
            if (TaskMode == "S")
            {
                cmd.Parameters.Add("@DropUpTimeID", SqlDbType.Int).Value = Convert.ToInt32(ddlDropOffTime.SelectedValue);
            }
            else if (TaskMode == "M")
            {
                cmd.Parameters.Add("@DropUpTimeID", SqlDbType.Int).Value = Convert.ToInt32(DropTimeID);
            }
            int amt = 0;

            amt = Convert.ToInt32(ActualPrice);
            cmd.Parameters.Add("@PackageID", SqlDbType.Int).Value = Convert.ToInt32(PackID);

            if (txtAmount.Text == "")
            {
                txtAmount.Text = "0";
            }
            cmd.Parameters.Add("@Amount", SqlDbType.Int).Value = ActualPrice;
            int CODAMOUNT = 0;
            try
            {
                CODAMOUNT = Convert.ToInt32(txtAmount.Text);
            }
            catch (Exception EE)
            {
                CODAMOUNT = 0;

            }
            cmd.Parameters.Add("@CODAmount", SqlDbType.Int).Value = CODAMOUNT;

            if (TaskMode == "S")
            {
                cmd.Parameters.Add("@GUID", SqlDbType.VarChar, 100).Value = "NONE";
            }
            else if (TaskMode == "M")
            {
                cmd.Parameters.Add("@GUID", SqlDbType.VarChar, 100).Value = lblGuid.Text;
            }


            da = new SqlDataAdapter(cmd);
            da.Fill(dsss);

        }
        catch (Exception e)
        {
        }
        finally
        {
            cmd.Dispose();
            con.Close();
        }
        string Tid = "0";
        if (dsss.Tables.Count > 0)
        {
            if (dsss.Tables[0].Rows.Count > 0)
            {
                returnstring = dsss.Tables[0].Rows[0].ItemArray[0].ToString();
                Tid = returnstring;

                open_conenction();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "update BookTask set ProductValue=" + txtTaskValue.Text.ToString().Trim() + " where BookTaskId=" + Tid;
                cmd.ExecuteNonQuery();
                con.Close();
                
            }
        }
        return returnstring;
    }

    public string RegisterNewCustomer()
    {

        string returnstring = "0";
        string Password = " ";

        string path = Path.GetRandomFileName();
        path = path.Replace(".", "");
        Password = path;

        open_conenction();
        DataSet dsss = new DataSet();
        SqlDataAdapter da;
        try
        {
            cmd = new SqlCommand("RegisterClient", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ClientID", SqlDbType.Int).Value = 0;
            cmd.Parameters.Add("@Fname", SqlDbType.NVarChar).Value = txtBookedBy.Text;
            cmd.Parameters.Add("@MName", SqlDbType.NVarChar).Value = "";
            cmd.Parameters.Add("@Lname", SqlDbType.NVarChar).Value = "";
            cmd.Parameters.Add("@DOB", SqlDbType.NVarChar).Value = "1991-01-01";
            cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = txtEmail.Text;
            cmd.Parameters.Add("@MobileNo", SqlDbType.NVarChar).Value = txtContactNo.Text;
            cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = Password;
            da = new SqlDataAdapter(cmd);
            da.Fill(dsss);

        }
        catch (Exception e)
        {

        }
        finally
        {
            cmd.Dispose();
            con.Close();
        }

        if (dsss.Tables.Count > 0)
        {
            if (dsss.Tables[0].Rows.Count > 0)
            {
                returnstring = dsss.Tables[0].Rows[0].ItemArray[1].ToString() + "," + Password;
            }
        }

        return returnstring;
    }

    void fillTaskType()
    {
        ddlTaskDetail.Items.Clear();
        ListItem ltt = new ListItem("Pick any one item for delivery.", "0");
        ddlTaskDetail.Items.Add(ltt);
        open_conenction();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select Name,SPOID from TaskNameDescription where Active=1 order by OrderNo ";
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            ListItem ltt1 = new ListItem(dr["Name"].ToString(), dr["SPOID"].ToString());
            ddlTaskDetail.Items.Add(ltt1);
        }
        dr.Close();
        con.Close();
    }
    void fillPickUpTimes()
    {
        ddlPickUpTime.Items.Clear();
        ListItem ltt = new ListItem("Select Pick-up Time", "0");
        ddlPickUpTime.Items.Add(ltt);
        open_conenction();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select FromToTimeSlot,TimeSlotId from TimeSlot where Active=1 order by TimeSlotId ";
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            ListItem ltt1 = new ListItem(dr["FromToTimeSlot"].ToString(), dr["TimeSlotId"].ToString());
            ddlPickUpTime.Items.Add(ltt1);
        }
        dr.Close();
        con.Close();
    }
    void fillDropOffTimes()
    {

        ddlDropOffTime.Items.Clear();
        ListItem ltt = new ListItem("Select Drop-off Time", "0");
        ddlDropOffTime.Items.Add(ltt);
        open_conenction();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select FromToTimeSlot,TimeSlotId from TimeSlot where Active=1 order by TimeSlotId ";
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            ListItem ltt1 = new ListItem(dr["FromToTimeSlot"].ToString(), dr["TimeSlotId"].ToString());
            ddlDropOffTime.Items.Add(ltt1);
        }
        dr.Close();
        con.Close();
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
    private int CheckEmail(string Email)
    {

        int count = 0;

        open_conenction();
        if (con.State.ToString().Equals("Open"))
        {
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select count(*) from Client where Email='" + Email + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            try
            {
                count = Convert.ToInt32(dr[0]);
            }
            catch (Exception e)
            {
                count = 0;
            }
            dr.Close();
            con.Close();
            cmd.Dispose();
        }

        return count;
    }

    public static string EscapeStringValue(string value)
    {
        const char BACK_SLASH = '\\';
        const char SLASH = '/';
        const char DBL_QUOTE = '"';

        var output = new StringBuilder(value.Length);
        foreach (char c in value)
        {
            switch (c)
            {
                case SLASH:
                    output.AppendFormat("{0}{1}", BACK_SLASH, SLASH);
                    break;

                case BACK_SLASH:
                    output.AppendFormat("{0}{0}", BACK_SLASH);
                    break;

                case DBL_QUOTE:
                    output.AppendFormat("{0}", DBL_QUOTE);
                    break;

                default:
                    output.Append(c);
                    break;
            }
        }

        return output.ToString();
    }

    #endregion



    protected void btnStepOne_Click(object sender, EventArgs e)
    {
        if (rdoOneway.Checked == false && rdoReturn.Checked == false && rdoMulti.Checked == false && rdoCod.Checked == false)
        {
            rdoOneway.Checked = true;
        }
        if (txtTask.Text.ToString().Length < 2)
        {
            lblError.Text = "Enter a detailed Task Instruction!";
            LinkButton1_ModalPopupExtender.Show();
            return;
        }
        AccordionPane2.Enabled = true;
        UserAccordion.SelectedIndex = 1;
    }
    protected void btnStepTwo_Click(object sender, EventArgs e)
    {



        char[] delimiters2 = new char[] { '/' };


        string[] p = txtDate.Text.ToString().Split(delimiters2);


        string date = p[2] + "-" + p[1] + "-" + p[0];
        DateTime selectedDate = Convert.ToDateTime(date);

        DateTime todayDate = DateTime.Today;

        int diff = Convert.ToInt32((selectedDate - todayDate).TotalDays);

        if (txtPickUpPinCode.Text.ToString().Length < 6)
        {
            lblError.Text = "Invalid Pin Code!";
            LinkButton1_ModalPopupExtender.Show();
            return;
        }



        Guid g;
        // Create and display the value of two GUIDs.
        g = Guid.NewGuid();
        lblGuid.Text = g.ToString();


        UpdateCaptchaText();

        if (rdoMulti.Checked == true)
        {

            if (rdoMulti.Checked == true)
            {
                lblMultiadd.Visible = true;
                lblDropOff_Address.Text = "Enter Drop Address 1";
            }
            else
            {
                lblMultiadd.Visible = false;
                lblDropOff_Address.Text = String.Empty;
            }
           


            btnAdd.Visible = true;
            multipleaddress.Visible = true;

            RequiredFieldValidator12.Enabled = false;
            RequiredFieldValidator13.Enabled = false;
            RequiredFieldValidator15.Enabled = false;
            RequiredFieldValidator18.Enabled = false;
            RequiredFieldValidator4.Enabled = false;
          //  RequiredFieldValidator8.Enabled = false;
            RegularExpressionValidator8.Enabled = false;
           // RegularExpressionValidator4.Enabled = false;
            lblID.Text = "0";
            txtDropoffName.Text = "";
            txtDropOffAddress.Text = "";
            txtDropArea.Text = "";
            txtDropCity.Text = "";
            txtDropOffMobileNo.Text = "";
            txtDropOffPinCode.Text = "";

        }
        else
        {
            btnAdd.Visible = false;
            multipleaddress.Visible = false;

            RequiredFieldValidator12.Enabled = true;
            RequiredFieldValidator13.Enabled = true;
            RequiredFieldValidator15.Enabled = true;
            RequiredFieldValidator18.Enabled = true;
            RequiredFieldValidator4.Enabled = true;
           // RequiredFieldValidator8.Enabled = true;

        }

        AccordionPane3.Enabled = true;
        UserAccordion.SelectedIndex = 2;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {

        if (rdoMulti.Checked == true && GridView1.Rows.Count == 0)
        {
            lblError.Text = "Please enter drop-off addresses one by one.";
            LinkButton1_ModalPopupExtender.Show();
            return;
        }
        if (rdoMulti.Checked == true && GridView1.Rows.Count == 1)
        {
            lblError.Text = "More than one drop-off addresses required.";
            LinkButton1_ModalPopupExtender.Show();
            return;
        }

        else if (rdoMulti.Checked == false)
        {
            if (txtDropOffPinCode.Text.ToString().Length < 6)
            {
                lblError.Text = "Invalid Pincode!";
                LinkButton1_ModalPopupExtender.Show();
                return;
            }
        }
        if (CheckBox1.Checked == false)
        {
            lblError.Text = "Please agree with the terms & conditions";
            LinkButton1_ModalPopupExtender.Show();
            return;
        }


        bool success = false;
        if (Session["Captcha"] != null)
        {
            string s = Session["Captcha"].ToString();

            if (Convert.ToString(s) == txtCaptchaText.Text.Trim())
            {
                success = true;
            }
        }

        //
        if (!success)
        {
            lblStatus.Visible = true;
            lblStatus.Text = "Invalid Captcha Code. Try Again";
            lblError.Text = "Invalid Captcha Code. Try Again";
            LinkButton1_ModalPopupExtender.Show();
            lblStatus.ForeColor = System.Drawing.Color.Red;
            return;

        }
        bool isValid = true;
        isValid = true;
        if (isValid)
        {

            string BookedBy = txtBookedBy.Text;
            string TaskDetail = txtTask.Text;
            string Email = txtEmail.Text;
            string TaskDate = txtDate.Text;
            string TaskContact = txtContactNo.Text;
            string pickupTime = ddlPickUpTime.SelectedValue.ToString();
            string dropupTime = ddlDropOffTime.SelectedValue.ToString();
            int TaskType = 0;
            if (rdoOneway.Checked == true)
            {
                TaskType = 0;
            }
            else if (rdoReturn.Checked == true)
            {
                TaskType = 1;
            }
            else if (rdoCod.Checked == true)
            {
                TaskType = 2;
            }
            int PaymentCollect = 0;
            if (rdoPickup.Checked == true)
            {
                PaymentCollect = 0;
            }
            else if (rdoDelivery.Checked == true)
            {
                PaymentCollect = 1;
            }

            string pickupName = txtPickupName.Text;
            string pickupAddress = txtPickupAddress.Text;
            string pickupLandmark = " ";
            string pickupMobile = "";
            if (txtPickupMobileNo.Text == "")
            {
                pickupMobile = "9999999999";
            }
            else
            {
                pickupMobile = txtPickupMobileNo.Text;
            }
            string pickupArea = txtPickUpArea.Text;
            string pickupCity = txtPickUpCity.Text;
            string pickupPinCode = "";
            if (txtPickUpPinCode.Text == "")
            {
                pickupPinCode = "000000";
            }
            else
            {
                pickupPinCode = txtPickUpPinCode.Text;
            }







            string regstr = RegisterNewCustomer();
            char[] delimiters = new char[] { ',' };
            string[] parts = regstr.Split(delimiters,
                             StringSplitOptions.RemoveEmptyEntries);
            string NewCustomerID = parts[0];
            string NewCustomerPassword = "";
            try
            {
                NewCustomerPassword = parts[1];
            }
            catch (Exception eee)
            {
                NewCustomerPassword = "";
            }


            //LOOP PLACE

            string dropupName = txtDropoffName.Text;
            string dropupAddress = txtDropOffAddress.Text;
            string dropupLandmark = " ";

            string dropoffMobile = "";
            if (txtDropOffMobileNo.Text == "")
            {
                dropoffMobile = "9999999999";
            }
            else
            {
                dropoffMobile = txtDropOffMobileNo.Text;
            }
            string dropoffArea = txtDropArea.Text;
            string dropoffCity = txtDropCity.Text;
            string dropoffPinCode = "";
            if (txtDropOffPinCode.Text == "")
            {
                dropoffPinCode = "000000";
            }
            else
            {
                dropoffPinCode = txtDropOffPinCode.Text;
            }
            char[] delimiters1 = new char[] { '/' };
            string[] parts1 = TaskDate.Split(delimiters1,
                                StringSplitOptions.RemoveEmptyEntries);
            TaskDate = parts1[2] + "-" + parts1[1] + "-" + parts1[0];
            TaskDetail = TaskDetail.Replace("&", " and ");

            string bookstr = "";
            if (rdoMulti.Checked == true)
            {
                int i = 0;
                string XMLSTRING = "";
                XMLSTRING = XMLSTRING + "<addresses>";
                for (i = 0; i <= GridView1.Rows.Count - 1; i++)
                {

                    XMLSTRING = XMLSTRING + "<address>";
                    Label lblName = new Label();
                    Label lblAddress = new Label();
                    Label lblArea = new Label();
                    Label lblCity = new Label();
                    Label lblPincode = new Label();
                    Label lblMobile = new Label();
                    Label lblTimeSlotID = new Label();
                    Label lblDropoffTime = new Label();

                    lblName = GridView1.Rows[i].FindControl("lblName") as Label;
                    lblAddress = GridView1.Rows[i].FindControl("lblAddress") as Label;
                    lblArea = GridView1.Rows[i].FindControl("lblArea") as Label;
                    lblCity = GridView1.Rows[i].FindControl("lblCity") as Label;
                    lblPincode = GridView1.Rows[i].FindControl("lblPincode") as Label;
                    lblMobile = GridView1.Rows[i].FindControl("lblMobile") as Label;
                    lblTimeSlotID = GridView1.Rows[i].FindControl("lblTimeSlotID") as Label;
                    lblDropoffTime = GridView1.Rows[i].FindControl("lblDropoffTime") as Label;
                    XMLSTRING = XMLSTRING + "<id>" + (i + 1).ToString() + "</id>";
                    XMLSTRING = XMLSTRING + "<name>" + Server.HtmlEncode(lblName.Text) + "</name>";
                    XMLSTRING = XMLSTRING + "<place>" + Server.HtmlEncode(lblAddress.Text) + "</place>";
                    XMLSTRING = XMLSTRING + "<area>" + Server.HtmlEncode(lblArea.Text) + "</area>";
                    XMLSTRING = XMLSTRING + "<city>" + Server.HtmlEncode(lblCity.Text) + "</city>";
                    XMLSTRING = XMLSTRING + "<pincode>" + Server.HtmlEncode(lblPincode.Text) + "</pincode>";
                    XMLSTRING = XMLSTRING + "<mobile>" + Server.HtmlEncode(lblMobile.Text) + "</mobile>";
                    XMLSTRING = XMLSTRING + "<timeslotid>" + lblTimeSlotID.Text + "</timeslotid>";
                    XMLSTRING = XMLSTRING + "<timeslot>" + lblDropoffTime.Text + "</timeslot>";
                    XMLSTRING = XMLSTRING + "</address>";


                }
                XMLSTRING = XMLSTRING + "</addresses>";
                bookstr = BookTask(Convert.ToInt32(NewCustomerID), TaskDate, TaskDetail, Email, TaskContact, pickupTime, "", TaskType, PaymentCollect,
                   pickupName, pickupAddress, pickupLandmark, "", "", dropupLandmark, pickupMobile, pickupArea, pickupCity, pickupPinCode, "", "", "", "", "0", "M", XMLSTRING);
            }
            else
            {
                bookstr = BookTask(Convert.ToInt32(NewCustomerID), TaskDate, TaskDetail, Email, TaskContact, pickupTime, dropupTime, TaskType, PaymentCollect,
                pickupName, pickupAddress, pickupLandmark, dropupName, dropupAddress, dropupLandmark, pickupMobile, pickupArea, pickupCity, pickupPinCode, dropoffMobile, dropoffArea, dropoffCity, dropoffPinCode, "0", "S", "");

            }

          
            lblError.Text = bookstr;
            if (bookstr != "0")
            {
                string str = "";
                str = str + "Name:" + txtBookedBy.Text + "<br>";
                str = str + "Contact:" + TaskContact + "<br>";
                str = str + "TaskDetail:" + TaskDetail + "<br>";
                str = str + "Task Date:" + TaskDate + "<br>";
                str = str + "Task Date:" + TaskDate + "<br>";
                str = str + "TaskType:" + TaskType + "<br>";
                str = str + "Payment Collect:" + PaymentCollect + "<br>";
                str = str + "Pickup Name:" + pickupName + "<br>";
                str = str + "Pickup Address:" + pickupAddress + "<br>";
                str = str + "Pickup Landmark:" + pickupLandmark + "<br>";
                str = str + "Drop-off Time:" + dropupTime + "<br>";
                str = str + "Drop-off Name:" + dropupName + "<br>";
                str = str + "Drop-off Address:" + dropupAddress + "<br>";
                str = str + "Drop-off Landmark:" + dropupLandmark + "<br>";

                string sflag = "";
                open_conenction();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "select STATUS from SMSFLAG";
                dr = cmd.ExecuteReader();
                dr.Read();
                try
                {
                    sflag = dr.GetValue(0).ToString();
                }
                catch (Exception e11)
                {
                    sflag = "N";
                }
                dr.Close();
                con.Close();

                if (sflag == "Y")
                {

                    WebClient client = new WebClient();
                    client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");

                    string DestinationMobile = TaskContact;
                    string MessagePart = Server.UrlEncode("Dear " + BookedBy + ", Thank you for booking your task with Russsh.com You will receive your confirmation within the next 20 minutes.");

                    Stream data = client.OpenRead("http://enterprise.smsgupshup.com/GatewayAPI/rest?method=SendMessage&send_to=" + DestinationMobile + "&msg=" + MessagePart + "&msg_type=TEXT&userid=2000148575&auth_scheme=plain&password=getmypeon&v=1.1&format=text");
                    StreamReader reader = new StreamReader(data);
                    string s = reader.ReadToEnd();
                    Console.WriteLine(s);
                    data.Close();
                    reader.Close();
                }
                Session["CEMAIL"] = Email;
                Session["CNAMEW"] = BookedBy;
                Session["CPASS"] = NewCustomerPassword;

                try
                {
                    if (Request.Cookies["TOKEN"] != null)
                    {
                        Response.Cookies["TOKEN"].Expires = DateTime.Now.AddDays(-1);
                    }
                }
                catch (Exception ccc)
                {
                }

                Session["NEWBOOKINGID"] = bookstr;
                Reset();

                Response.Redirect("../Confirmation");
            }
            else
            {
                lblError.Text = "Booking a Task failed! Pls check all of your entries.";
                LinkButton1_ModalPopupExtender.Show();
            }

        }
        else
        {
            lblError.Text = "Invalid Captcha Code!";
            LinkButton1_ModalPopupExtender.Show();
        }


    }
    
}