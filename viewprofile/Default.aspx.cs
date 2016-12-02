using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class viewprofile_Default : System.Web.UI.Page
{
    CrmClass crmObj = new CrmClass();
    string[] spiltstr;
    string clientid;
    protected void Page_Load(object sender, EventArgs e)
    {

        if(Session["CLIENT_ID"]==null)
		{
			 Response.Redirect("../signin");
		}
       
        try
        {
            if (Session["CLIENT_ID"] != "" && Session["CLIENT_ID"] != null)
            {
                clientid = Session["CLIENT_ID"].ToString();
                lblClientID.Text = Session["CLIENT_ID"].ToString();
            }
        }
        catch (Exception e1)
        {
        }
           



      
        if (!Page.IsPostBack == true)
        {
           
            
            DataSet Ds = new DataSet();
            divedit.Visible = false;
            btnsave.Visible = false;
            btncancel.Visible = false;
            divAAdd.Visible = false;
           
            
            Ds = crmObj.Crm_GetProfileView(Convert.ToInt32(clientid));

         

            if (Ds.Tables.Count > 0)
            {
                if (Ds.Tables[0].Rows.Count > 0)
                {
                    
                    lblfullname.InnerText =  Session["CLIENT_NAME"].ToString();
                    txtname.Text =  Session["CLIENT_NAME"].ToString();
                    lbladdress.InnerText = Ds.Tables[0].Rows[0].ItemArray[10].ToString();
                    txtaddress.Text = Ds.Tables[0].Rows[0].ItemArray[10].ToString();
                    lblarea.InnerText = Ds.Tables[0].Rows[0].ItemArray[11].ToString();
                    txtarea.Text = Ds.Tables[0].Rows[0].ItemArray[11].ToString();
                    lblstreet.InnerText = Ds.Tables[0].Rows[0].ItemArray[9].ToString();
                    txtstreet.Text = Ds.Tables[0].Rows[0].ItemArray[9].ToString();
                    lblcity.InnerText = Ds.Tables[0].Rows[0].ItemArray[13].ToString();
                    txtcity.Text = Ds.Tables[0].Rows[0].ItemArray[13].ToString();
                    txtmobile.Text = Ds.Tables[0].Rows[0].ItemArray[14].ToString();
                    txtbdate.Text = Ds.Tables[0].Rows[0].ItemArray[19].ToString();
                
                    if (Ds.Tables[0].Rows[0].ItemArray[19].ToString() == "1900-01-01")
                    {
                        lblDob.InnerText = "Not Specified";
                    }
                    else
                    {
                        lblDob.InnerText = Ds.Tables[0].Rows[0].ItemArray[19].ToString();
                    }


                    if (Session["VALIDATEDMOBILENO"] != "" && Session["VALIDATEDMOBILENO"] != null)
                    {
                        lblmobile.InnerText = Session["VALIDATEDMOBILENO"].ToString();
                    }
                    else
                    {
                        lblmobile.InnerText = Session["CLIENT_CONTACT"].ToString();
                    }
                   
                   
                    lblPreviousMobileNo.Text = Session["CLIENT_CONTACT"].ToString();
                    // lblMiddleName.Text = Ds.Tables[0].Rows[0].ItemArray[1].ToString();
                    if (Ds.Tables[0].Rows[0].ItemArray[17].ToString() == "0")
                    {
                        profilebox.Visible = false;
                        messagebox.Visible = true;
                    }
                    else
                    {
                        profilebox.Visible = true;
                        messagebox.Visible = false;
                    }


                }

            }
           
            FillList();
     


        }


    }
    public void FillList()
    {
        DataSet DsAdd = new DataSet();
        DsAdd = crmObj.GetAdditionalAddress(Convert.ToInt32(clientid));
        if (DsAdd.Tables.Count > 0)
        {
            if (DsAdd.Tables[0].Rows.Count > 0)
            {
                lsteditsddress.DataSource = DsAdd;
                lsteditsddress.DataBind();
            }
        }
    }

   
    protected void btnedit_Click(object sender, EventArgs e)
    {
        btnsave.Visible = true;
        divdisplay.Visible = false;
        divedit.Visible = true;
        btnedit.Visible = false;
        btncancel.Visible = true;
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("../ViewProfile");
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        int status = 1;
        string doa="";
        if (txtmobile.Text.ToString().Length < 10)
        {
            return;
        }
      
          DataSet Ds1 = new DataSet();
          Ds1 = crmObj.Crm_updateaddress( Convert.ToInt32(clientid),txtname.Text,txtmobile.Text,txtstreet.Text,txtaddress.Text,txtarea.Text,txtcity.Text,txtbdate.Text.ToString(), Convert.ToInt32(0),status,"01/01/1991");
         
        
        
          lblfullname.InnerText = txtname.Text.ToString();
          lbladdress.InnerText = txtaddress.Text.ToString();
          lblarea.InnerText = txtarea.Text.ToString();
          lblstreet.InnerText = txtstreet.Text.ToString();
          lblcity.InnerText = txtcity.Text.ToString();
          lblmobile.InnerText = txtmobile.Text.ToString();

          if (txtmobile.Text!= lblPreviousMobileNo.Text)
          {
               string actcode = "";
                Guid g;
                // Create and display the value of two GUIDs.
                g = Guid.NewGuid();
                actcode = g.ToString();
        
        
                string mootp;
                Random r = new Random();
                int randNum = r.Next(10000);
                string FiveDigitNumber = randNum.ToString("D5");
                mootp = FiveDigitNumber;
                string[] spiltstr1;
                string clientid1 = "";
                HttpCookie cookie1 = Request.Cookies["LOGINCOOKIE"];
                string c1 = "NONE";
                try
                {
                    c1 = cookie1.Value.ToString();
                    spiltstr1 = c1.Split('-');
                    clientid1 = spiltstr1[0].ToString();

                }
                catch (Exception e1)
                {
                }
                if (c1 == "NONE")
                {
                    Response.Redirect("../");
                }
                DataSet DsRe = crmObj.ReInitiateClientVerificationProcess(Convert.ToInt32(clientid1), actcode, mootp, txtmobile.Text);
                Response.Redirect("../VerifyMobileNo/");

        }
          Response.Redirect("../ViewProfile");
          divdisplay.Visible = true;
          divedit.Visible = false;
          btncancel.Visible = false;
          btnsave.Visible = false;
          btnedit.Visible = true;

     }
  
    protected void lsteditsddress_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "btnedit")
        {
          
            Label lblAddressID=new Label();
            lblAddressID = e.Item.FindControl("lblid") as Label;

            lblSelectedID.Text = lblAddressID.Text;

            int aid = Convert.ToInt32(lblAddressID.Text) ;
            Label txt_aname = (Label)e.Item.FindControl("lblname");
            Label txt_add = (Label)e.Item.FindControl("lbladd");
            Label txt_area1 = (Label)e.Item.FindControl("lblarea");
            Label txt_landmark = (Label)e.Item.FindControl("lbllandmark");
            Label txt_city1 = (Label)e.Item.FindControl("lblcity");
            Label txt_pin = (Label)e.Item.FindControl("lblpin");
            Label txt_mobile1 = (Label)e.Item.FindControl("lblmobile");
            txtaname.Text = txt_aname.Text;
            txtadd.Text = txt_add.Text;
            txtarea1.Text = txt_area1.Text;
            txtlandmark.Text = txt_landmark.Text;
            txtcity1.Text = txt_city1.Text;
            txtpin.Text = txt_pin.Text;
            txtmobile1.Text = txt_mobile1.Text;
            divAAdd.Visible = true;
            txtaname.Focus();
        }
        if (e.CommandName == "btnRemove")
        {

            Label lblAddressID = new Label();
            lblAddressID = e.Item.FindControl("lblid") as Label;

            lblSelectedID.Text = lblAddressID.Text;

            int aid = Convert.ToInt32(lblAddressID.Text);
            DataSet Del = new DataSet();
            Del = crmObj.DeleteClientAddress(aid);
            FillList();
        }

    }

    protected void btnACancel_Click(object sender, EventArgs e)
    {
        lblSelectedID.Text = "0";
        txtaname.Text = "";
        txtadd.Text ="";
        txtarea1.Text ="";
        txtlandmark.Text ="";
        txtcity1.Text ="";
        txtpin.Text = "";
        txtmobile1.Text ="";
        divAAdd.Visible = false;
    }

    public void Reset()
    {
        lblSelectedID.Text = "0";
        txtaname.Text = "";
        txtadd.Text = "";
        txtarea1.Text = "";
        txtlandmark.Text = "";
        txtcity1.Text = "";
        txtpin.Text = "";
        txtmobile1.Text = "";
        divAAdd.Visible = true;
        txtaname.Focus();
    }
    protected void btnnew_Click(object sender, EventArgs e)
    {
        Reset();
    }
    protected void btnASave_Click(object sender, EventArgs e)
    {
       /*
        DataSet Ds1 = new DataSet();
      //  Ds1 = crmObj.InsertUpdateAdditionalAddress(Convert.ToInt32(lblSelectedID.Text), Convert.ToInt32(clientid), txtaname.Text, txtadd.Text, txtarea1.Text, txtcity1.Text, txtlandmark.Text, txtpin.Text, txtmobile1.Text,0,0);
        DataSet DsAdd = new DataSet();
        Reset();


        DsAdd = crmObj.GetAdditionalAddress(Convert.ToInt32(clientid));
        if (DsAdd.Tables.Count > 0)
        {
            if (DsAdd.Tables[0].Rows.Count > 0)
            {
                lsteditsddress.DataSource = DsAdd;
                lsteditsddress.DataBind();


            }
        }
      */   
    }

    protected void btnContinue_Click(object sender, EventArgs e)
    {
        Response.Redirect("../BookTask/");

    }
  
    protected void btnUpdateProfile_Click(object sender, EventArgs e)
    {
        string clntid = "0";
        clntid = lblClientID.Text;

        if (clntid != "0")
        {
            DataSet dsLogin = new DataSet();
            dsLogin = crmObj.RecordLogin(Convert.ToInt32(clntid));
            messagebox.Visible = false;
            profilebox.Visible = true;
        }
    }
    protected void btnBookTask_Click(object sender, EventArgs e)
    {
        Response.Redirect("../BookTask/");
    }
    protected void btnWallet_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Wallet/");
    }
}