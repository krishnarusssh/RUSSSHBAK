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
using System.Web.UI;
using System.Drawing;
using System.Configuration;
using System.Security.Cryptography;
using System.Configuration;

public partial class BookTask_Default : System.Web.UI.Page
{

    CrmClass crmObj = new CrmClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CLIENT_NAME"] == null || Session["CLIENT_NAME"] == "")
        {
            Response.Redirect("../");
        }
        else
        {
            setdata();
        }
        if (!Page.IsPostBack)
        {
            if (Session != null)
            {
                if (Session["CLIENT_NAME"] == null || Session["CLIENT_NAME"] == "")
                {
                    Response.Redirect("../");
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
                for (i = 0; i <= DsAdd.Tables[0].Rows.Count - 1; i++)
                {
                    string aid = DsAdd.Tables[0].Rows[i].ItemArray[0].ToString().Sanatize();
                    string Name = DsAdd.Tables[0].Rows[i].ItemArray[1].ToString().Sanatize();
                    string Mobie = DsAdd.Tables[0].Rows[i].ItemArray[7].ToString().Sanatize();
                    string AddressLine = DsAdd.Tables[0].Rows[i].ItemArray[2].ToString().Sanatize();
                    string Areaid = DsAdd.Tables[0].Rows[i].ItemArray[10].ToString().Sanatize();
                    string Area = DsAdd.Tables[0].Rows[i].ItemArray[8].ToString().Sanatize();
                    string Pincode = DsAdd.Tables[0].Rows[i].ItemArray[6].ToString().Sanatize();
                    string Landmark = DsAdd.Tables[0].Rows[i].ItemArray[5].ToString().Sanatize();
                    string LName = DsAdd.Tables[0].Rows[i].ItemArray[12].ToString().Sanatize();
                    string cat = DsAdd.Tables[0].Rows[i].ItemArray[13].ToString().Sanatize();
                    string lable = DsAdd.Tables[0].Rows[i].ItemArray[15].ToString().Sanatize();
                    int _cat = 0;
                    if (cat == "Home")
                    {
                        _cat = 0;
                    }
                    if (cat == "Office")
                    {
                        _cat = 1;
                    }
                    if (cat == "Others")
                    {
                        _cat = 2;
                    }


                    string instr = aid + "^" + Name.Sanatize() + "^" + Mobie.Sanatize() + "^" + AddressLine.Sanatize() + "^" + Landmark.Sanatize() + "^" + Area.Sanatize() + "^" + Pincode.Replace(" ", "~").Sanatize() + "^" + Areaid.Sanatize() + "^" + LName.Sanatize() + "^" + _cat.ToString() + "^" + lable.ToString();
                    straddress = straddress + @"<div class='addr-body' data-aid='" + aid + @"' data-areaid='" + Areaid + @"'><h3 class='addr_h3'>" + Name + " " + Mobie + @"<a data-toggle='modal' data-target='#address' onclick='FillAdd(this);' data-id='" + instr + "' class='edit'><i class='fa fa-pencil' aria-hidden='true'></i></a></h3><p class='addr_p'>" + AddressLine + "  " + Landmark + "  " + Area + @"</p><input type='text' disabled='disabled' style='display:none'  text=" + instr + " /></div>";
                }
                DivPadd.InnerHtml = "";
                Divdadd.InnerHtml = "";
                DivPadd.InnerHtml = straddress;
                Divdadd.InnerHtml = straddress;
            }
        }
		  if (Session["CLIENT_ID"] != "" && Session["CLIENT_ID"] != null && Session["CLIENT_ID"] != "0")
        {
            string clientid = Session["CLIENT_ID"].ToString();
            int Outstandingamount = crmObj.GetClientOutstanding(Convert.ToInt32(clientid));
            if (Outstandingamount > 0)
            {
                diverror.InnerText = "Your Pending amount is Rs " + Outstandingamount.ToString() + " Will be added in Service fee/ Cash Handling charges";
            }
        }
        else
        {
            Response.Redirect("../Signin/");
        }
    }
}