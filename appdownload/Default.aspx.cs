using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class appdownload_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string code = Request.QueryString["code"];
        Label1.Text = code;
	   SqlConnection Localconn = new SqlConnection();
            Localconn.ConnectionString = "data source=45.114.141.99;initial catalog=RUSSSH_DB;persist security info=True;user id=sa;password=CY%Mdf5sG4c$;MultipleActiveResultSets=True;";
            try
            {
                Localconn.Open();
            }
            catch (Exception e1)
            {
            }
            if (Localconn.State == ConnectionState.Open)
            {
                string error = "";
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter da;
                DataSet ds = new DataSet();
                try
                {

                    cmd = new SqlCommand("select FirstName from ru_trans.Registrations where ReferalCode='" + code+"'", Localconn);
                    cmd.CommandType = CommandType.Text;
                    da = new SqlDataAdapter(cmd);
                    da.Fill(ds);

                }
                catch (Exception e22)
                {
                    error = e.ToString();
                }
                finally
                {
                    cmd.Dispose();
                    Localconn.Close();
                }

                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        nametext.InnerHtml = "YOU GOT THREE FREE DELIVERY FROM " + ds.Tables[0].Rows[0].ItemArray[0].ToString().ToUpper();

                    }
                    else
                    {
                        nametext.InnerHtml = "YOU GOT THREE FREE DELIVERY FROM NOBODY";
                    }
                }



            }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string flag = "";
        string message = "";

        if (txtMobileNo.Text != "" && txtMobileNo.Text.ToString().Length == 10)
        {
            //ru_trans.RecordUniqueCodes 
            SqlConnection Localconn = new SqlConnection();
            Localconn.ConnectionString = "data source=45.114.141.99;initial catalog=RUSSSH_DB;persist security info=True;user id=sa;password=CY%Mdf5sG4c$;MultipleActiveResultSets=True;";
            try
            {
                Localconn.Open();
            }
            catch (Exception e1)
            {
            }
            if (Localconn.State == ConnectionState.Open)
            {
                string error = "";
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter da;
                DataSet ds = new DataSet();
                try
                {

                    cmd = new SqlCommand("ru_trans.RecordUniqueCodes", Localconn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@UniqueCode", SqlDbType.NVarChar, 12).Value = Label1.Text;

                    cmd.Parameters.Add("@ReceiverMobileNo", SqlDbType.VarChar, 10).Value = txtMobileNo.Text;
                    da = new SqlDataAdapter(cmd);
                    da.Fill(ds);

                }
                catch (Exception e22)
                {
                    error = e.ToString();
                }
                finally
                {
                    cmd.Dispose();
                    Localconn.Close();
                }

                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        flag = ds.Tables[0].Rows[0].ItemArray[0].ToString();
                        message = ds.Tables[0].Rows[0].ItemArray[1].ToString();

                    }
                }


            }
        }

        if (flag == "Y")
        {
            Response.Redirect("http://crm.russsh.com/senddownloadlink.aspx");

        }
        else
        {
            lblError.Text = message;
        }
    }
}