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

public partial class middleware_csr_Redirect : System.Web.UI.Page
{


    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    SqlDataReader dr;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        String ID = "0";
        if (Request.QueryString["ID"] != "" && Request.QueryString["ID"] != null)
        {
            string Name = "";
            string Email = "";
            string ContactNo = "";
            open_conenction();
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select A.AccountEmail,A.AccountName,c.MobileNo from Account_Master A,Client C where A.CLIENTID=C.ClientID and A.CLIENTID=" + Request.QueryString["ID"];
            dr = cmd.ExecuteReader();
            dr.Read();
            try
            {
                Email = dr.GetValue(0).ToString();
                Name = dr.GetValue(1).ToString();
                ContactNo = dr.GetValue(2).ToString();
 
            }
            catch (Exception e1)
            {
            }
            dr.Close();
            con.Close();
            if (Name != "" && Email != "" && ContactNo != "")
            {
                Session["CLIENT_ID"] = Request.QueryString["ID"];
                Session["CLIENT_EMAIL"] = Email;
                Session["CLIENT_CONTACT"] = ContactNo;
                Session["CLIENT_NAME"] = Name;
 		Session["EMID"] = Request.QueryString["EMPID"];
                Response.Redirect("../BookTask/");
            }

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
  
}