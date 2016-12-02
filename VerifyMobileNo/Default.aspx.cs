using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.IO;
using ASPSnippets.FaceBookAPI;
using System.Web.Script.Serialization;

public partial class VefifyMobileNo_Default : System.Web.UI.Page
{
    CrmClass crmObj = new CrmClass();
    string[] spiltstr;
    string clientid;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["LOGINCOOKIE"];
        string c = "NONE";
        try
        {
            c = cookie.Value.ToString();
            spiltstr = c.Split('-');
            clientid = spiltstr[0].ToString();
        }
        catch (Exception e1)
        {
        }
        if (c == "NONE")
        {
            Response.Redirect("../");
        }

        if (!Page.IsPostBack == true)
        {
            DataSet Ds = new DataSet();
            btnVerifyMobile.Visible = false;
            verylabel.Visible = false;
            txtMissedCallNo.Visible = false;
            clientid = spiltstr[0].ToString();

            try
            {
                 clientid = Session["CLIENT_ID"].ToString();
                    lblMemberID.Text = clientid;
            }
            catch (Exception e1)
            {
            }


            Ds = crmObj.Crm_GetProfileView(Convert.ToInt32(clientid));
            if (Ds.Tables.Count > 0)
            {
                if (Ds.Tables[0].Rows.Count > 0)
                {
                    if (Ds.Tables[0].Rows[0].ItemArray[18].ToString() == "Y")
                    {
                        
                        Response.Redirect("../ViewProfile/");
                    }
                    else
                    {
                        txtMobileNo.Text = Ds.Tables[0].Rows[0].ItemArray[14].ToString();
                        lblMemberName.Text = Ds.Tables[0].Rows[0].ItemArray[0].ToString();
                    }
                  
                }
            }
        }




    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        
        
        if (txtMobileNo.Text.ToString().Length < 10)
        {
            lblError.Text = "Enter a 10 digit valid Mobile No.";
            return;
        }
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


        string clientid1 = "0";

        try
        {
            if (Session["CLIENT_ID"] != "" && Session["CLIENT_ID"] != null)
            {
                clientid1 = Session["CLIENT_ID"].ToString();
            }
        }
        catch (Exception e1)
        {
        }
        
        clientid1 = lblMemberID.Text;
       

        DataSet DsReset = crmObj.ReInitiateClientVerificationProcess(Convert.ToInt32(clientid1), actcode, mootp,txtMobileNo.Text);

        WebClient client = new WebClient();
        client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");

        string DestinationMobile = txtMobileNo.Text;
        string MessagePart = Server.UrlEncode("Dear " + lblMemberName.Text + " The OTP for sign up to russsh.com is  " + mootp);

        Stream data = client.OpenRead("http://enterprise.smsgupshup.com/GatewayAPI/rest?method=SendMessage&send_to=" + txtMobileNo.Text + "&msg=" + MessagePart + "&msg_type=TEXT&userid=2000148575&auth_scheme=plain&password=getmypeon&v=1.1&format=text");
        StreamReader reader = new StreamReader(data);
        string s = reader.ReadToEnd();
        Console.WriteLine(s);
        data.Close();
        reader.Close();
        txtMobileNo.Visible = false;
        btnSave.Visible = false;

        btnVerifyMobile.Visible = true;
        verylabel.Visible = true;
        txtMissedCallNo.Visible = true;

    }
    protected void btnVerifyMobile_Click(object sender, EventArgs e)
    {
        DataSet dsVerify = new DataSet();

        DataSet DsA = new DataSet();
        DsA = crmObj.Crm_GetProfileView(Convert.ToInt32(lblMemberID.Text));
        string AccID = "0";
/*       
 if (DsA.Tables.Count > 0)
        {
            if(DsA.Tables[0].Rows.Count>0)
            {
                AccID = DsA.Tables[0].Rows[0].ItemArray[23].ToString();
            }
        }
*/
        dsVerify = crmObj.Crm_VerifyOTP(txtMobileNo.Text, txtMissedCallNo.Text);
        string success = "N";
        string code = "";
        if (dsVerify.Tables.Count > 0)
        {
            if (dsVerify.Tables[0].Rows.Count > 0)
            {
                success = dsVerify.Tables[0].Rows[0].ItemArray[0].ToString();
                //code = dsVerify.Tables[0].Rows[0].ItemArray[1].ToString();
                Session["VALIDATEDMOBILENO"] = txtMobileNo.Text;
            }
        }
      
        if (success == "Y")
        {
           
            Response.Redirect("../ViewProfile/");
        }
        else
        {
            
            
        }
    }
}