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
public partial class ChangePassword_Default : System.Web.UI.Page
{
    CrmClass ObjCrm = new CrmClass();
    CrmClass crmObj = new CrmClass();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
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

        try
        { 
            string oldpassworrd = Request.Form["currentp"];
            string newpassworrd = Request.Form["confpass"];
            string ClientID = "0";
            HttpCookie cookie = Request.Cookies["LOGINCOOKIE"];
             if (Session["CLIENT_ID"] != null)
                {

                    ClientID = Session["CLIENT_ID"].ToString();
                }
            else
            {
                Response.Redirect("../signin");
            }
             if (oldpassworrd.Trim() == newpassworrd.Trim())
            {
                errorplace.InnerHtml= "Current Password and New Password can not be same!";
                return;
            }

        string ResponseText = "";
        ds = ObjCrm.Crm_ChangePassword(Convert.ToInt32(ClientID), oldpassworrd.Trim(), newpassworrd.Trim());
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                ResponseText = ds.Tables[0].Rows[0].ItemArray[0].ToString();
                errorplace.InnerHtml= ResponseText;
            }
        }
        if (ResponseText == "INVALID CURRENT PASSWORD")
        {
             errorplace.InnerHtml="Error! Not able to change password!";
           
        }
        else if (ResponseText == "PASSWORD CHANGED SUCCESSFULLY")
        {
              
            Response.Redirect("../Signout");
           
        }

        }
        catch (Exception eq)
        {
            errorplace.InnerHtml = "";
        }




    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
    }

    //protected void btnsubmit_Click(object sender, EventArgs e)
    //{


    //}
}