using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Collections.Specialized;
using System.Net;
using Newtonsoft.Json;
public partial class BookTask_Payment : System.Web.UI.Page
{
    int clientid = 0;
    int requestid = 0;
    BookTask ObjBT = new BookTask();
    CrmClass crmObj = new CrmClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CLIENT_ID"] == null || Session["CLIENT_ID"] == "")
        {
            Response.Redirect("../");
        }
        else
        {

            if (Request.QueryString["rid"] != "" && Request.QueryString["rid"] != null)
            {
                requestid = Convert.ToInt32(MyExtenstionMethods.DecryptString(Request.QueryString["rid"].ToString()));
                hndrid.Value = Request.QueryString["rid"].ToString();
            }
            if (Session["CLIENT_ID"] != "" && Session["CLIENT_ID"] != null && Session["CLIENT_ID"] != "0")
            {
                clientid = Convert.ToInt32(Session["CLIENT_ID"].ToString());
                hndcid.Value = MyExtenstionMethods.EncryptString(clientid.ToString());
                SetDate();

                int Outstandingamount = crmObj.GetClientOutstanding(clientid);
                if (Outstandingamount > 0)
                {
                    diverror.InnerText = "Your Pending amount is Rs " + Outstandingamount.ToString() + " Will be added in Service fee/ Cash Handling charges";
                    txtoutstanding.Text = Outstandingamount.ToString();
                }
            }
            else
            {
                Response.Redirect("../Signin/");
            }
        }
    }
    public void SetDate()
    {
        DataSet _RData = ObjBT.GetRequestData(requestid, clientid);
        string Tdate = _RData.Tables[0].Rows[0]["TD"].ToString();
        int cat = Convert.ToInt32(_RData.Tables[0].Rows[0]["Category"].ToString());
        int Weight = Convert.ToInt32(_RData.Tables[0].Rows[0]["Weight"].ToString());
        int rcat = Convert.ToInt32(_RData.Tables[0].Rows[0]["returncategory"].ToString());
        int rweight = Convert.ToInt32(_RData.Tables[0].Rows[0]["returncategory"].ToString());
        string ttype = _RData.Tables[0].Rows[0]["Tasktype"].ToString();
        int totalcost = Convert.ToInt32(_RData.Tables[0].Rows[0]["Cost"].ToString());
        int rcost = Convert.ToInt32(_RData.Tables[0].Rows[0]["Rcost"].ToString());
        int servicefee = Convert.ToInt32(_RData.Tables[0].Rows[0]["service"].ToString());
        string padd = _RData.Tables[0].Rows[0]["padd"].ToString();
        string dadd = _RData.Tables[0].Rows[0]["dadd"].ToString();
        string datename = _RData.Tables[0].Rows[0]["DName"].ToString();
        string ptime = _RData.Tables[0].Rows[0]["Picktime"].ToString();
        divpadd.InnerHtml = "<p>" + padd + "</p>";
        divdadd.InnerHtml = "<p>" + dadd + "</p>";
        divtime.InnerHtml = divtime.InnerHtml = " <p><strong> " + datename + " </strong>: " + ptime + " , " + Tdate + "</p>";
        if (ttype.Trim() == "Single")
        {
            if (cat == 19)
            {
                divsfee.InnerHtml = "<i class='fa fa-rupee'></i> 0";
                divCash.InnerHtml = "<i class='fa fa-rupee'></i> " + servicefee;
                divtotal.InnerHtml = "<i class='fa fa-rupee'></i> " + totalcost;
                if (Weight > 5)
                {
                    if (Weight < 10)
                    {
                        divbag.InnerHtml = "<i class='fa fa-rupee'></i> " + 100;
                        hndweight.Value = "100";
                    }
                    else if (Weight < 15)
                    {
                        divbag.InnerHtml = "<i class='fa fa-rupee'></i> " + 200;
                        hndweight.Value = "200";
                    }
                    else if (Weight < 20)
                    {
                        divbag.InnerHtml = "<i class='fa fa-rupee'></i> " + 300;
                       hndweight.Value = "300";
                    }
                    else if (Weight < 25)
                    {
                        divbag.InnerHtml = "<i class='fa fa-rupee'></i> " + 400;
                        hndweight.Value = "400";
                    }
                    else if (Weight > 25)
                    {
                        divbag.InnerHtml = "<i class='fa fa-rupee'></i> " + 500;
                        hndweight.Value = "500";
                    }
                }
                else
                {
                    divbag.InnerHtml = "<i class='fa fa-rupee'></i> " + 0;
                }
            }
            else
            {

                divCash.InnerHtml = "<i class='fa fa-rupee'></i> " + 0;
                divtotal.InnerHtml = "<i class='fa fa-rupee'></i> " + totalcost;
                divsfee.InnerHtml = "<i class='fa fa-rupee'></i> " + (servicefee);
                if (Weight > 5)
                {
                    if (Weight < 10)
                    {
                        divbag.InnerHtml = "<i class='fa fa-rupee'></i> " + 100;
                        hndweight.Value = "=100";
                        divsfee.InnerHtml = "<i class='fa fa-rupee'></i> " + (servicefee );
                    }
                    else if (Weight < 15)
                    {
                        divbag.InnerHtml = "<i class='fa fa-rupee'></i> " + 200;
                        hndweight.Value = "200";
                        divsfee.InnerHtml = "<i class='fa fa-rupee'></i> " + (servicefee);
                    }
                    else if (Weight < 20)
                    {
                        divbag.InnerHtml = "<i class='fa fa-rupee'></i> " + 300;
                        hndweight.Value = "300";
                        divsfee.InnerHtml = "<i class='fa fa-rupee'></i> " + (servicefee);
                    }
                    else if (Weight < 25)
                    {
                        divbag.InnerHtml = "<i class='fa fa-rupee'></i> " + 400;
                        hndweight.Value = "400";
                        divsfee.InnerHtml = "<i class='fa fa-rupee'></i> " + (servicefee);
                    }
                    else if (Weight > 25)
                    {
                        divbag.InnerHtml = "<i class='fa fa-rupee'></i> " + 500;
                        hndweight.Value = "500";
                        divsfee.InnerHtml = "<i class='fa fa-rupee'></i> " + (servicefee);
                    }
                }
                else
                {
                    divbag.InnerHtml = "<i class='fa fa-rupee'></i> " + 0;
                }

            }
        }
        else
        {
            int taskval = totalcost - rcost;
            int wval = totalcost - rcost - servicefee;
            if (cat == 19 || rcat == 19)
            {
                if (cat == 19)
                {
                    divsfee.InnerHtml = "<i class='fa fa-rupee'></i> " + (rcost);
                    divCash.InnerHtml = "<i class='fa fa-rupee'></i> " + taskval;
                    divtotal.InnerHtml = "<i class='fa fa-rupee'></i> " + totalcost;
                }
                if (rcat == 19)
                {
                    divsfee.InnerHtml = "<i class='fa fa-rupee'></i> " + (taskval);
                    divCash.InnerHtml = "<i class='fa fa-rupee'></i> " + rcost;
                    divtotal.InnerHtml = "<i class='fa fa-rupee'></i> " + totalcost;
                }
            }
            else
            {
                divsfee.InnerHtml = "<i class='fa fa-rupee'></i> " + (servicefee + rcost);
                divCash.InnerHtml = "<i class='fa fa-rupee'></i> " + 0;
                divbag.InnerHtml = "<i class='fa fa-rupee'></i> " + wval;
                divtotal.InnerHtml = "<i class='fa fa-rupee'></i> " + totalcost;
            }
        }
        //Wallet Balance
         DataSet DsClientInfo = new DataSet();
                DsClientInfo = crmObj.Display_Data_BindForEditCrm("CLIENTDATA", Convert.ToInt32(Session["CLIENT_ID"]));

                int HasData = 0;
                if (DsClientInfo.Tables.Count > 0)
                {
                    if (DsClientInfo.Tables[0].Rows.Count > 0)
                    {
                        try
                        {
                            wallbal.Text = DsClientInfo.Tables[0].Rows[0].ItemArray[3].ToString();
                             
                        }
                        catch (Exception e344)
                        {
                            wallbal.Text = "0";
                        }
                    }
                }

        //divsfee.InnerHtml = "<i class='fa fa-rupee'></i> " + servicefee;
        DataSet _DsCard = ObjBT.GetCards(clientid);
        string _DivCard = "";
        if (_DsCard.Tables.Count > 0)
        {
            foreach (DataRow row in _DsCard.Tables[0].Rows)
            {
string words = GetCardType(MyExtenstionMethods.DecryptString(row["W/5wgaUz13Q="].ToString()).Substring(0, 6));
                if (words != "N")
                {
                    //string cval = GetCardType("478679");
                    string cardno = MyExtenstionMethods.DecryptString(row["W/5wgaUz13Q="].ToString());
                    _DivCard = _DivCard + "<div class='row'><div class='col-md-12'><div class='quick-card'><div class='quick-check'><span class='quick-select'>";
                    _DivCard = _DivCard + "<div class='quick-check'><input type='radio' name ='cardid' class='css-checkbox' id='" + row["SDov2q9pAoE="].ToString() + @"' value='" + row["SDov2q9pAoE="].ToString() + @"' /><label class='css-label radGroup1' for='" + row["SDov2q9pAoE="].ToString() + @"'>&nbsp;" + MyExtenstionMethods.DecryptString(row["k0ssu8Dm7VgzLJ3iBxfOLA=="].ToString()) + @"</label></div></span></div><div class='card-style'>";
                    _DivCard = _DivCard + "<h5 class='card-no'>Card Number</h5><div class='card-input'><input type='text' placeholder='XXXX' value='" + MyExtenstionMethods.DecryptString(row["W/5wgaUz13Q="].ToString()).Substring(0, 4) + @"' class='form-control' disabled='disabled' />";
                    _DivCard = _DivCard + "</div><div class='card-input'><input type='text' placeholder='XXXX' class='form-control'  disabled='disabled'  /></div>";
                    _DivCard = _DivCard + "<div class='card-input'><input type='text' placeholder='XXXX' class='form-control'  disabled='disabled'  /></div>";
                    _DivCard = _DivCard + "<div class='card-input'><input type='text' placeholder='XXXX' value='" + MyExtenstionMethods.DecryptString(row["W/5wgaUz13Q="].ToString()).GetLast(4) + @"' class='form-control'  disabled='disabled'  /></div><div class='clearfix'></div>";
                    _DivCard = _DivCard + "<div class='row'><div class='col-md-5 col-xs-5' style='padding-bottom: 10px;'><h5 class='card-no sm'>Expiry Date</h5>";
                    if (MyExtenstionMethods.DecryptString(row["w36mjHCgIhnuW/3N2Ctu8Q=="].ToString()).Length == 1)
                    {
                        _DivCard = _DivCard + "<span class='exp-date'> 0" + MyExtenstionMethods.DecryptString(row["w36mjHCgIhnuW/3N2Ctu8Q=="].ToString()).Trim() + @"</span><span style='border-left: 1px solid #999; padding-left: 15px;'>" + MyExtenstionMethods.DecryptString(row["Kq2ImUz0I0yl7uukjD6uwA=="].ToString()) + @"</span></div><div class='col-md-5 col-xs-5'>";
                    }
                    else
                    {
                        _DivCard = _DivCard + "<span class='exp-date'>" + MyExtenstionMethods.DecryptString(row["w36mjHCgIhnuW/3N2Ctu8Q=="].ToString()) + @"</span><span class='exp-date' style='border-left: 1px solid #999; padding-left: 15px;'>" + MyExtenstionMethods.DecryptString(row["Kq2ImUz0I0yl7uukjD6uwA=="].ToString()) + @"</span></div><div class='col-md-4 col-xs-4'>";
                    }
                    _DivCard = _DivCard + "<h5 class='card-no sm' style='padding-left:12%;'>CVV</h5><span class='exp-date'><div class='cdebit-input' style='width: 100%;'>";
                    _DivCard = _DivCard + "<input type='password'  maxlength='3' onBlur='fnqpcv(this)'  placeholder='CVV' id='" + row["SDov2q9pAoE="].ToString() + @"cvv' class='form-control cvv' style='border:1px'  onkeypress='return event.charCode >= 48 && event.charCode <= 57'  /></div></span></div><div class='col-md-3 col-xs-3'>";
                    if (words == "MASTERCARD")
                    {
                        _DivCard = _DivCard + "<img src='../BookTask/img/Mastercard.png' class='pull-right cimgcs' alt='' /><input type='hidden' id='hndcard" + row["SDov2q9pAoE="].ToString() + @"' value='" + MyExtenstionMethods.DecryptString(row["W/5wgaUz13Q="].ToString()) + "_" + MyExtenstionMethods.DecryptString(row["k0ssu8Dm7VgzLJ3iBxfOLA=="].ToString()) + "_" + MyExtenstionMethods.DecryptString(row["w36mjHCgIhnuW/3N2Ctu8Q=="].ToString()) + "_" + MyExtenstionMethods.DecryptString(row["Kq2ImUz0I0yl7uukjD6uwA=="].ToString()) + @"' /></div></div></div></div></div></div>";
                    }
                    if (words == "VISA")
                    {
                        _DivCard = _DivCard + "<img src='../BookTask/img/visa.png' class='pull-right cimgcs' alt='' style='margin-top:0px;' /><input type='hidden' id='hndcard" + row["SDov2q9pAoE="].ToString() + @"' value='" + MyExtenstionMethods.DecryptString(row["W/5wgaUz13Q="].ToString()) + "_" + MyExtenstionMethods.DecryptString(row["k0ssu8Dm7VgzLJ3iBxfOLA=="].ToString()) + "_" + MyExtenstionMethods.DecryptString(row["w36mjHCgIhnuW/3N2Ctu8Q=="].ToString()) + "_" + MyExtenstionMethods.DecryptString(row["Kq2ImUz0I0yl7uukjD6uwA=="].ToString()) + @"' /></div></div></div></div></div></div>";
                    }
                    if (words == "MAESTRO")
                    {
                        _DivCard = _DivCard + "<img src='../BookTask/img/Maestro.png' class='pull-right cimgcs'style='margin-top:0px;' style='margin-top:0px;' alt='' /><input type='hidden' id='hndcard" + row["SDov2q9pAoE="].ToString() + @"' value='" + MyExtenstionMethods.DecryptString(row["W/5wgaUz13Q="].ToString()) + "_" + MyExtenstionMethods.DecryptString(row["k0ssu8Dm7VgzLJ3iBxfOLA=="].ToString()) + "_" + MyExtenstionMethods.DecryptString(row["w36mjHCgIhnuW/3N2Ctu8Q=="].ToString()) + "_" + MyExtenstionMethods.DecryptString(row["Kq2ImUz0I0yl7uukjD6uwA=="].ToString()) + @"' /></div></div></div></div></div></div>";
                    }
                }}
        }
      else
        {
            _DivCard = _DivCard + "<div class='row'>";
            _DivCard = _DivCard + "<div class='col-md-12 text-center'>";
            _DivCard = _DivCard + "<img src='no_card.svg' class='center-block' width='200' alt='' style='margin-bottom: 20px;' >";
            _DivCard = _DivCard + "<span href='#' class='add_card'>ADD CARD</span>";
            _DivCard = _DivCard + "</div></div>";
        }
        DivPayment.InnerHtml = "";
        DivPayment.InnerHtml = _DivCard.ToString();
        DataSet _DsRdata = ObjBT.GetRequestData(requestid, clientid);

        PrepareClientData();

    }
    protected void btnPay_Click(object sender, EventArgs e)
    {
        string pgtype = hndptype.Value.ToString();
    }

    protected void btn_payment_Click(object sender, EventArgs e)
    {
        string pgtype = hndptype.Value.ToString();
        if (pgtype == "1")
        {
            if (hndcashtype.Value.ToString() != "0")
            {

            }
            else 
            {
                string strval = "Please select Payment From";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "clearControls", "callalert(" + strval + ");", true);
            }
        }
    }

    public void PrepareClientData()
    {
        try
        {
            DataSet ClientData = new DataSet();
            ClientData = crmObj.Display_Data_BindForEditCrm("CLIENTDATA", Convert.ToInt32(Session["CLIENT_ID"].ToString()));
            if (ClientData.Tables.Count > 0)
            {
                if (ClientData.Tables[0].Rows.Count > 0)
                {
                    Session["Client_Name"] = ClientData.Tables[0].Rows[0].ItemArray[0].ToString();
                    Session["Client_Email"] = ClientData.Tables[0].Rows[0].ItemArray[1].ToString();
                    Session["Client_Phone"] = ClientData.Tables[0].Rows[0].ItemArray[2].ToString();
                    Session["CLIENT_CONTACT"] = ClientData.Tables[0].Rows[0].ItemArray[2].ToString();

                }
            }
        }
        catch (Exception e)
        {

        }
    }

   
      public string GetCardType(string cno)
    {
        string result = "N";
        try
        {
            using (WebClient client = new WebClient())
            {

                byte[] response =
                client.UploadValues("https://binlist.net/json/" + cno, new NameValueCollection());

                result = System.Text.Encoding.UTF8.GetString(response);
            }

            dynamic stuff = JsonConvert.DeserializeObject(result);
            // card_type card type credit card debit card 
            return stuff.brand ;
        }
        catch (Exception)
        {

            return result;
        }

    }
    

}