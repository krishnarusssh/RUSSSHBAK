using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using ASPSnippets.FaceBookAPI;
using System.Web.Script.Serialization;
using System.Configuration;
using System.Text;
using System.Security.Cryptography;
using System.IO;
using System.Linq;
public partial class LinkYourAccount : System.Web.UI.Page
{


    DataSet ds;
    CrmClass CrmObj = new CrmClass();
    string[] spiltstr;
    string clientid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack == true)
        {
            string PlatForm = "F";


            if (Session["PlatForm"] != "" && Session["PlatForm"] != null)
            {
                PlatForm = Session["PlatForm"].ToString();
                lblPlatForm.Text = PlatForm;
                txtAppID.Text = Session["AppID"].ToString();
              
  
                txtEmailID.Text = Session["Email"].ToString();
                txtName.Text = Session["Name"].ToString();

            }
            else
            {

                lblPlatForm.Text = PlatForm;
                txtAppID.Text = Session["AppID"].ToString();
                txtEmailID.Text = Session["Email"].ToString();
                txtName.Text = Session["Name"].ToString();
            }
           



            SqlCommand cmd = new SqlCommand();
            SqlConnection LocalConn = new SqlConnection();
            SqlDataReader dr;
            LocalConn.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
            LocalConn.Open();
            int cnt = 0;
            cmd = new SqlCommand();
            cmd.Connection = LocalConn;
            cmd.CommandText = "Select count(*) from socialTable where AppID='" + txtAppID.Text + "'  and Name='" + txtName.Text + "' and Platform='" + PlatForm + "'";
            dr = cmd.ExecuteReader();
            try
            {
                dr.Read();
                cnt = Convert.ToInt32(dr.GetValue(0));
            }
            catch (Exception e1)
            {
                cnt = 0;
            }
            dr.Close();
            cmd.Dispose();
            LocalConn.Close();

            if (cnt > 0)
            {
                string ClientID = "0";
                string ClientName = "";
                string ClientContact = "";
                string ClientEmail = "";
                string RussshSocialID = "";
                LocalConn.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
                LocalConn.Open();
                cmd = new SqlCommand();
                cmd.Connection = LocalConn;
                cmd.CommandText = "select C.ClientID,M.AccountName,M.AccountEmail,C.MobileNo,S.SNo from [dbo].[SOCIALTABLE] S,Account_Master M,Client C where S.AccountID=M.AccountID and M.ClientID=C.ClientId  and S.AppID='" + txtAppID.Text + "' and  S.Name='" + txtName.Text + "' and  S.Platform='" + PlatForm + "'";
                dr = cmd.ExecuteReader();
                try
                {
                    dr.Read();
                    ClientID = dr.GetValue(0).ToString();
                    ClientName = dr.GetValue(1).ToString();
                    ClientEmail = dr.GetValue(2).ToString();
                    ClientContact = dr.GetValue(3).ToString();
                    txtMobileNo.Text = ClientContact;
                    Response.Write(ClientContact);
                    RussshSocialID = dr.GetValue(4).ToString();
                }
                catch (Exception e1)
                {
                    cnt = 0;
                }
                dr.Close();
                cmd.Dispose();
                LocalConn.Close();
                if (ClientID != "0")
                {
                    LocalConn.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
                    LocalConn.Open();

                    cmd = new SqlCommand();
                    cmd.Connection = LocalConn;
                    cmd.CommandText = "update [dbo].[SOCIALTABLE]  set Platform='" + lblPlatForm.Text + "' where SNo=" + RussshSocialID;
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();

 			cmd = new SqlCommand();
                    cmd.Connection = LocalConn;
                    cmd.CommandText = "update [dbo].[ACCOUNT_MASTER]  set SOCIALTABLEID=" + RussshSocialID + " where ClientID=" + ClientID;
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();



                    LocalConn.Close();
 
                    Session["CLIENT_ID"] = ClientID;
                    Session["CLIENT_EMAIL"] = ClientEmail;
                    Session["CLIENT_CONTACT"] = ClientContact;
                    Session["CLIENT_NAME"] = ClientName;
                    Response.Redirect("../BookTask/");
                }

            }






        }
        
    }




    protected void Button1_Click(object sender, EventArgs e)
    {



//strq.InnerText = txtName.Text + txtEmailID.Text + txtAppID.Text + lblPlatForm.Text;


        ds = CrmObj.ProcessSocialLogin(txtName.Text, txtEmailID.Text, txtAppID.Text, lblPlatForm.Text);
        string ans = "";
        string ClientID = "0";
        string ClientName = "";
        string ClientContact = "";

        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {

                string ClientEmail = "";
                string RussshSocialID = "";
                 strq.InnerText= strq.InnerText +ds.Tables[0].Rows[0].ItemArray[4].ToString();
                ClientID = ds.Tables[0].Rows[0].ItemArray[0].ToString();
                ClientName = ds.Tables[0].Rows[0].ItemArray[1].ToString();
                ClientEmail = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                ClientContact = ds.Tables[0].Rows[0].ItemArray[3].ToString();
                RussshSocialID = ds.Tables[0].Rows[0].ItemArray[4].ToString();

                SqlCommand cmd = new SqlCommand();
                SqlConnection LocalConn = new SqlConnection();
                LocalConn.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
                LocalConn.Open();
                ClientContact = txtMobileNo.Text;
                cmd = new SqlCommand();
                cmd.Connection = LocalConn;
//string str1 = "";
   // str1 = "update client  set MobileNo='" + txtMobileNo.Text + "',Paasword='" + txtPassword.Text + "',ConfirmPassword='"+txtPassword.Text+"' where ClientID=" + ClientID;
//strq.InnerText = strq.InnerText + str1.ToString();
 
                cmd.CommandText = "update client  set MobileNo='" + txtMobileNo.Text + "',Paasword='" + txtPassword.Text + "',ConfirmPassword='"+txtPassword.Text+"' where ClientID=" + ClientID;
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand();
                cmd.Connection = LocalConn;
                cmd.CommandText = "update Account_Master  set AccountPassword='" + txtPassword.Text + "' where ClientID=" + ClientID;
                cmd.ExecuteNonQuery();

                cmd.Dispose();
                LocalConn.Close();

                Session["CLIENT_ID"] = ClientID;
                Session["CLIENT_EMAIL"] = ClientEmail;
                Session["CLIENT_CONTACT"] = ClientContact;
                Session["CLIENT_NAME"] = ClientName;
               
               Response.Redirect("../BookTask/");

            }
        }
    }
}