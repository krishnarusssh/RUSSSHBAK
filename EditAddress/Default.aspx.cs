using System;
using System.Collections.Generic;
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
public partial class MyAddress_T_Default : System.Web.UI.Page
{
    CrmClass crmObj = new CrmClass();
    int clientid = 0;
    string strproc = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack == true)
        {
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





                ProfileName1.InnerHtml = Session["CLIENT_NAME"].ToString();
                profilename2.InnerHtml = Session["CLIENT_NAME"].ToString();

                if (PLT_FORM == "M")
                {


                }
                else
                {


                    if (PLT_FORM == "F")
                    {

                        profileimg.InnerHtml = "<img src=" + "'https://graph.facebook.com/" + APPID + "/picture'" + " style='border-radius:50%; border: 3px solid #CCC;' draggable='false' /> ";
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


                    }


                    ProfileName1.InnerHtml = Session["CLIENT_NAME"].ToString();
                    profilename2.InnerHtml = Session["CLIENT_NAME"].ToString();
                }


            }
            string clientid = Session["CLIENT_ID"].ToString();

            if (clientid != "0")
            {
                setdata();
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
        }
        
    }
    public void setdata()
    {
        DataSet DsAdd = new DataSet();
        DsAdd = crmObj.GetAdditionalAddress(Convert.ToInt32(Session["CLIENT_ID"].ToString()));
        if (DsAdd.Tables.Count > 0)
        {
            string straddress = "";
            if (DsAdd.Tables[0].Rows.Count > 0)
            {
                int i = 0;
               // for (i = 0; i <= DsAdd.Tables[0].Rows.Count - 1; i++)
                foreach (DataRow dr in DsAdd.Tables[0].Rows)
                {
                    string aid = DsAdd.Tables[0].Rows[i].ItemArray[0].ToString().Sanatize();
                    string Name = DsAdd.Tables[0].Rows[i].ItemArray[1].ToString().Sanatize();
                    string LName = DsAdd.Tables[0].Rows[i].ItemArray[12].ToString().Sanatize();
                    string Mobie = DsAdd.Tables[0].Rows[i].ItemArray[7].ToString().Sanatize();
                    string AddressLine = DsAdd.Tables[0].Rows[i].ItemArray[2].ToString().Sanatize();
                    string Landmark = DsAdd.Tables[0].Rows[i].ItemArray[5].ToString().Sanatize();
                    string Areaid = DsAdd.Tables[0].Rows[i].ItemArray[10].ToString().Sanatize();
                    string Area = DsAdd.Tables[0].Rows[i].ItemArray[8].ToString().Sanatize();
                    string Cityid = DsAdd.Tables[0].Rows[i].ItemArray[11].ToString().Sanatize();
                    string City = DsAdd.Tables[0].Rows[i].ItemArray[9].ToString().Sanatize();
                    string Pincode = DsAdd.Tables[0].Rows[i].ItemArray[6].ToString().Sanatize();
                    string Category = DsAdd.Tables[0].Rows[i].ItemArray[13].ToString().Sanatize();
                    string IsFlagFav = DsAdd.Tables[0].Rows[i].ItemArray[14].ToString().Sanatize();
                    string AddressLabel = DsAdd.Tables[0].Rows[i].ItemArray[15].ToString().Sanatize();
                    string Cat = DsAdd.Tables[0].Rows[i].ItemArray[16].ToString().Sanatize();
                    string instr = Name.Sanatize() + "^" + LName.Sanatize() + "^" + Mobie.Sanatize() + "^" + AddressLine.Sanatize() + "^" + Landmark.Sanatize() + "^" + Area.Sanatize() + "^" + Pincode.ToString().Sanatize() + "^" + Areaid.ToString().Sanatize() + "^" + Cat.ToString().Sanatize() + "^" + IsFlagFav.ToString().Sanatize() + "^" + AddressLabel.Sanatize() + "^" + aid;
                    straddress = straddress + @"<div class='addr-body' data-aid='" + Areaid + @"'><h3 class='addr_h3'>" + Name + " " + LName + " " + Mobie + @"<a   onclick='FillAdd(this);' data-id='" + instr + "' data-aid='" + aid + "' class='edit'><i class='fa fa-pencil' aria-hidden='true'></i></a></h3><p class='addr_p'>" + AddressLine + " " + Landmark + " " + Area + " " + Pincode + @"</p><input type='text' disabled='disabled' style='display:none'  text=" + instr + " /></div>";

                    strproc = strproc + " <div class='__savedaddress'>";
                    strproc = strproc + " <div class='left'>";
                    strproc = strproc + " <span class='add_badge'>" + Category + "</span>";
                    strproc = strproc + " <h3>" + Name +" " + LName +" " + Mobie + "</h3>";
                    strproc = strproc + " <p>" + AddressLine + ", " + Landmark + ", " + City +", "+ Area+"-"+Pincode+ "</p>";
                    strproc = strproc + " </div>";
                    strproc = strproc + " <div class='right'>";         
                    if (IsFlagFav == "Y")
                    {
                        strproc = strproc + " <i class='fa fa-star fav_star'  data-aid='" + aid + "' onclick='select(this)'></i>";
                    }
                    else
                    {
                        strproc = strproc + " <i class='fa fa-star star'  data-aid='" + aid + "' onclick='select(this)'></i>";
                    }
                    strproc = strproc + " <img src='../img/edit.png' alt='' data-target='#address' class='_edit' data-id='" + instr + "' data-aid='" + aid + "' onclick='FillAdd(this)' id='edit'></img>";
                    strproc = strproc + " <img src='../img/close.png' alt=''  data-aid='" + aid + "' onclick='opclose(this)' id='close'></img>";
                    strproc = strproc + " </div>";
                    strproc = strproc + " <div style='padding-top:10px;' class='row collapse in' id='" + (i + 1) + "'>";
                    strproc = strproc + " </div>";
                    strproc = strproc + " </div>";
                    i++;
                }
                accordion.InnerHtml = strproc.ToString();                    
            }
        }
    }
  
}






