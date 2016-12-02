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


public partial class BookTaskNew_Default : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    SqlDataReader dr;
    DataSet ds;
    CrmClass crmObj = new CrmClass();
    int TaskID = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

         if (Session["CLIENT_NAME"] == null || Session["CLIENT_NAME"] == "")
                {
                    Response.Redirect("../");
                }

        if (!Page.IsPostBack)
        {
            if (Session != null)
            {
                if (Session["CLIENT_NAME"] == null || Session["CLIENT_NAME"] == "")
                {
                    Response.Redirect("../");
                }

            }
            
            string clientid = "0";

            try
            {
                if (Session["CLIENT_ID"] != "" && Session["CLIENT_ID"] != null  && Session["CLIENT_ID"] != "0")
                {
                    clientid = Session["CLIENT_ID"].ToString();
                    hndcid.Value = clientid;
                    txtcid.Text = clientid;
                    int Outstandingamount = crmObj.GetClientOutstanding(Convert.ToInt32(clientid));
                    if (Outstandingamount>0)
                    {
                        diverror.InnerText = "Your Pending amount is Rs " + Outstandingamount.ToString() + " Will be added in Service fee/ Cash Handling charges";
                        txtoutstanding.Text = Outstandingamount.ToString();
                    }
                }
                else
                {
                    Response.Redirect("../Signin/");
                }

                DataSet DsClientInfo = new DataSet();
                DsClientInfo = crmObj.Display_Data_BindForEditCrm("CLIENTDATA", Convert.ToInt32(Session["CLIENT_ID"]));

                int HasData = 0;
                if (DsClientInfo.Tables.Count > 0)
                {
                    if (DsClientInfo.Tables[0].Rows.Count > 0)
                    {
                        try
                        {
                            walletbalance.InnerHtml = DsClientInfo.Tables[0].Rows[0].ItemArray[3].ToString();
                             txtwall.Text = DsClientInfo.Tables[0].Rows[0].ItemArray[3].ToString();
                        }
                        catch (Exception e344)
                        {
                            walletbalance.InnerHtml = "0";
                        }

                        DataSet DsAdd = new DataSet();
                        DsAdd = crmObj.GetAdditionalAddress(Convert.ToInt32(Session["CLIENT_ID"].ToString()));
                        if (DsAdd.Tables.Count > 0)
                        {
                            if (DsAdd.Tables[0].Rows.Count > 0)
                            {
                                string straddress = "<div class='col-md-12'><span class='pull-right'  onclick='hideaddress()'><i class='fa fa-times'></i></span></div>";
                                int i = 0;
                                for (i = 0; i <= DsAdd.Tables[0].Rows.Count - 1; i++)
                                {
                                    string Name = DsAdd.Tables[0].Rows[i].ItemArray[1].ToString();
                                    string Mobie = DsAdd.Tables[0].Rows[i].ItemArray[7].ToString();
                                    string AddressLine = DsAdd.Tables[0].Rows[i].ItemArray[2].ToString();
                                    string Area = DsAdd.Tables[0].Rows[i].ItemArray[10].ToString();
                                    string Pincode = DsAdd.Tables[0].Rows[i].ItemArray[6].ToString();
                                    string Landmark = DsAdd.Tables[0].Rows[i].ItemArray[5].ToString();
                                    string passstring = Name.Replace(" ", "~").Sanatize() + "@" + Mobie + "@" + AddressLine.Replace(" ", "~").Sanatize() + "@" + Area + "@" + Pincode + "@" + Landmark.Replace(" ", "~").Sanatize();
                                    straddress = straddress + "<div class='row' style='padding-right:10px;'>";
                                    straddress = straddress + "<div class='col-md-7 col-md-offset-1 mt20 address' style='border-top:1px solid #ccc;padding-top:10px;' >";
                                    straddress = straddress + "<h3>" + DsAdd.Tables[0].Rows[i].ItemArray[1].ToString() + " | Mob No : +91 " + DsAdd.Tables[0].Rows[i].ItemArray[7].ToString() + "</h3>";
                                    straddress = straddress + "<h3>" + DsAdd.Tables[0].Rows[i].ItemArray[2].ToString() + " " + DsAdd.Tables[0].Rows[i].ItemArray[3].ToString() + "</h3>";
                                    straddress = straddress + "<h3>" + DsAdd.Tables[0].Rows[i].ItemArray[4].ToString() + " - " + DsAdd.Tables[0].Rows[i].ItemArray[6].ToString() + ".</h3>";
                                    straddress = straddress + "<div class='col-md-12'>";
 straddress = straddress + "<button type='button' class='btn-gray mt10' onclick=BackToAddressPlace('" + Server.HtmlEncode(passstring) + "')>Use This Address</button>";
                                    straddress = straddress + "</div>";
                                    straddress = straddress + "</div>";
                                    straddress = straddress + "<div class='col-md-4 mt20' >";
                                    //straddress = straddress + "<span><i class='fa fa-trash-o'></i> Remove</span>";
                                    //straddress = straddress + "<span><i class='fa fa-pencil'></i> Edit</span>";
                                    straddress = straddress + "</div>";

                                    straddress = straddress + "</div>";
                                }
                                addressplace.InnerHtml = straddress;
                            }
                        }
                    }
                }

            }
            catch (Exception e1)
            {
            }
        }
        //END
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
           if (Session["CLIENT_NAME"] == null || Session["CLIENT_NAME"] == "")
                {
		  Response.Write("<script>alert('Sorry! Your session has been expired. Pls Login again.');</script>");                
		  Response.Redirect("../");
                }


       SqlConnection con = new SqlConnection();
        string ClientXMl1 = "";
        int OnlinePayment = 0;
        try
        {

            DataSet ds1 = new DataSet();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
            con.Open();
            int ClientID = 0;
            int ServiceCategoryID = 0;
            string TaskDescription = "";
            int ProductValue = 0;
            int ProductWeightCost = 0;
            string TaskDate1 = "";
            int PickTimeID = 0;
            int IsExpressflag = 0;
            int Task_Modeflag = 0;

            int ReturnServiceCategory = 0;
            string ReturnDescription = "";
            int ReturnProductValue = 0;
            int ReturnProductWeightCost = 0;
            int DropTime = 0;

            string PickupFirstName = "";
            string PickupLastName = "";
            string PickupMobileNo = "";
            string PickupAddress = "";
            string PickupLandmark = "";
            int PickupAreaID = 0;
            int PickupCityID = 0;

            string DropupFirstName = "";
            string DropupLastName = "";
            string DropupMobileNo = "";
            string DropupAddress = "";
            string DropupLandmark = "";
            int DropupAreaID = 0;
            int DropupCityID = 0;

            int ApplyInsuranceflag = 0;
            string PromoCode = "";
            int PaymentMode = 0;

            double ServiceCharge = 0;
            double InsuranceFee = 0;
            int AdditionalTransportFee = 0;
            double AccessBaggageFee = 0;
            double Total = 0;

            //// Assign Values  
            try
            {
               
                ClientID =Convert.ToInt32(txtcid.Text.ToString());
                ServiceCategoryID = Convert.ToInt32(Request.Form["Service_Category"].ToString());
                TaskDescription = Request.Form["description"].ToString();
                //ProductValue = Convert.ToInt32(Request.Form["productvalue"].ToString());
				if (ServiceCategoryID == 20)
                {
                    ProductValue = 4500;
                }
                else
                {
                    ProductValue = Convert.ToInt32(Request.Form["productvalue"].ToString());
                }  
                ProductWeightCost = Convert.ToInt32(Request.Form["weight1"].ToString());
                TaskDate1 = Request.Form["taskdate"].ToString();
                PickTimeID = Convert.ToInt32(Request.Form["pickuptime"].ToString());
                IsExpressflag = Convert.ToInt32(Request.Form["expressflag"].ToString());
                Task_Modeflag = Convert.ToInt32(Request.Form["returnflag"].ToString());

                ReturnServiceCategory = Convert.ToInt32(Request.Form["ReturnServiceCategory"].ToString());
                ReturnDescription = Request.Form["returndescription"];
                 if (ReturnServiceCategory == 20)
                {
                    ReturnProductValue = 4500;
                }
                else
                {
                    ReturnProductValue = Convert.ToInt32(Request.Form["returnproductvalue"].ToString());
                }  
                ReturnProductWeightCost = Convert.ToInt32(Request.Form["weight2"].ToString());
                DropTime = Convert.ToInt32(Request.Form["dropuptime"].ToString());

                PickupFirstName = Request.Form["pfirstname"].ToString();
                PickupLastName = Request.Form["plastname"].ToString();
                PickupMobileNo = Request.Form["pmobileno"].ToString();
                PickupAddress = Request.Form["paddress"].ToString();
                PickupLandmark = Request.Form["plandmark"].ToString();
                PickupAreaID = Convert.ToInt32(Request.Form["pickuparea"].ToString());
                PickupCityID = Convert.ToInt32(Request.Form["pcity"].ToString());

                DropupFirstName = Request.Form["dfirstname"].ToString();
                DropupLastName = Request.Form["dlastname"].ToString();
                DropupMobileNo = Request.Form["dmobileno"].ToString();
                DropupAddress = Request.Form["daddress"].ToString();
                DropupLandmark = Request.Form["dlandmark"].ToString();
                DropupAreaID = Convert.ToInt32(Request.Form["dropuparea"].ToString());
                DropupCityID = Convert.ToInt32(Request.Form["dcity"].ToString());

                ApplyInsuranceflag = Convert.ToInt32(Request.Form["insuranceflag"].ToString());
                PromoCode = Request.Form["promocode"].ToString();
                PaymentMode = 0;

                 try
                {
                    ServiceCharge = Convert.ToDouble(Request.Form["txttaskfee"].ToString());
                }
                catch
                {
                    ServiceCharge = 0;
                }
                InsuranceFee = Convert.ToDouble(Request.Form["txtinsid"].ToString());
                AdditionalTransportFee = 0;
                AccessBaggageFee = Convert.ToDouble(Request.Form["txtbag"].ToString()); 
                Total = Convert.ToDouble(Request.Form["txtttl"].ToString()); 
				if (ClientID != 0)
                {														  

                cmd = new SqlCommand("BookATaskFrom_Web", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ClientID", SqlDbType.Int).Value = ClientID;
                cmd.Parameters.Add("@ServiceCategoryID", SqlDbType.Int).Value = ServiceCategoryID;
                cmd.Parameters.Add("@TaskDescription", SqlDbType.NVarChar).Value = TaskDescription;
                cmd.Parameters.Add("@ProductValue", SqlDbType.Int).Value = ProductValue;
                cmd.Parameters.Add("@ProductWeightCost", SqlDbType.Int).Value = ProductWeightCost;
                cmd.Parameters.Add("@TaskDate1", SqlDbType.Char, 10).Value = TaskDate1;
                cmd.Parameters.Add("@PickTimeID", SqlDbType.Int).Value = PickTimeID;
                if (IsExpressflag == 0)
                {
                    cmd.Parameters.Add("@IsExpress", SqlDbType.VarChar, 50).Value = "N";
                }
                if (IsExpressflag == 1)
                {
                    cmd.Parameters.Add("@IsExpress", SqlDbType.VarChar, 50).Value = "Y";
                }
                if (Task_Modeflag == 0)
                {
                    cmd.Parameters.Add("@Task_Mode", SqlDbType.VarChar, 50).Value = "SINGLE";
                }
                if (Task_Modeflag == 1)
                {
                    cmd.Parameters.Add("@Task_Mode", SqlDbType.VarChar, 50).Value = "RETURN";
                }


                cmd.Parameters.Add("@ReturnServiceCategory", SqlDbType.Int).Value = ReturnServiceCategory;
                cmd.Parameters.Add("@ReturnDescription", SqlDbType.NVarChar).Value = ReturnDescription;
                cmd.Parameters.Add("@ReturnProductValue", SqlDbType.Int).Value = ReturnProductValue;
                cmd.Parameters.Add("@ReturnProductWeightCost", SqlDbType.Int).Value = ReturnProductWeightCost;
                cmd.Parameters.Add("@DropTime", SqlDbType.Int).Value = DropTime;

                cmd.Parameters.Add("@PickupFirstName", SqlDbType.VarChar, 100).Value = PickupFirstName;
                cmd.Parameters.Add("@PickupLastName", SqlDbType.VarChar, 100).Value = PickupLastName;
                cmd.Parameters.Add("@PickupMobileNo", SqlDbType.VarChar, 50).Value = PickupMobileNo;
                cmd.Parameters.Add("@PickupAddress", SqlDbType.NVarChar).Value = PickupAddress;
                cmd.Parameters.Add("@PickupLandmark", SqlDbType.VarChar, 500).Value = PickupLandmark;
                cmd.Parameters.Add("@PickupAreaID", SqlDbType.Int).Value = PickupAreaID;
                cmd.Parameters.Add("@PickupCityID ", SqlDbType.Int).Value = PickupCityID;

                cmd.Parameters.Add("@DropupFirstName", SqlDbType.VarChar, 100).Value = DropupFirstName;
                cmd.Parameters.Add("@DropupLastName", SqlDbType.VarChar, 100).Value = DropupLastName;
                cmd.Parameters.Add("@DropupMobileNo", SqlDbType.VarChar, 10).Value = DropupMobileNo;
                cmd.Parameters.Add("@DropupAddress", SqlDbType.NVarChar).Value = DropupAddress;
                cmd.Parameters.Add("@DropupLandmark", SqlDbType.VarChar, 500).Value = DropupLandmark;
                cmd.Parameters.Add("@DropupAreaID", SqlDbType.Int).Value = DropupAreaID;
                cmd.Parameters.Add("@DropupCityID", SqlDbType.Int).Value = DropupCityID;


                //if (Convert.ToInt32(Request.Form["insuranceflag"].ToString()) == 0)
                //{
                //    cmd.Parameters.Add("@ApplyInsurance", SqlDbType.VarChar, 50).Value = "N";
                //}
                //if (Convert.ToInt32(Request.Form["insuranceflag"].ToString()) == 1)
                //{
                //    cmd.Parameters.Add("@ApplyInsurance", SqlDbType.VarChar, 50).Value = "Y";
                //}
                cmd.Parameters.Add("@ApplyInsurance", SqlDbType.VarChar, 50).Value = "N";

                cmd.Parameters.Add("@PromoCode", SqlDbType.VarChar, 50).Value = PromoCode;

                if (chkPickUp.Checked)
                {
                    cmd.Parameters.Add("@PaymentMode", SqlDbType.Int).Value = 1;
                }

                if (chkDrop.Checked)
                {
                    cmd.Parameters.Add("@PaymentMode", SqlDbType.Int).Value = 0;
                }

                if (chkDebit.Checked)
                {
                    cmd.Parameters.Add("@PaymentMode", SqlDbType.Int).Value = 3;
                    OnlinePayment = 1;
                }

                if (chkCredit.Checked)
                {
                    cmd.Parameters.Add("@PaymentMode", SqlDbType.Int).Value = 3;
                    OnlinePayment = 1;
                }

                if (chkwall.Checked)
                {
                    cmd.Parameters.Add("@PaymentMode", SqlDbType.Int).Value = 2;
                    OnlinePayment = 1;
                }


                cmd.Parameters.Add("@ServiceCharge", SqlDbType.Int).Value = ServiceCharge;
                cmd.Parameters.Add("@InsuranceFee", SqlDbType.Int).Value = InsuranceFee;
                cmd.Parameters.Add("@AdditionalTransportFee", SqlDbType.Int).Value = 0;
                cmd.Parameters.Add("@AccessBaggageFee", SqlDbType.Int).Value = AccessBaggageFee;

                cmd.Parameters.Add("@Total", SqlDbType.Int).Value = Total;
                da = new SqlDataAdapter(cmd);
                da.Fill(ds1);
                if (ds1.Tables.Count > 0)
                {
                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                        TaskID = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[1].ToString());
                    }
                }
    		try
		{
		SqlCommand cmd1 = new SqlCommand();
                cmd1.Connection = con;
                cmd1.CommandText = "update BookTask set EmpID=" + Session["EMID"].ToString()+" where BookTaskID="+TaskID.ToString();
                cmd1.ExecuteNonQuery();
                cmd1.Dispose();
		}
		catch(Exception e1)
		{

		}
		
            con.Close();
                }
                else
                {
                    Response.Write("<script>alert('something went wrong please refresh the page and try again.');</script>");
                }
                    
            }
            catch (Exception eee)
            {
               //diverror.InnerText =eee.ToString();
Response.Write("<script>alert('something went wrong please try again');</script>");
               //Response.Write("<script>alert('" + eee.ToString() +"');</script>");
              
            }

            //  ClientXMl = ds.GetXml();
        }
        catch (Exception eee)
        {

        }
        finally
        {
           
        }

        if (TaskID != 0)
        {



            string str = "";
            str = str + "Name:" + Session["CLIENT_NAME"].ToString() + "<br>";
            str = str + "Contact:" + Session["CLIENT_CONTACT"].ToString() + "<br>";
            str = str + "TaskDetail:" + Request.Form["description"] + "<br>";
            str = str + "Task Date:" + Request.Form["taskdate"] + "<br>";
            str = str + "Task Date:" + Request.Form["taskdate"] + "<br>";
            if (Convert.ToInt32(Request.Form["returnflag"]) == 0)
            {
                str = str + "TaskType:" + "SINGLE" + "<br>"; ;
            }
            if (Convert.ToInt32(Request.Form["returnflag"]) == 1)
            {
                str = str + "TaskType:" + "RETURN" + "<br>"; ;
            }


            if (chkPickUp.Checked)
            {
                str = str + "Payment Collect:" + "At PickUp" + "<br>";
            }

            if (chkDrop.Checked)
            {
                str = str + "Payment Collect:" + "At DropOff" + "<br>";
            }

            if (chkDebit.Checked)
            {
                str = str + "Payment Collect:" + "Debit Card" + "<br>";
            }

            if (chkCredit.Checked)
            {
                str = str + "Payment Collect:" + "Credit Card " + "<br>";
            }

            if (chkwall.Checked)
            {
                str = str + "Payment Collect:" + "From Wallet" + "<br>";
            }

            str = str + "Pickup Name:" + Request.Form["pfirstname"] + "<br>";
            str = str + "Pickup Address:" + Request.Form["paddress"] + "<br>";
            str = str + "Pickup Landmark:" + Request.Form["plandmark"] + "<br>";

            str = str + "Drop-off Name:" + Request.Form["dfirstname"] + "<br>";
            str = str + "Drop-off Address:" + Request.Form["daddress"] + "<br>";
            str = str + "Drop-off Landmark:" + Request.Form["dlandmark"] + "<br>";

            string sflag = "";
            con.Open();
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
                if (OnlinePayment == 0)
                {
                    WebClient client = new WebClient();
                    client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                    string DestinationMobile = Session["CLIENT_CONTACT"].ToString();
                    string MessagePart = Server.UrlEncode("Dear " + Session["CLIENT_NAME"].ToString() + ", Thank you for booking your task with Russsh.com You will receive your time confirmation within the next 20 minutes.");
                    Stream data = client.OpenRead("http://enterprise.smsgupshup.com/GatewayAPI/rest?method=SendMessage&send_to=" + DestinationMobile + "&msg=" + MessagePart + "&msg_type=TEXT&userid=2000148575&auth_scheme=plain&password=getmypeon&v=1.1&format=text");
                    StreamReader reader = new StreamReader(data);
                    string s = reader.ReadToEnd();
                    Console.WriteLine(s);
                    data.Close();
                    reader.Close();
                }
            }
             try
		{
            		Session["CEMAIL"] = Session["CLIENT_EMAIL"];
            		Session["CNAMEW"] = Session["CLIENT_NAME"];
		}
		catch(Exception eee9)
		{
			Response.Redirect("../Signout");
		}
            


            int PM = 0;
            if (chkPickUp.Checked == true)
            {
                Session["PAYMENTMETHOD"] = "0";
            }
            else if (chkDrop.Checked == true)
            {
                Session["PAYMENTMETHOD"] = "1";
            }
            else if (chkwall.Checked == true)
            {
                Session["PAYMENTMETHOD"] = "2";
            }

            else if (chkCredit.Checked == true)
            {
                Session["PAYMENTMETHOD"] = "3";
                PM = 3;
                PrepareClientData();
                Session["AMOUNTPAYABLE"] = ((int) Convert.ToDouble(subtotalFeeval.Value.ToString())).ToString();
                Session["NEWBOOKINGID"] = TaskID;


            }  //chkDebit
            else if (chkDebit.Checked == true)
            {
                Session["PAYMENTMETHOD"] = "3";
                PM = 3;
                PrepareClientData();
                Session["AMOUNTPAYABLE"] = ((int) Convert.ToDouble(subtotalFeeval.Value.ToString())).ToString();
                Session["NEWBOOKINGID"] = TaskID;


            }

            // Reset();
            if (PM == 3)
            {
                Session["NEWBOOKINGID"] = TaskID;
                Response.Redirect("../Task_Payment");
            }
            else
            {
                Session["NEWBOOKINGID"] = TaskID;
                Response.Redirect("../Confirmation");
            }
        }

    }


    public void PrepareClientData()
    {
        try
        {
            DataSet ClientData = new DataSet();
            ClientData = crmObj.Display_Data_BindForEditCrm("CLIENTDATA", Convert.ToInt32(Session["CLIENT_ID"].ToString()));
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
        catch (Exception e)
        {

        }
    }

}