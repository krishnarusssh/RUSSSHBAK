using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Net;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
public partial class MyProfile_T_Default : System.Web.UI.Page
{
    CrmClass crmObj = new CrmClass();
    string[] spiltstr;
    string clientid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
		Response.Write(Session["PICT"]);

            if (Session != null)
            {
                if (Session["CLIENT_NAME"] == null || Session["CLIENT_NAME"] == "")
                {
                    Response.Redirect("../");
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
string APPID = "NONE";
                string PLT_FORM = "M";
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
                    PLT_FORM = dr.GetValue(1).ToString();
                }
                catch (Exception ee)
                {

                }
                dr.Close();
                con.Close();





                profilename1.InnerHtml = Session["CLIENT_NAME"].ToString();
                profilename2.InnerHtml = Session["CLIENT_NAME"].ToString();

                if (PLT_FORM == "M")
                {


                }
                else
                {


                    if (PLT_FORM == "F")
                    {

                        profileimg.InnerHtml = "<img src=" + "'https://graph.facebook.com/" + APPID + "/picture'" + " style='border-radius:50%; border: 3px solid #CCC;' draggable='false' /> ";
					txtEmail.Text = Session["CLIENT_EMAIL"].ToString();
                    txtphone.Text = Session["CLIENT_CONTACT"].ToString();
                    txtclientname.Text = Session["CLIENT_NAME"].ToString();
                    }
                    if (PLT_FORM == "G")
                    {
                        System.Net.WebRequest request = System.Net.WebRequest.Create("http://picasaweb.google.com/data/entry/api/user/" + APPID + "?alt=json");
                        System.Net.WebResponse response = request.GetResponse();
                        System.IO.Stream dataStream = response.GetResponseStream();
                        System.IO.StreamReader reader = new System.IO.StreamReader(dataStream);
                        string responseFromServer = reader.ReadToEnd();
                        responseFromServer = responseFromServer.Replace("$", "_");
                        dynamic stuff = JsonConvert.DeserializeObject(responseFromServer);

                        //Response.Write(stuff.entry.gphoto_thumbnail._t);

                        profileimg.InnerHtml = "<img src='" + stuff.entry.gphoto_thumbnail._t + "' style='border-radius:50%; border: 3px solid #CCC;' draggable='false' /> ";
					txtEmail.Text = Session["CLIENT_EMAIL"].ToString();
                    txtphone.Text = Session["CLIENT_CONTACT"].ToString();
                    txtclientname.Text = Session["CLIENT_NAME"].ToString();

                    }


                    profilename1.InnerHtml = Session["CLIENT_NAME"].ToString();
                    profilename2.InnerHtml = Session["CLIENT_NAME"].ToString();
               	 	txtEmail.Text = Session["CLIENT_EMAIL"].ToString();
                    txtphone.Text = Session["CLIENT_CONTACT"].ToString();
                    txtclientname.Text = Session["CLIENT_NAME"].ToString();
                }

               // if (pltfrm != "G" && pltfrm != "F")
              //  {
              //      profilename1.InnerHtml = Session["CLIENT_NAME"].ToString();
              //      profilename2.InnerHtml = Session["CLIENT_NAME"].ToString();
               //     txtEmail.Text = Session["CLIENT_EMAIL"].ToString();
               //     txtphone.Text = Session["CLIENT_CONTACT"].ToString();
               //     txtclientname.Text = Session["CLIENT_NAME"].ToString();

              //  }
             //   else
              //  {
              //      profilename1.InnerHtml = Session["Name"].ToString();
              //      profilename2.InnerHtml = Session["Name"].ToString();
              //      txtEmail.Text = Session["Email"].ToString();
              //  }


                int i = 0;

                
                
                
                SelectDate.Items.Clear();
                ListItem l = new ListItem("Day", "0");
                SelectDate.Items.Add(l);
                for (i = 1; i <= 31; i++)
                {
                    ListItem ll = new ListItem(i.ToString(), i.ToString());
                    SelectDate.Items.Add(ll);

                }

                SelectMonth.Items.Clear();
                ListItem lm = new ListItem("Month", "0");
                SelectMonth.Items.Add(lm);

                ListItem lm1 = new ListItem("Jan", "1");
                SelectMonth.Items.Add(lm1);

                ListItem lm2 = new ListItem("Feb", "2");
                SelectMonth.Items.Add(lm2);

                ListItem lm3 = new ListItem("Mar", "3");
                SelectMonth.Items.Add(lm3);

                ListItem lm4 = new ListItem("Apr", "4");
                SelectMonth.Items.Add(lm4);

                ListItem lm5 = new ListItem("May", "5");
                SelectMonth.Items.Add(lm5);

                ListItem lm6 = new ListItem("Jun", "6");
                SelectMonth.Items.Add(lm6);

                ListItem lm7 = new ListItem("Jul", "7");
                SelectMonth.Items.Add(lm7);

                ListItem lm8 = new ListItem("Aug", "8");
                SelectMonth.Items.Add(lm8);

                ListItem lm9 = new ListItem("Sep", "9");
                SelectMonth.Items.Add(lm9);

                ListItem lm10 = new ListItem("Oct", "10");
                SelectMonth.Items.Add(lm10);

                ListItem lm11 = new ListItem("Nov", "11");
                SelectMonth.Items.Add(lm11);

                ListItem lm12 = new ListItem("Dec", "12");
                SelectMonth.Items.Add(lm12);



                SelectYear.Items.Clear();
                ListItem ly = new ListItem("Year", "1900");
                SelectYear.Items.Add(ly);
                for (i = 1950; i <= DateTime.Now.Year; i++)
                {
                    ListItem lly = new ListItem(i.ToString(), i.ToString());
                    SelectYear.Items.Add(lly);

                }
                DataSet Ds = new DataSet();

                Ds = crmObj.Crm_GetProfileData(Convert.ToInt32(clientid));


                if (Ds.Tables.Count > 0)
                {
                    if (Ds.Tables[0].Rows.Count > 0)
                    {
                        txtEmail.Text = Ds.Tables[0].Rows[0].ItemArray[1].ToString();
                        txtphone.Text = Ds.Tables[0].Rows[0].ItemArray[2].ToString();
						txtclientname.Text = Ds.Tables[0].Rows[0].ItemArray[0].ToString();
                        int GenderID = Convert.ToInt32(Ds.Tables[0].Rows[0].ItemArray[3].ToString());
                        // GenderID = (GenderID == 0) ? 3 : GenderID;
                        DateTime DateOfBirth = Convert.ToDateTime(Ds.Tables[0].Rows[0].ItemArray[4].ToString());
                        var Date = DateOfBirth.Day;
                        ;
                        var Month = DateOfBirth.Month;
                        var Year = DateOfBirth.Year;
                        //  Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "setdata(" + Date + "," + Month + "," + Year + "," + GenderID + ")", true);
                        SelectGender.SelectedValue = GenderID.ToString();
                        SelectDate.SelectedValue = Date.ToString();
                        SelectMonth.SelectedValue = Month.ToString();
                        SelectYear.SelectedValue = Year.ToString();
                    }
                }
                DataSet Ds1 = new DataSet();
                Ds1 = crmObj.GetClientTaskCount(Convert.ToInt32(Session["CLIENT_ID"].ToString()));
                if (Ds1.Tables.Count > 0)
                {
                    if (Ds1.Tables[0].Rows.Count > 0)
                    {
                        lblnooftask.Text = Ds1.Tables[0].Rows[0].ItemArray[0].ToString();
                        lblcomp.Text = Ds1.Tables[0].Rows[0].ItemArray[1].ToString();
                        lblcan.Text = Ds1.Tables[0].Rows[0].ItemArray[2].ToString();
                    }
                }
            }
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string Email = txtEmail.Text;
            string MobileNo = txtphone.Text;
            string ClientName = txtclientname.Text;
            string Gender = SelectGender.SelectedValue;
            string Date = SelectDate.SelectedValue;
            string Month = SelectMonth.SelectedValue;
            string Year = SelectYear.SelectedValue;

            HttpCookie cookie = Request.Cookies["LOGINCOOKIE"];
            if (Session["CLIENT_ID"] != null)
            {

                clientid = Session["CLIENT_ID"].ToString();
            }


            DateTime DateOfBirth = new DateTime(Convert.ToInt32(Year), Convert.ToInt32(Month), Convert.ToInt32(Date));

            if (Email.Equals("") || MobileNo.Equals("") || ClientName.Equals(""))
            {
                DataSet Ds = new DataSet();

                Ds = crmObj.Crm_GetProfileData(Convert.ToInt32(clientid));


                if (Ds.Tables.Count > 0)
                {
                    if (Ds.Tables[0].Rows.Count > 0)
                    {
                        ClientName = (ClientName.Equals("")) ? Ds.Tables[0].Rows[0].ItemArray[0].ToString() : ClientName;
                        Email = (Email.Equals("")) ? Ds.Tables[0].Rows[0].ItemArray[1].ToString() : Email;
                        MobileNo = (MobileNo.Equals("")) ? Ds.Tables[0].Rows[0].ItemArray[2].ToString() : MobileNo;
                    }
                }
            
            }

            crmObj.Crm_updateprofileinfo(Convert.ToInt32(clientid), ClientName, MobileNo, Convert.ToInt32(Gender), DateOfBirth, Email);

            txtEmail.Text = Email;
            txtphone.Text = MobileNo;
            txtclientname.Text = ClientName;


            string pltfrm = "";
            try
            {
                pltfrm = Session["PlatForm"].ToString();
            }
            catch (Exception e3)
            {
                pltfrm = "";
            }

            if (pltfrm != "G" && pltfrm != "F")
            {
                Session["CLIENT_NAME"] = ClientName;
                profilename1.InnerHtml = Session["CLIENT_NAME"].ToString();
                profilename2.InnerHtml = Session["CLIENT_NAME"].ToString();
            }
            else
            {
                Session["Name"] = ClientName;
                profilename1.InnerHtml = Session["Name"].ToString();
                profilename2.InnerHtml = Session["Name"].ToString();

            }

        }
        catch (Exception E)
        {

        }

    }
}