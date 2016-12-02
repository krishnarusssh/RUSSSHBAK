using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using System.Text;
using System.Net;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
public partial class RussshPay_T_Default : System.Web.UI.Page
{

    CrmClass crmObj = new CrmClass();
    string[] spiltstr;
    public string clientid { get; set; }
    string strwalletproc = "";
    string SetTableReturn = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        string ClientID;
        ClientID = "0";
        if (!Page.IsPostBack)
        {
            if (Session != null)
            {
                if (Session["CLIENT_NAME"] == null || Session["CLIENT_NAME"] == "")
                {
                    Response.Redirect("../");
                }
            }

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

            string pltfrm = "";
            try
            {
                pltfrm = Session["PlatForm"].ToString();
            }
            catch (Exception e3)
            {
                pltfrm = "";
            }

 string APPID = "NONE";
 string PLT_FORM="M";
                SqlDataReader dr;
                SqlConnection con = new SqlConnection();
                con.ConnectionString = "data source=45.114.141.99\\SQLEXPRESS,1433;initial catalog=GetMyPeons;persist security info=True;user id=sa;password=CY%Mdf5sG4c$;MultipleActiveResultSets=True;";
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
             cmd.CommandText = "select S.AppID,S.Platform from Account_Master A,SOCIALTABLE S  where S.AccountID=A.AccountID and  A.ClientID=" + Session["CLIENT_ID"];
                dr = cmd.ExecuteReader();
                dr.Read();
                try
                {
                    APPID = dr.GetValue(0).ToString();
		 PLT_FORM=dr.GetValue(1).ToString();
                }
                catch (Exception ee)
                {

                }
                dr.Close();
                con.Close();





  ProfileName1.InnerHtml = Session["CLIENT_NAME"].ToString();


            if (PLT_FORM == "M")
            {
              

            }
            else
            {
               

      if (PLT_FORM == "F")
                {

                    profileimg.InnerHtml = "<img src="+"'https://graph.facebook.com/"+APPID+"/picture'"+" style='border-radius:50%; border: 3px solid #CCC;' draggable='false' /> ";
                }
                if (PLT_FORM == "G")
                {
                    System.Net.WebRequest request = System.Net.WebRequest.Create("http://picasaweb.google.com/data/entry/api/user/"+APPID+"?alt=json");
                    System.Net.WebResponse response = request.GetResponse();
                    System.IO.Stream dataStream = response.GetResponseStream();
                    System.IO.StreamReader reader = new System.IO.StreamReader(dataStream);
                    string responseFromServer = reader.ReadToEnd();
responseFromServer =responseFromServer .Replace("$","_");
                   dynamic stuff = JsonConvert.DeserializeObject(responseFromServer);

			//Response.Write(stuff.entry.gphoto_thumbnail._t);
                  
                    profileimg.InnerHtml = "<img src='"+stuff.entry.gphoto_thumbnail._t+"' style='border-radius:50%; border: 3px solid #CCC;' draggable='false'  /> ";


                }


                ProfileName1.InnerHtml = Session["CLIENT_NAME"].ToString();
            }

            try
            {
               // string asp = Request.Form["FliterByDates"].ToString();       
                 string Dates = FliterByDates.Value;
            }
            catch (Exception E)
            { 
            
            }
            DataSet Ds = new DataSet();
            Ds = crmObj.GetClientTaskCount(Convert.ToInt32(Session["CLIENT_ID"].ToString()));
            if (Ds.Tables.Count > 0)
            {
                if (Ds.Tables[0].Rows.Count > 0)
                {
                    lblnooftask.Text = Ds.Tables[0].Rows[0].ItemArray[0].ToString();
                    lblcomp.Text = Ds.Tables[0].Rows[0].ItemArray[1].ToString();
                    lblcan.Text = Ds.Tables[0].Rows[0].ItemArray[2].ToString();
                }
            }
            string clientid = Session["CLIENT_ID"].ToString();
            strwalletproc = @"<table class='table __transaction__table'>";
            strwalletproc = strwalletproc + "<thead>";
            strwalletproc = strwalletproc + "<th>Date</th>";
            strwalletproc = strwalletproc + "<th>Transaction details</th>";
            strwalletproc = strwalletproc + " <th class='text-right' align='right'>Amount</th>";
            strwalletproc = strwalletproc + "</tr>";
            strwalletproc = strwalletproc + "</thead>";
            if (clientid != "0")
            {

                SetTableReturn = SetWalletTableData(Convert.ToInt32(ClientID));
            }
            strwalletproc = strwalletproc + SetTableReturn;
            strwalletproc = strwalletproc + "</tbody>";
            strwalletproc = strwalletproc + "</table>";
        }

        UserWalletData.InnerHtml = strwalletproc;
    }

    public string SetWalletTableData(int ClientID)
    {
        DateTime now = DateTime.Now;
        var startDate = new DateTime(now.Year, now.Month, 1);
        var endDate = startDate.AddMonths(1).AddDays(-1);
        DataSet WalletDs = new DataSet();
        WalletDs = crmObj.GetWalletDataByDate(ClientID, "CREDIT", startDate, endDate);

        if (WalletDs.Tables[0].Rows.Count > 0)
        {
            try
            {
                UserAccountBalance.InnerHtml = "<i class='fa fa-rupee'></i> "+WalletDs.Tables[0].Rows[0].ItemArray[6].ToString().Sanatize(); 
                 return BindGrid(WalletDs);
            }
            catch (Exception eee)
            {
                return null;
            }
        }
        DateTime SubDate = new DateTime(1900, 1, 1);

        WalletDs = crmObj.GetWalletDataByDate(ClientID, "CREDIT", SubDate, DateTime.Now);

        if (WalletDs.Tables[0].Rows.Count > 0)
        {
            UserAccountBalance.InnerHtml = "<i class='fa fa-rupee'></i> " + WalletDs.Tables[0].Rows[0].ItemArray[6].ToString().Sanatize();
        }
        else
        {
            UserAccountBalance.InnerHtml = "<i class='fa fa-rupee'></i> " + 0; 
        }

        return null;
    }
    public string BindGrid(DataSet WalletDs)
    {
        int i = 0;
        if (WalletDs.Tables.Count > 0)
        {
            if (WalletDs.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in WalletDs.Tables[0].Rows)
                {
                    
                    string Amount = WalletDs.Tables[0].Rows[i].ItemArray[1].ToString().Sanatize();
                    string ReferenceID = WalletDs.Tables[0].Rows[i].ItemArray[3].ToString().Sanatize();
                    string Date = WalletDs.Tables[0].Rows[i].ItemArray[5].ToString().Sanatize();
                    string TransactionType = WalletDs.Tables[0].Rows[i].ItemArray[4].ToString().Sanatize();
                    DateTime WalletDate = Convert.ToDateTime(Date);

                    SetTableReturn = SetTableReturn + @"<tr> ";
                    SetTableReturn = SetTableReturn + "<td>" + WalletDate.ToString("MMM") + " " + WalletDate.Day + " " + WalletDate.Year + "</br>" + WalletDate.ToString("h:mm:ss tt", CultureInfo.InvariantCulture) + "</td>";
                    SetTableReturn = SetTableReturn + "<td> Money added to wallet.</br> Transaction ID:" + ReferenceID + "</td>";
                    if (TransactionType.Equals("CREDIT"))
                    {
                        SetTableReturn = SetTableReturn + "<td> <span class='green'> <i class='fa fa-rupee'></i>" + Amount + "</span></td>";
                    }
                    else
                    {
                        SetTableReturn = SetTableReturn + "<td><i class='fa fa-rupee'></i>" + Amount + "</td>";
                    }

                    SetTableReturn = SetTableReturn + "</tr>";
                    i = i + 1; 
                }
            }
        }

        return SetTableReturn;

       
    }
    public void PrepareClientData()
    {
        DataSet ClientData = new DataSet();
        ClientData = crmObj.Display_Data_BindForEditCrm("CLIENTDATA", Convert.ToInt32(Session["CLIENT_ID"]));
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

    protected void btnDone_Click(object sender, EventArgs e)
    {
        if (Request.Form["AmountToAdd"] != "0")
        {
            PrepareClientData();
            Session["AddAmount"] = Request.Form["AmountToAdd"];
            Response.Redirect("Add_Fund.aspx");
        }
    }

}
