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
    CrmClass crmObj = new CrmClass();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        string[] spiltstr;
        string clientid;
        
        if (!Page.IsPostBack)
        {
            if (Session["CLIENT_ID"] == null)
            {
                Response.Redirect("../signin/");
            }

           

            HttpCookie cookie = Request.Cookies["LOGINCOOKIE"];
            string c = "NONE";
            try
            {
              
                c = cookie.Value.ToString();
                spiltstr = c.Split('-');
                clientid = spiltstr[0].ToString();
                if (spiltstr[1].ToString() == "")
                {
                    Response.Redirect("../Signout");
                }

               try
                {
                    lblEmpID.Text = spiltstr[4].ToString();
                }
                catch (Exception ee)
                {
                    lblEmpID.Text = "0";
                }

		    try
            {
                if (Session["CLIENT_ID"] != "" && Session["CLIENT_ID"] != null)
                {
                    clientid = Session["CLIENT_ID"].ToString(); 
                }
            }
            catch (Exception e1)
            {
            }



                DataSet DsClientInfo = new DataSet();
                DsClientInfo = crmObj.Display_Data_BindForEditCrm("CLIENTDATA", Convert.ToInt32(clientid));
                lblLoggedInClientID.Text = clientid.ToString();
                int HasData = 0;
                if (DsClientInfo.Tables.Count > 0)
                {
                    if (DsClientInfo.Tables[0].Rows.Count > 0)
                    {

                        lblTClientID.Text = clientid.ToString();
                        txtBookedBy.Text = DsClientInfo.Tables[0].Rows[0].ItemArray[0].ToString();
                        txtEmail.Text = DsClientInfo.Tables[0].Rows[0].ItemArray[1].ToString();
                        txtContactNo.Text = DsClientInfo.Tables[0].Rows[0].ItemArray[2].ToString();
                        lblWalletBalance.Text = DsClientInfo.Tables[0].Rows[0].ItemArray[3].ToString();
                        if (lblWalletBalance.Text == "0")
                        {
                            rdoWallet.Checked = false;
                            rdoWallet.Enabled = false;
                            lblWalletBalance.Visible = false; 
                        }
                        else
                        {
                            if (Convert.ToInt32(lblWalletBalance.Text) >= 200)
                            {
                                rdoWallet.Enabled = true;
                                lblWalletBalance.Visible = true; 
                            }
         
                           
                        }



                        if (txtBookedBy.Text == "")
                        {
                            HasData = 0;
                        }
                        else
                        {
                            HasData = 1;
                            DataSet DsAdd = new DataSet();
                            DsAdd = crmObj.GetAdditionalAddress(Convert.ToInt32(clientid));
                            if (DsAdd.Tables.Count > 0)
                            {
                                if (DsAdd.Tables[0].Rows.Count > 0)
                                {
                                    lsteditsddress.DataSource = DsAdd;
                                    lsteditsddress.DataBind();
                                    ListView1.DataSource = DsAdd;
                                    ListView1.DataBind();
                                }
                            }
                        }
                        
                    }
                }
                if (HasData == 0)
                {
                    Response.Redirect("../Signout");
                }


            }
            catch (Exception e1)
            {
            }


            fillWeight();

            fillTaskType();
            fillPickUpTimes();
            fillDropOffTimes();
          
            fillareacity();
            //Reorder DataFilling

            string ReOrderTaskID = "0";
            if (Session["REORDERTASKID"] != "" && Session["REORDERTASKID"] != null && Session["REORDERTASKID"] != "0")
            {
                ReOrderTaskID = Session["REORDERTASKID"].ToString();
                DataSet DsTaskInfo = new DataSet();
                DsTaskInfo = crmObj.Display_Data_BindForEditCrm("TASKINFO", Convert.ToInt32(ReOrderTaskID));
                if (DsTaskInfo.Tables.Count > 0)
                {
                    ddlTaskDetail.SelectedValue = DsTaskInfo.Tables[1].Rows[0].ItemArray[2].ToString();
                    txtTask.Text = DsTaskInfo.Tables[1].Rows[0].ItemArray[3].ToString();

                    txtPickupName.Text = DsTaskInfo.Tables[2].Rows[0].ItemArray[0].ToString();
                    txtPickupAddress.Text = DsTaskInfo.Tables[2].Rows[0].ItemArray[1].ToString();
                    txtPickUpArea.Text = DsTaskInfo.Tables[2].Rows[0].ItemArray[2].ToString();
                    txtPickUpCity.Text = DsTaskInfo.Tables[2].Rows[0].ItemArray[3].ToString();
                    txtPickUpPinCode.Text = DsTaskInfo.Tables[2].Rows[0].ItemArray[5].ToString();
                    txtPickupMobileNo.Text = DsTaskInfo.Tables[2].Rows[0].ItemArray[4].ToString();

                    txtDropoffName.Text = DsTaskInfo.Tables[3].Rows[0].ItemArray[0].ToString();
                    txtDropOffAddress.Text = DsTaskInfo.Tables[3].Rows[0].ItemArray[1].ToString();
                    txtDropArea.Text = DsTaskInfo.Tables[3].Rows[0].ItemArray[2].ToString();
                    txtDropCity.Text = DsTaskInfo.Tables[3].Rows[0].ItemArray[3].ToString();
                    txtDropOffPinCode.Text = DsTaskInfo.Tables[3].Rows[0].ItemArray[5].ToString();
                    txtDropOffMobileNo.Text = DsTaskInfo.Tables[3].Rows[0].ItemArray[4].ToString();


                }


            }






            UserAccordion.SelectedIndex = 0;
            AccordionPane2.Enabled = false;
            AccordionPane3.Enabled = false;
            AccordionPane2.Visible = false;
            AccordionPane3.Visible = false;

            AddressBook.Visible = true;
            AddressBook2.Visible = true;
        }

    }
  
    
    public string datename(string TaskDate)
    {
        string dayname = "";
        TaskDate = TaskDate + " 00:00:00.000";
        open_conenction();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select DATENAME(weekday,'" + TaskDate + "')";
        dr = cmd.ExecuteReader();
        dr.Read();
        try
        {
            dayname = dr.GetValue(0).ToString();
        }
        catch (Exception ed)
        {

        }
        dr.Close();

        con.Close();

        return dayname;
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
            cmd.CommandText = "insert into Additional_Address(Name,Address,Area,City,Mobile,Pincode,TimeSlot,TimeSlotID,TaskID,GUID,CityID,AreaID) values('" + txtDropoffName.Text + "','" + txtDropOffAddress.Text + "','" + ddldarea.SelectedItem.ToString() + "','" + ddldcity.SelectedItem.ToString() + "','" + txtDropOffMobileNo.Text + "','" + txtDropOffPinCode.Text + "','" + ddlDropOffTime.SelectedItem.Text + "'," + ddlDropOffTime.SelectedValue.ToString() + ",0,'" + lblGuid.Text + "',"+ddldcity.SelectedValue.ToString()+","+ddldarea.SelectedValue.ToString()+")";
            cmd.ExecuteNonQuery();
        }
        else
        {
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "update Additional_Address set Name='" + txtDropoffName.Text + "',Address='" + txtDropOffAddress.Text + "',Area='" + ddldarea.SelectedItem.ToString() + "',City='" + ddldcity.SelectedItem.ToString() + "',Mobile='" + txtDropOffMobileNo.Text + "',Pincode='" + txtDropOffPinCode.Text + "',TimeSlotID=" + ddlDropOffTime.SelectedValue.ToString() + ",TimeSlot='" + ddlDropOffTime.SelectedItem.Text + "',CityID="+ddldcity.SelectedValue.ToString()+",AreaID="+ddldarea.SelectedValue.ToString()+" where ID=" + lblID.Text;
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
            ActualPrice = "150";
        }
        else if (rdoSameDay.Checked == true && rdoMulti.Checked == true)
        {
            DeliveryOptionSpoorID = "2";
            ModeOfCollectionSpoorID = "8";
            ActualPrice = "200";
        }
        else if (rdoExpress.Checked == true && rdoMulti.Checked == true)
        {
            DeliveryOptionSpoorID = "1";
            ModeOfCollectionSpoorID = "5";
            ActualPrice = "300";
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
                cmd = new SqlCommand("BookATaskNew_Summary", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@xml", SqlDbType.Xml).Value = XmlString;
            }
            else
            {
                cmd = new SqlCommand("BookATask_Summary", con);
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
            cmd.Parameters.Add("@Amount", SqlDbType.Int).Value = Convert.ToInt32(lblNetPayable.Text);
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
            cmd.Parameters.Add("@ServiceFee", SqlDbType.Int).Value = Convert.ToInt32(lblService_Fee.Text);
            cmd.Parameters.Add("@InsuranceFee", SqlDbType.Int).Value = Convert.ToInt32(lblInsurance_Fee.Text);
            cmd.Parameters.Add("@TransportFee", SqlDbType.Int).Value = Convert.ToInt32(lblAdTransport_Fee.Text);
            cmd.Parameters.Add("@CashHandlingFee", SqlDbType.Int).Value = Convert.ToInt32(lblCashHand_Fee.Text);
            cmd.Parameters.Add("@ExcessBaggageFee", SqlDbType.Int).Value = Convert.ToInt32(lblExcessBaggage_Fee.Text);
            cmd.Parameters.Add("@TotalCost", SqlDbType.Int).Value = Convert.ToInt32(lblTotalApproximatedFee.Text);
            cmd.Parameters.Add("@CoupanCode", SqlDbType.VarChar, 50).Value = txtCoupanCode.Text;
            cmd.Parameters.Add("@EmpID", SqlDbType.Int).Value = Convert.ToInt32(lblEmpID.Text);
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

    void fillWeight()
    {
        ddlWeight.Items.Clear();
        ListItem ll = new ListItem("Select weight of the parcel.", "0");
        ddlWeight.Items.Add(ll);

        ListItem ll1 = new ListItem("0-5 Kg.", "0");
        ddlWeight.Items.Add(ll1);

        ListItem ll2 = new ListItem("5-10 Kg.", "100");
        ddlWeight.Items.Add(ll2);

        ListItem ll3 = new ListItem("10-15 Kg.", "200");
        ddlWeight.Items.Add(ll3);

        ListItem ll4 = new ListItem("15-20 Kg.", "300");
        ddlWeight.Items.Add(ll4);

        ListItem ll5 = new ListItem("20-50 Kg.", "400");
        ddlWeight.Items.Add(ll5);

        ListItem ll6 = new ListItem("25-30 Kg.", "500");
        ddlWeight.Items.Add(ll6);

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
        //Code from First Button


        lblTAccessBaggageFee.Text = ddlWeight.SelectedValue.ToString();
        lblExcessBaggage_Fee.Text = ddlWeight.SelectedValue.ToString();

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
            return;
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

        string day_name = datename(date);

        if (day_name == "Sunday")
        {

            rdoAdvanced.Checked = false;
            rdoSameDay.Checked = true;
            rdoExpress.Checked = false;

        }

        //Code Ends

        




        
        
        
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

        if (chkInsurance.Checked == true)
        {
            int ProductValue = 0;
            try
            {
                ProductValue = Convert.ToInt32(txtTaskValue.Text);
            }
            catch (Exception e11)
            {
                ProductValue = 0;
            }
            double percentvalue = 0;
            if (ProductValue > 0 && ProductValue <= 10000)
            {
                percentvalue = 0.5;
            }
            else if (ProductValue > 10000 && ProductValue <= 50000)
            {
                percentvalue = 1;
            }
            else if (ProductValue > 50000 && ProductValue <= 75000)
            {
                percentvalue = 1.5;
            }
            else if (ProductValue > 75000)
            {
                percentvalue = 2;
            }
            double InsuranceCost = (ProductValue * percentvalue) / 100;
            if (InsuranceCost < 0)
            {
                InsuranceCost = 0;
            }
            lblTInsuranceFee.Text = InsuranceCost.ToString();

        }


               
        AccordionPane2.Visible = true;
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



        if (rdoExpress.Checked == true)
        {
            try
            {
                ddlDropOffTime.SelectedValue = (Convert.ToInt32(ddlPickUpTime.SelectedValue) + 7).ToString();
            }
            catch (Exception ee)
            {
                ddlDropOffTime.SelectedValue = "0";
            }

        }

        string ActualPrice = "0";
        if (rdoAdvanced.Checked == true && rdoOneway.Checked == true)
        {          
            ActualPrice = "150";
            
        }
        else if (rdoSameDay.Checked == true && rdoOneway.Checked == true)
        {
           ActualPrice = "200";
        }
        else if (rdoExpress.Checked == true && rdoOneway.Checked == true)
        {         
            ActualPrice = "300";
        }
          //for return
        else if (rdoAdvanced.Checked == true && rdoReturn.Checked == true)
        {         
            ActualPrice = "300";
        }
        else if (rdoSameDay.Checked == true && rdoReturn.Checked == true)
        {           
            ActualPrice = "400";
        }
        else if (rdoExpress.Checked == true && rdoReturn.Checked == true)
        {
           ActualPrice = "550";
        }


        //for COD
        else if (rdoAdvanced.Checked == true && rdoCod.Checked == true)
        {
             ActualPrice = "250";
        }
        else if (rdoSameDay.Checked == true && rdoCod.Checked == true)
        {
            ActualPrice = "300";
        }
        else if (rdoExpress.Checked == true && rdoCod.Checked == true)
        {
            ActualPrice = "400";
        }
        //for Multiple Delivery

        else if (rdoAdvanced.Checked == true && rdoMulti.Checked == true)
        {
           
            ActualPrice = "150";
        }
        else if (rdoSameDay.Checked == true && rdoMulti.Checked == true)
        {         
            ActualPrice = "200";
        }
        else if (rdoExpress.Checked == true && rdoMulti.Checked == true)
        {          
            ActualPrice = "300";
        }

        lblTServiceFee.Text = ActualPrice;
        
      

        lblTAdditionalTransportFee.Text = "0";



        int CDAMT = 0;
        try
        {
            CDAMT = Convert.ToInt32(txtAmount.Text);
        }
        catch (Exception eee)
        {
            CDAMT = 0;
        }
        if (CDAMT > 0)
        {

            double pvalue = 0;
            if (CDAMT > 0 && CDAMT <= 10000)
            {
                pvalue = 0;
            }
            else if (CDAMT > 10000 && CDAMT <= 50000)
            {
                pvalue = 1;
            }
            else if (CDAMT > 50000 && CDAMT <= 75000)
            {
                pvalue = 1.5;
            }
            else if (CDAMT > 75000)
            {
                pvalue = 2;
            }
            double CashHandlingCost = (CDAMT * pvalue) / 100;
            if (CashHandlingCost < 0)
            {
                CashHandlingCost = 0;
            }
            lblTCashHandlingFee.Text = CashHandlingCost.ToString();
           }

        SumAll();
        AccordionPane3.Visible = true;
        AccordionPane3.Enabled = true;
   
        UserAccordion.SelectedIndex = 2;
    }
    public void SumAll()
    {
        lblService_Fee.Text = lblTServiceFee.Text;
        lblInsurance_Fee.Text = lblTInsuranceFee.Text;
        lblAdTransport_Fee.Text = lblTAdditionalTransportFee.Text;
        lblCashHand_Fee.Text = lblTCashHandlingFee.Text;
       int TotalApprox=0;
try
{
 TotalApprox = Convert.ToInt32(lblTServiceFee.Text) + Convert.ToInt32(lblTInsuranceFee.Text) + Convert.ToInt32(lblTAdditionalTransportFee.Text) + Convert.ToInt32(lblTCashHandlingFee.Text)+Convert.ToInt32(lblTAccessBaggageFee.Text);
}
catch(Exception e4)
{
}
        lblTotalApproximatedFee.Text = TotalApprox.ToString();
        lblNetPayable.Text = TotalApprox.ToString();
        if (Convert.ToInt32(TotalApprox) > Convert.ToInt32(lblWalletBalance.Text))
        {
            rdoWallet.Enabled = false;
            rdoPickup.Checked = true;

        }


    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        txtPickUpCity.Text = ddlcity.SelectedItem.Text.ToString();
        txtPickUpArea.Text = ddlarea.SelectedItem.Text.ToString();
        string idzone = ddlarea.SelectedValue.ToString();
      
        hndpickupzone.Value = idzone;
        string iddzone = ddldarea.SelectedValue.ToString();

        hnddropzone.Value = iddzone;
        txtDropCity.Text = ddldcity.SelectedItem.Text.ToString();
        txtDropArea.Text = ddldarea.SelectedItem.Text.ToString();

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

               
        bool isValid = true;
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
            else if (rdoWallet.Checked == true)
            {
                PaymentCollect = 2;
            }
            else if (rdoOnline.Checked == true)
            {
                PaymentCollect = 3;
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
            string NewCustomerID = lblTClientID.Text;
           
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
                //Session["CPASS"] = NewCustomerPassword;

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
                PrepareClientData();
                Session["AMOUNTPAYABLE"] = lblTotalApproximatedFee.Text;
                Session["NEWBOOKINGID"] = bookstr;
                int PM = 0;
                if (rdoPickup.Checked == true)
                {
                    Session["PAYMENTMETHOD"] = "0";
                }
                else if (rdoDelivery.Checked == true)
                {
                    Session["PAYMENTMETHOD"] = "1";
                }
                else if (rdoWallet.Checked == true)
                {
                    Session["PAYMENTMETHOD"] = "2";
                }
               
                else if (rdoOnline.Checked == true)
                {
                    Session["PAYMENTMETHOD"] = "3";
                    PM=3;
                }

                Reset();
                if (PM == 3)
                {
                    Response.Redirect("../TaskPayment");
                }
                else
                {
                    Response.Redirect("../Confirmation");
                }
            }
            else
            {
                lblError.Text = "Booking a Task failed! Pls check all of your entries.";
                LinkButton1_ModalPopupExtender.Show();
            }

        }
       


    }


    public void PrepareClientData()
    {
        HttpCookie cookie = Request.Cookies["LOGINCOOKIE"];
        if (cookie.Value.ToString() != "" && cookie.Value.ToString() != null)
        {
            string CLD = "0";
            string str = cookie.Value.ToString();
            char[] deli = new char[] { '-' };
            string[] st = str.Split(deli, StringSplitOptions.RemoveEmptyEntries);
            CLD = st[0];

            DataSet ClientData = new DataSet();
            ClientData = crmObj.Display_Data_BindForEditCrm("CLIENTDATA", Convert.ToInt32(CLD));
            if (ClientData.Tables.Count > 0)
            {
                if (ClientData.Tables[0].Rows.Count > 0)
                {
                    Session["Client_Name"] = ClientData.Tables[0].Rows[0].ItemArray[0].ToString();
                    Session["Client_Email"] = ClientData.Tables[0].Rows[0].ItemArray[1].ToString();
                    Session["Client_Phone"] = ClientData.Tables[0].Rows[0].ItemArray[2].ToString();

                }
            }
        }

    }

    protected void btnAddressBook_Click(object sender, EventArgs e)
    {
       
    }
    public void FillList()
    {
        
    }
    protected void lsteditsddress_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "btnSelect")
        {

            Label lblAddressID = new Label();
            lblAddressID = e.Item.FindControl("lblid") as Label;

            lblSelectedAddressID.Text = lblAddressID.Text;

            int aid = Convert.ToInt32(lblAddressID.Text);
            Label txt_aname = (Label)e.Item.FindControl("lblname");
            Label txt_add = (Label)e.Item.FindControl("lbladd");
            Label txt_area1 = (Label)e.Item.FindControl("lblarea");
            Label txt_landmark = (Label)e.Item.FindControl("lbllandmark");
            Label txt_city1 = (Label)e.Item.FindControl("lblcity");
            Label txt_pin = (Label)e.Item.FindControl("lblpin");
            Label txt_mobile1 = (Label)e.Item.FindControl("lblmobile");
            Label lbl_cityid = (Label)e.Item.FindControl("lblCityID");
            Label lbl_areaid = (Label)e.Item.FindControl("lblAreaID");
            ddlcity.SelectedValue = lbl_cityid.Text;
            ddlarea.SelectedValue = lbl_areaid.Text;

            txtPickupName.Text = txt_aname.Text;
            txtPickupAddress.Text = txt_add.Text;
            txtPickUpArea.Text = txt_area1.Text;
            txtPickUpCity.Text = txt_city1.Text;
            txtPickUpPinCode.Text = txt_pin.Text;
            txtPickupMobileNo.Text = txt_mobile1.Text;
            
            ddlPickUpTime.Focus(); 
            
            
        }
    }
   
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "btnSelect")
        {

            Label lblAddressID = new Label();
            lblAddressID = e.Item.FindControl("lblid") as Label;
            if (lblSelectedAddressID.Text != lblAddressID.Text)
            {
                int aid = Convert.ToInt32(lblAddressID.Text);
                Label txt_aname = (Label)e.Item.FindControl("lblname");
                Label txt_add = (Label)e.Item.FindControl("lbladd");
                Label txt_area1 = (Label)e.Item.FindControl("lblarea");
                Label txt_landmark = (Label)e.Item.FindControl("lbllandmark");
                Label txt_city1 = (Label)e.Item.FindControl("lblcity");
                Label txt_pin = (Label)e.Item.FindControl("lblpin");
                Label txt_mobile1 = (Label)e.Item.FindControl("lblmobile");
                Label lbl_cityid = (Label)e.Item.FindControl("lblCityID");
                Label lbl_areaid = (Label)e.Item.FindControl("lblAreaID");
                
                ddldcity.SelectedValue = lbl_cityid.Text;
                ddldarea.SelectedValue = lbl_areaid.Text;

                
                
                txtDropoffName.Text = txt_aname.Text;
                txtDropOffAddress.Text = txt_add.Text;
                txtDropArea.Text = txt_area1.Text;
                txtDropCity.Text = txt_city1.Text;
                txtDropOffPinCode.Text = txt_pin.Text;
                txtDropOffMobileNo.Text = txt_mobile1.Text;
                ddlDropOffTime.Focus();
             
            }
            else
            {
                //lblDropAddressError.Text = "Error! Pick-up and Drop-off Details can not be same.";
            }
           

          
        }
    }

    public void fillareacity()
    {

        DataSet dsss = new DataSet();
        dsss = crmObj.GetCityArea("CITY");
        ddlcity.Items.Clear();
        ddldcity.Items.Clear();
        if (dsss.Tables.Count > 0)
        {
            if (dsss.Tables[0].Rows.Count > 0)
            {
                int i = 0;
                ListItem ll = new ListItem("Select City", "0");
                ddlcity.Items.Add(ll);

                ListItem lll = new ListItem("Select City", "0");
                ddldcity.Items.Add(lll);
                for (i = 0; i <= dsss.Tables[0].Rows.Count - 1; i++)
                {
                 
                    ListItem ltt1 = new ListItem(dsss.Tables[0].Rows[i].ItemArray[1].ToString(), dsss.Tables[0].Rows[i].ItemArray[0].ToString());
                    ddlcity.Items.Add(ltt1);

                    ListItem ltt2 = new ListItem(dsss.Tables[0].Rows[i].ItemArray[1].ToString(), dsss.Tables[0].Rows[i].ItemArray[0].ToString());
                    ddldcity.Items.Add(ltt2);
                }

                ddlcity.SelectedValue = "1";
                ddldcity.SelectedValue = "1";
            }
        }

        DataSet dsss1 = new DataSet();
        dsss1 = crmObj.GetCityArea("AREA");
        ddlarea.Items.Clear();
        ddldarea.Items.Clear();
        if (dsss1.Tables.Count > 0)
        {
            if (dsss1.Tables[0].Rows.Count > 0)
            {
                int i = 0;
                ListItem l1 = new ListItem("Select Area", "0");
                ddlarea.Items.Add(l1);
                ListItem l2 = new ListItem("Select Area", "0");
                ddldarea.Items.Add(l2);
                for (i = 0; i <= dsss1.Tables[0].Rows.Count - 1; i++)
                {
                   
                    ListItem ltt12 = new ListItem(dsss1.Tables[0].Rows[i].ItemArray[1].ToString(), dsss1.Tables[0].Rows[i].ItemArray[0].ToString());
                    ddlarea.Items.Add(ltt12);

                  
                    ListItem ltt21 = new ListItem(dsss1.Tables[0].Rows[i].ItemArray[1].ToString(), dsss1.Tables[0].Rows[i].ItemArray[0].ToString());
                    ddldarea.Items.Add(ltt21);
                }

            }
        }

    }
    protected void lsteditsddress_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label lblCityID = e.Item.FindControl("lblCityID") as Label;
        Label lblAreaID = e.Item.FindControl("lblAreaID") as Label;
        lblCityID.Visible = false;
        lblAreaID.Visible = false;
    }
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label lblCityID = e.Item.FindControl("lblCityID") as Label;
        Label lblAreaID = e.Item.FindControl("lblAreaID") as Label;
        lblCityID.Visible = false;
        lblAreaID.Visible = false;
    }
  
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        int RowCount = 0;
        RowCount = GridView1.Rows.Count;

        int SerCharge = Convert.ToInt32(lblTServiceFee.Text);
        if (RowCount> 5 && RowCount<=10)
        {
            SerCharge = 130;
        }
        else if (RowCount > 10 && RowCount <= 20)
        {
            SerCharge = 110;
        }
        else if (RowCount > 20 && RowCount <= 30)
        {
            SerCharge = 100;
        }
        else if (RowCount > 30 && RowCount <= 40)
        {
            SerCharge = 90;
        }
        else if (RowCount > 40 )
        {
            SerCharge = 80;
        }
        if (RowCount > 5)
        {
            lblTServiceFee.Text = (SerCharge * RowCount).ToString();
        }
        
        
        SpecialRecalculation();
              

    }
   
    public void SpecialRecalculation()
    {
       
        if (rdoMulti.Checked == true)
        {
            int FinalCost = 0;
            int PickUpAreaID = Convert.ToInt32(ddlarea.SelectedValue.ToString());
            int PickUpCost = 0;
            int PickUpZone = 0;
            int DropOffZone = 0;

            DataSet DsAdd = new DataSet();
            DsAdd = crmObj.Display_Data_BindForEditCrm("ADDITIONALCHARGES", PickUpAreaID);
            if (DsAdd.Tables.Count > 0)
            {
                if (DsAdd.Tables[0].Rows.Count > 0)
                {
                    PickUpCost = Convert.ToInt32(DsAdd.Tables[0].Rows[0].ItemArray[0].ToString());
                    PickUpZone = Convert.ToInt32(DsAdd.Tables[0].Rows[0].ItemArray[1].ToString());
                }
            }

            int i;
            i = 0;
            int SpecialAreas = 0;
            int SpecialZonesCount = 0;
            for (i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                int Price = 0;
                Label arid = GridView1.Rows[i].FindControl("lblDropAreaID") as Label;
                DsAdd = new DataSet();
                DsAdd = crmObj.Display_Data_BindForEditCrm("ADDITIONALCHARGES", Convert.ToInt32(arid.Text));
                if (DsAdd.Tables.Count > 0)
                {

                    if (DsAdd.Tables[0].Rows.Count > 0)
                    {
                        Price = Convert.ToInt32(DsAdd.Tables[0].Rows[0].ItemArray[0].ToString());
                    }
                    DropOffZone = Convert.ToInt32(DsAdd.Tables[0].Rows[0].ItemArray[1].ToString());
                    if (PickUpZone != DropOffZone)
                    {
                        SpecialZonesCount = SpecialZonesCount + 1;
                    }
                    if (Price > 0)
                    {
                        SpecialAreas = SpecialAreas + 1;
                    }
                }
            }

            if (PickUpCost == 0 && SpecialAreas == 0)
            {
                FinalCost = 0;
            }
            else if (PickUpCost > 0 && SpecialAreas == 0)
            {
                FinalCost = PickUpCost;
            }
            else if (PickUpCost == 0 && SpecialAreas > 0)
            {
                FinalCost = 50 * SpecialAreas;
            }
            if (SpecialZonesCount > 0)
            {
                lblTServiceFee.Text = (400 * SpecialZonesCount).ToString();
                lblService_Fee.Text = (400 * SpecialZonesCount).ToString();
            }

            lblTAdditionalTransportFee.Text = FinalCost.ToString();
            lblAdTransport_Fee.Text = FinalCost.ToString();
            SumAll();

        }
        else
        {
            int FinalCost = 0;
            int PickUpAreaID = Convert.ToInt32(ddlarea.SelectedValue.ToString());
            int DropUpAreaID = Convert.ToInt32(ddldarea.SelectedValue.ToString());
            int PickUpCost = 0;
            int DropOffCost = 0;
            int PickUpZone = 0;
            int DropOffZone = 0;
            DataSet DsAdd = new DataSet();
            DsAdd = crmObj.Display_Data_BindForEditCrm("ADDITIONALCHARGES", PickUpAreaID);
            if (DsAdd.Tables.Count > 0)
            {
                if (DsAdd.Tables[0].Rows.Count > 0)
                {
                    PickUpCost = Convert.ToInt32(DsAdd.Tables[0].Rows[0].ItemArray[0].ToString());
                    PickUpZone = Convert.ToInt32(DsAdd.Tables[0].Rows[0].ItemArray[1].ToString());
                }
            }
            DsAdd = new DataSet();
            DsAdd = crmObj.Display_Data_BindForEditCrm("ADDITIONALCHARGES", DropUpAreaID);
            if (DsAdd.Tables.Count > 0)
            {
                if (DsAdd.Tables[0].Rows.Count > 0)
                {
                    DropOffCost = Convert.ToInt32(DsAdd.Tables[0].Rows[0].ItemArray[0].ToString());
                    DropOffZone = Convert.ToInt32(DsAdd.Tables[0].Rows[0].ItemArray[1].ToString());
                }
            }

            if (PickUpCost == 0 && DropOffCost == 0)
            {
                FinalCost = 0;
            }
            else if (PickUpCost > 50 && DropOffCost > 50)
            {
                FinalCost = PickUpCost;
            }
            else if (PickUpCost > 0 && DropOffCost == 0)
            {
                FinalCost = PickUpCost;
            }
            else if (DropOffCost > 0 && PickUpCost == 0)
            {
                FinalCost = DropOffCost;
            }

            if (PickUpZone != DropOffZone)
            {
                lblTServiceFee.Text = "400";
                lblService_Fee.Text = "400";
            }

            lblTAdditionalTransportFee.Text = FinalCost.ToString();
            lblAdTransport_Fee.Text = FinalCost.ToString();



            SumAll();

        }
    }
    protected void ddlDropOffTime_SelectedIndexChanged(object sender, EventArgs e)
    {
        SpecialRecalculation();
    }



    protected void btnApply_Click(object sender, EventArgs e)
    {
        if (txtCoupanCode.Text != "")
        {
            if (txtCoupanCode.Text == "RTDP100")
            {
                lblNetPayable.Text = (Convert.ToInt32(lblTotalApproximatedFee.Text) - 100).ToString();
                txtCoupanCode.ReadOnly = true;
                btnApply.Enabled = false;
            }
        }
    }
}