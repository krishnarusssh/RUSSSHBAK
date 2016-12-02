<%@ WebHandler Language="C#" Class="BookTask" %>

using System;
using System.Web;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.SessionState;

public class BookTask : IHttpHandler,IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        string error = "";
        con.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();

        int ClientID = 0;
        int ServiceCategoryID = 0;
        string TaskDescription = "";
        int ProductValue = 0;
        int ProductWeightCost = 0;
        string TaskDate1 = "";
        int PickTimeID = 0;
        string IsExpressflag ="N";
        string Task_Mode ="Single";

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
        int AccessBaggageFee = 0;
        double Total = 0;
        int Rid = 1;
        int Cid = 9664;
        int TaskID = 0 ;
        int pmode = 0;

        if (context.Request.QueryString["rid"] != "" && context.Request.QueryString["rid"] != null)
        {
            Rid = Convert.ToInt32(MyExtenstionMethods.DecryptString(context.Request.QueryString["rid"].ToString()));
        }
        if (context.Request.QueryString["cid"] != "" && context.Request.QueryString["cid"] != null)
        {
            Cid = Convert.ToInt32(MyExtenstionMethods.DecryptString(context.Request.QueryString["cid"].ToString()));
        }
        if (context.Request.QueryString["weight"] != "" && context.Request.QueryString["weight"] != null)
        {
            AccessBaggageFee = Convert.ToInt32(context.Request.QueryString["weight"].ToString());
        }
        if (context.Request.QueryString["paymode"] != "" && context.Request.QueryString["paymode"] != null)
        {
            PaymentMode = Convert.ToInt32(context.Request.QueryString["paymode"].ToString());
        }
        if (PaymentMode > 2)
        {
            pmode = 3;
        }
        
        try
        {
            DataSet ds1 = new DataSet();
            con.Open();
            cmd = new SqlCommand("GetBooktaskData", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@rid", SqlDbType.Int).Value = Rid;
            cmd.Parameters.Add("cid", SqlDbType.Int).Value = Cid;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds1);
            if (ds1.Tables.Count > 0)
            {
                if (ds1.Tables[0].Rows.Count > 0)
                {
                     ServiceCategoryID = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[0].ToString());
                     TaskDescription = ds1.Tables[0].Rows[0].ItemArray[1].ToString();
                     ProductValue = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[2].ToString());
                     ProductWeightCost = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[3].ToString());
                     TaskDate1 = ds1.Tables[0].Rows[0].ItemArray[4].ToString();
                     PickTimeID = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[5].ToString());
                     IsExpressflag = ds1.Tables[0].Rows[0].ItemArray[6].ToString();
                     Task_Mode = ds1.Tables[0].Rows[0].ItemArray[7].ToString();

                     ReturnServiceCategory = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[8].ToString());
                     ReturnDescription = ds1.Tables[0].Rows[0].ItemArray[9].ToString();
                     ReturnProductValue = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[10].ToString());
                     ReturnProductWeightCost = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[11].ToString());
                     DropTime = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[12].ToString());

                     PickupFirstName = ds1.Tables[0].Rows[0].ItemArray[13].ToString();
                     PickupLastName = ds1.Tables[0].Rows[0].ItemArray[14].ToString();
                     PickupMobileNo = ds1.Tables[0].Rows[0].ItemArray[15].ToString();
                     PickupAddress = ds1.Tables[0].Rows[0].ItemArray[16].ToString();
                     PickupLandmark = ds1.Tables[0].Rows[0].ItemArray[17].ToString();
                     PickupAreaID = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[18].ToString());
                     PickupCityID = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[19].ToString());

                     DropupFirstName = ds1.Tables[0].Rows[0].ItemArray[20].ToString();
                     DropupLastName = ds1.Tables[0].Rows[0].ItemArray[21].ToString();
                     DropupMobileNo = ds1.Tables[0].Rows[0].ItemArray[22].ToString();
                     DropupAddress = ds1.Tables[0].Rows[0].ItemArray[23].ToString();
                     DropupLandmark = ds1.Tables[0].Rows[0].ItemArray[24].ToString();
                     DropupAreaID = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[25].ToString());
                     DropupCityID = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[26].ToString());

                     ApplyInsuranceflag = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[27].ToString());
                     PromoCode = ds1.Tables[0].Rows[0].ItemArray[28].ToString();
                     //PaymentMode = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[29].ToString());


                     ServiceCharge = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[30].ToString());
                     InsuranceFee = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[31].ToString());
                     AdditionalTransportFee = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[32].ToString());
                    // AccessBaggageFee = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[33].ToString());
                     Total = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[34].ToString());

                     if (Cid != 0)
                     {

                         cmd = new SqlCommand("BookATaskFrom_Web", con);
                         cmd.CommandType = CommandType.StoredProcedure;
                         cmd.Parameters.Add("@ClientID", SqlDbType.Int).Value = Cid;
                         cmd.Parameters.Add("@ServiceCategoryID", SqlDbType.Int).Value = ServiceCategoryID;
                         cmd.Parameters.Add("@TaskDescription", SqlDbType.NVarChar).Value = TaskDescription;
                         cmd.Parameters.Add("@ProductValue", SqlDbType.Int).Value = ProductValue;
                         cmd.Parameters.Add("@ProductWeightCost", SqlDbType.Int).Value = ProductWeightCost;
                         cmd.Parameters.Add("@TaskDate1", SqlDbType.Char, 10).Value = TaskDate1;
                         cmd.Parameters.Add("@PickTimeID", SqlDbType.Int).Value = PickTimeID;
                         cmd.Parameters.Add("@IsExpress", SqlDbType.VarChar, 50).Value = IsExpressflag;
                         cmd.Parameters.Add("@Task_Mode", SqlDbType.VarChar, 50).Value = Task_Mode;
                         
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
                         cmd.Parameters.Add("@PaymentMode", SqlDbType.Int).Value = pmode;

                         cmd.Parameters.Add("@ServiceCharge", SqlDbType.Int).Value = ServiceCharge;
                         cmd.Parameters.Add("@InsuranceFee", SqlDbType.Int).Value = InsuranceFee;
                         cmd.Parameters.Add("@AdditionalTransportFee", SqlDbType.Int).Value = 0;
                         cmd.Parameters.Add("@AccessBaggageFee", SqlDbType.Int).Value = AccessBaggageFee;

                         cmd.Parameters.Add("@Total", SqlDbType.Int).Value = Total;
                         da = new SqlDataAdapter(cmd);
                         ds1 = new DataSet();
                         da.Fill(ds1);
                         if (ds1.Tables.Count > 0)
                         {
                             if (ds1.Tables[0].Rows.Count > 0)
                             {
                                 TaskID = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[1].ToString());
	 
	                         SqlCommand cmd2 = new SqlCommand();
                             cmd2.Connection = con;
                             cmd2.CommandText = "update booktaskrequest set Booktaskid=" + TaskID + " where requestid=" + Rid.ToString();
                             cmd2.ExecuteNonQuery();
                             cmd2.Dispose();
                             }
                         }
                         try
                         {
                             SqlCommand cmd1 = new SqlCommand();
                             cmd1.Connection = con;
                             cmd1.CommandText = "update BookTask set EmpID=" +  System.Web.HttpContext.Current.Session["EMID"].ToString() + " where BookTaskID=" + TaskID.ToString();
                             cmd1.ExecuteNonQuery();
                             cmd1.Dispose();
	   
                         }
                         catch (Exception e1)
                         {

                         }

                         con.Close();
                     }
                     else
                     {
                         //Response.Write("<script>alert('something went wrong please refresh the page and try again.');</script>");
                     }

                }
            }
            //context.Session["NEWBOOKINGID"] = TaskID;
            //System.Web.HttpContext.Current.Session["NEWBOOKINGID"] = TaskID;
            if (System.Web.HttpContext.Current.Session != null)
            {
                System.Web.HttpContext.Current.Session["NEWBOOKINGID"] = TaskID;
            }
            else
            {
                System.Web.HttpContext.Current.Session["NEWBOOKINGID"] = TaskID;
            }
            if (PaymentMode < 3)
            {
				string contactNo = System.Web.HttpContext.Current.Session["CLIENT_CONTACT"].ToString();
                    string Name = System.Web.HttpContext.Current.Session["CLIENT_NAME"].ToString();
                    if (Name != "" && contactNo != "")
                    {
                        System.Net.WebClient client = new System.Net.WebClient();
                        client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");

                        string MessagePart = context.Server.UrlEncode("Dear " + Name + ", Thank you for booking your task with Russsh.com You will receive your confirmation within the next 20 minutes.");
                        System.IO.Stream data = client.OpenRead("http://enterprise.smsgupshup.com/GatewayAPI/rest?method=SendMessage&send_to=" + contactNo + "&msg=" + MessagePart + "&msg_type=TEXT&userid=2000148575&auth_scheme=plain&password=getmypeon&v=1.1&format=text");
                        System.IO.StreamReader reader = new System.IO.StreamReader(data);
                        string s = reader.ReadToEnd();
                        Console.WriteLine(s);
                        data.Close();
                        reader.Close();

                    }
                context.Response.Write(TaskID);
            }
            else
            {
                if (PaymentMode == 3) // Mobi
                {
                    
                    System.Web.HttpContext.Current.Session["MOBI_CLIENTID"] = System.Web.HttpContext.Current.Session["CLIENT_ID"];
                    System.Web.HttpContext.Current.Session["MOBI_EMAIL"] = System.Web.HttpContext.Current.Session["CLIENT_EMAIL"];
                    System.Web.HttpContext.Current.Session["MOBI_NAME"] = System.Web.HttpContext.Current.Session["CLIENT_NAME"]; ;
                    System.Web.HttpContext.Current.Session["MOBI_AMOUNT"] = Total;
                    System.Web.HttpContext.Current.Session["MOBI_PHONE"] = System.Web.HttpContext.Current.Session["CLIENT_CONTACT"];
                    System.Web.HttpContext.Current.Session["MOBI_MARTRANSACTIONID"] = TaskID;
                    //context.Response.Redirect("../mobiqwik");
                    context.Response.Write(TaskID);
                }
                if (PaymentMode == 4) // Paytm
                {
                    System.Web.HttpContext.Current.Session["PTM_CLIENTID"] = System.Web.HttpContext.Current.Session["CLIENT_ID"];
                    System.Web.HttpContext.Current.Session["PTM_EMAIL"] = System.Web.HttpContext.Current.Session["CLIENT_EMAIL"];
                    System.Web.HttpContext.Current.Session["PTM_NAME"] = System.Web.HttpContext.Current.Session["CLIENT_NAME"];
                    System.Web.HttpContext.Current.Session["PTM_AMOUNT"] = Total;
                    System.Web.HttpContext.Current.Session["PTM_PHONE"] = System.Web.HttpContext.Current.Session["CLIENT_CONTACT"];
                    System.Web.HttpContext.Current.Session["PTM_MARTRANSACTIONID"] = TaskID; 
                    context.Response.Write(TaskID);
                }
                if (PaymentMode == 5) // payu
                {
                    System.Web.HttpContext.Current.Session["PU_NAME"] = System.Web.HttpContext.Current.Session["CLIENT_NAME"]; ;
                    System.Web.HttpContext.Current.Session["PU_AMOUNT"] = Total;
                    System.Web.HttpContext.Current.Session["PU_PHONE"] = System.Web.HttpContext.Current.Session["CLIENT_CONTACT"];
                    System.Web.HttpContext.Current.Session["PU_MARTRANSACTIONID"] = TaskID; 
                    context.Response.Write(TaskID);
                    
                }
                if (PaymentMode == 6)
                {

                    System.Web.HttpContext.Current.Session["CIT_CLIENTID"] = System.Web.HttpContext.Current.Session["CLIENT_ID"];
                    System.Web.HttpContext.Current.Session["CIT_EMAIL"] = System.Web.HttpContext.Current.Session["CLIENT_EMAIL"];
                    System.Web.HttpContext.Current.Session["CIT_NAME"] = System.Web.HttpContext.Current.Session["CLIENT_NAME"]; ;
                    System.Web.HttpContext.Current.Session["CIT_AMOUNT"] = Total;
                    System.Web.HttpContext.Current.Session["CIT_PHONE"] = System.Web.HttpContext.Current.Session["CLIENT_CONTACT"];
                    System.Web.HttpContext.Current.Session["CIT_MARTRANSACTIONID"] = TaskID;
                    ////context.Response.Redirect("../mobiqwik");
                    context.Response.Write(TaskID);
                }
				if (PaymentMode == 7)
                {

                    System.Web.HttpContext.Current.Session["CIT_CLIENTID"] = System.Web.HttpContext.Current.Session["CLIENT_ID"];
                    System.Web.HttpContext.Current.Session["CIT_EMAIL"] = System.Web.HttpContext.Current.Session["CLIENT_EMAIL"];
                    System.Web.HttpContext.Current.Session["CIT_NAME"] = System.Web.HttpContext.Current.Session["CLIENT_NAME"]; ;
                    System.Web.HttpContext.Current.Session["CIT_AMOUNT"] = Total;
                    System.Web.HttpContext.Current.Session["CIT_PHONE"] = System.Web.HttpContext.Current.Session["CLIENT_CONTACT"];
                    System.Web.HttpContext.Current.Session["CIT_MARTRANSACTIONID"] = TaskID;
                    ////context.Response.Redirect("../mobiqwik");
                    context.Response.Write(TaskID);
                }
            }
           
        }
        catch (Exception)
        {

        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}