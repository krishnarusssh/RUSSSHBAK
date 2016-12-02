using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class tracking_Default : System.Web.UI.Page
{
    CrmClass ObjCrm = new CrmClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        int Clientid = 0;
        int Taskid = 0;
        if (!Page.IsPostBack == true)
        {
            if (Session["CLIENT_ID"] != "" && Session["CLIENT_ID"] != null)
            {
                int.TryParse(Session["CLIENT_ID"].ToString(), out Clientid);
                try
                {
                    int.TryParse(Request.QueryString["TaskID"], out Taskid);
                }
                catch
                {
                    Taskid = 0;
                }

            }
            else
            {
                int.TryParse(Request.QueryString["TaskID"], out Taskid);
                // Response.Redirect("../Signin/");
            }
            if (Taskid > 0)
            {
                DataSet dsTracking = ObjCrm.GetTrackingdetails(Clientid, Taskid);
                if (dsTracking.Tables.Count > 0)
                {
                    if (dsTracking.Tables[0].Rows.Count > 0)
                    {

                        int status = 0;
                        status = Convert.ToInt32(dsTracking.Tables[0].Rows[0].ItemArray[9].ToString());
                        if (status == 0)
                        {

                            pdone.Style.Add("opacity", "0.3");
                            ddone.Style.Add("opacity", "0.3");
                            divpickup.Attributes.Add("Class", "task-circleof");
                            divdrop.Attributes.Add("Class", "task-circleof");
                        }
                        if (status == 1)
                        {
                            ddone.Style.Add("opacity", "0.3");
                            divdrop.Attributes.Add("Class", "task-circleof");
                            ptime.InnerText = dsTracking.Tables[0].Rows[0].ItemArray[16].ToString();
                            dtime.InnerText = dsTracking.Tables[0].Rows[0].ItemArray[17].ToString();
                        }
                        

                        tcat.InnerText = dsTracking.Tables[0].Rows[0].ItemArray[3].ToString();
                        ttotal.InnerText = dsTracking.Tables[0].Rows[0].ItemArray[18].ToString();
                        ename.InnerText = dsTracking.Tables[0].Rows[0].ItemArray[12].ToString();
                        emobile.InnerText = dsTracking.Tables[0].Rows[0].ItemArray[13].ToString();
                        emobile.InnerHtml = "+91 8080808315&nbsp;&nbsp;";
                        btime.InnerText = dsTracking.Tables[0].Rows[0].ItemArray[10].ToString();
                        ctime.InnerText = dsTracking.Tables[0].Rows[0].ItemArray[11].ToString();
                        padd.InnerText = dsTracking.Tables[0].Rows[0].ItemArray[14].ToString();
                        dadd.InnerText = dsTracking.Tables[0].Rows[0].ItemArray[15].ToString();
                       
                        
                        Htime.InnerText = dsTracking.Tables[0].Rows[0].ItemArray[20].ToString();
                        txtSource.Value = dsTracking.Tables[0].Rows[0].ItemArray[21].ToString();
                        txtDestination.Value = dsTracking.Tables[0].Rows[0].ItemArray[22].ToString();
                        lblday.InnerText = dsTracking.Tables[0].Rows[0].ItemArray[23].ToString();
                        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "myJsFn", "SearchRoute()", true);
                        if (dsTracking.Tables[0].Rows[0].ItemArray[12].ToString() == " ")
                        {
                            confirm.Style.Add("opacity", "0.3");
                            divconf.Attributes.Add("Class", "task-circleof");
                        }
                        if (Clientid != 0)
                        {
                            int i = 0;
                            string strproc = "";
                            if (dsTracking.Tables[1].Rows.Count > 0)
                            {
                                foreach (DataRow dr in dsTracking.Tables[1].Rows)
                                {
                                    strproc = strproc + " <div class='tracking-box panel'>";

                                    if (i + 1 == 1)
                                    {
                                        strproc = strproc + " <h4 data-toggle='collapse' class='accordion-toggle' data-parent='#accordion' href='#" + (i + 1) + "'>&nbsp; <span>Tracking Id: " + dsTracking.Tables[1].Rows[i].ItemArray[0].ToString() + "</span></h4>";
                                        strproc = strproc + " <div style='padding-top:10px;' class='row collapse in' id='" + (i + 1) + "'>";
                                    }
                                    else
                                    {
                                        strproc = strproc + " <h4 data-toggle='collapse' class='accordion-toggle collapsed' data-parent='#accordion' href='#" + (i + 1) + "'>&nbsp; <span>Tracking Id: " + dsTracking.Tables[1].Rows[i].ItemArray[0].ToString() + "</span></h4>";
                                        strproc = strproc + " <div style='padding-top:10px;' class='row collapse' id='" + (i + 1) + "'>";
                                    }

                                    strproc = strproc + " <div class='col-md-8'>";
                                    strproc = strproc + " <p>" + dsTracking.Tables[1].Rows[i].ItemArray[2].ToString() + " <br />";
                                    strproc = strproc + dsTracking.Tables[1].Rows[i].ItemArray[20].ToString() + "  <br />";
                                    strproc = strproc + " Cake Delivery</p>";
                                    strproc = strproc + " </div>";
                                    strproc = strproc + " <div class='col-md-4'><strong ><i class='fa fa-rupee' style='margin-left: 14px;' ></i>" + dsTracking.Tables[1].Rows[i].ItemArray[18].ToString() + "/-</strong>";

                                    if (Convert.ToInt32(dsTracking.Tables[1].Rows[i].ItemArray[9].ToString()) == 0)
                                    {
                                        strproc = strproc + " <p><span class='track-badge'>BOOKED</span></p>";
                                    }
                                    if (Convert.ToInt32(dsTracking.Tables[1].Rows[i].ItemArray[9].ToString()) == 1)
                                    {
                                        strproc = strproc + " <p><span class='track-badge'>INPROCESS</span></p>";
                                    }
                                    strproc = strproc + " </div>";
                                    strproc = strproc + " <div class='col-md-12 col-xs-12 p-bt10 order-drop'>";
                                    strproc = strproc + " <span data-toggle='collapse' class='track-gbtn' data-parent='#order' href='#order" + i + "'>Order Details <i class='plus'></i> ";
                                    strproc = strproc + " </span> &nbsp;<span class='track-gbtn'><b> <a href='https://www.russsh.com/tracking/default.aspx?TaskID=" + dsTracking.Tables[1].Rows[i].ItemArray[0].ToString() + "'> Track</a></b> </span>";
                                    //strproc = strproc + " </span> &nbsp;<span class='track-gbtn'>Cancel Delivery</span>";
                                    strproc = strproc + " <div class='collapse' id='order" + i + "' >";
                                    strproc = strproc + " <div class='order-over'>";
                                    strproc = strproc + " <div class='row'>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'>Task Mode</div><div class='col-md-6 col-xs-6 text-right'> " + dsTracking.Tables[1].Rows[i].ItemArray[4].ToString() + "</div>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'>Service Fee</div><div class='col-md-6 col-xs-6 text-right'> " + dsTracking.Tables[1].Rows[i].ItemArray[5].ToString() + "</div>";
                                    //strproc = strproc + " <div class='col-md-6 col-xs-6'>Cash handling</div><div class='col-md-6 col-xs-6 text-right'> " + dsTracking.Tables[1].Rows[0].ItemArray[9].ToString() + "</div>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'>Excess Baggage</div><div class='col-md-6 col-xs-6 text-right'>" + dsTracking.Tables[1].Rows[i].ItemArray[6].ToString() + "</div>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'>Waiting Fee </div><div class='col-md-6 col-xs-6 text-right'>" + dsTracking.Tables[1].Rows[i].ItemArray[7].ToString() + "</div>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'>Transport Fee </div><div class='col-md-6 col-xs-6 text-right'> " + dsTracking.Tables[1].Rows[i].ItemArray[8].ToString() + "</div>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'><strong>Total Amount</strong></div><div class='col-md-6 col-xs-6 text-right'><strong>" + dsTracking.Tables[1].Rows[i].ItemArray[18].ToString() + "</strong></div>";
                                    strproc = strproc + " </div></div></div></div></div></div>";

                                    i++;
                                }
                            }

                            strproc = strproc + "<h5 class='past-title'>PAST DELIVERY</h5>";
                            int j = i + 2;
                            i = 0;
                            int k = 0;
                            if (dsTracking.Tables[2].Rows.Count > 0)
                            {
                                foreach (DataRow dr in dsTracking.Tables[2].Rows)
                                {
                                    strproc = strproc + " <div class='tracking-box panel'>";
                                    strproc = strproc + " <h4 data-toggle='collapse' class='accordion-toggle collapsed' data-parent='#accordion' href='#" + j + "'>&nbsp; <span>Tracking Id: " + dsTracking.Tables[2].Rows[k].ItemArray[0].ToString() + "</span></h4>";
                                    strproc = strproc + " <div style='padding-top:10px;' class='row collapse' id='" + j + "'>";
                                    strproc = strproc + " <div class='col-md-8'>";
                                    strproc = strproc + " <p>" + dsTracking.Tables[2].Rows[k].ItemArray[2].ToString() + " <br />";
                                    strproc = strproc + dsTracking.Tables[2].Rows[k].ItemArray[20].ToString() + "  <br />";
                                    strproc = strproc + " Cake Delivery</p>";
                                    strproc = strproc + " </div>";

                                    strproc = strproc + " <div class='col-md-4'><strong   ><i class='fa fa-rupee' style='margin-left: 14px;' ></i>" + dsTracking.Tables[2].Rows[k].ItemArray[18].ToString() + "/-</strong>";

                                    strproc = strproc + " <p><span class='track-badge-done'>COMPLETED</span></p>";
                                    strproc = strproc + " </div>";
                                    strproc = strproc + " <div class='col-md-12 col-xs-12 p-bt10 order-drop'>";
                                    strproc = strproc + " <span data-toggle='collapse' class='track-gbtn' data-parent='#order' href='#order" + j + "'>Order Details <i class='plus'></i> ";
                                    strproc = strproc + " </span> &nbsp;<span class='track-gbtn'><b> <a href='https://www.russsh.com/tracking/default.aspx?TaskID=" + dsTracking.Tables[2].Rows[k].ItemArray[0].ToString() + "'> Track</a></b> </span>";
                                    //strproc = strproc + " </span> &nbsp;<span class='track-gbtn'>Cancel Delivery</span>";
                                    strproc = strproc + " <div class='collapse' id='order" + j + "' >";
                                    strproc = strproc + " <div class='order-over'>";
                                    strproc = strproc + " <div class='row'>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'>Task Mode</div><div class='col-md-6 col-xs-6 text-right'> " + dsTracking.Tables[2].Rows[k].ItemArray[4].ToString() + "</div>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'>Service Fee</div><div class='col-md-6 col-xs-6 text-right'> " + dsTracking.Tables[2].Rows[k].ItemArray[5].ToString() + "</div>";
                                    //strproc = strproc + " <div class='col-md-6 col-xs-6'>Cash handling</div><div class='col-md-6 col-xs-6 text-right'> " + dsTracking.Tables[2].Rows[k].ItemArray[9].ToString() + "</div>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'>Excess Baggage</div><div class='col-md-6 col-xs-6 text-right'>" + dsTracking.Tables[2].Rows[k].ItemArray[6].ToString() + "</div>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'>Waiting Fee </div><div class='col-md-6 col-xs-6 text-right'>" + dsTracking.Tables[2].Rows[k].ItemArray[7].ToString() + "</div>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'>Transport Fee </div><div class='col-md-6 col-xs-6 text-right'> " + dsTracking.Tables[2].Rows[k].ItemArray[8].ToString() + "</div>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'><strong>Total Amount</strong></div><div class='col-md-6 col-xs-6 text-right'><strong>" + dsTracking.Tables[2].Rows[k].ItemArray[18].ToString() + "</strong></div>";
                                    strproc = strproc + " </div></div></div></div></div></div>";

                                    k++;
                                    j++;
                                }
                            }
                            accordion.InnerHtml = strproc.ToString();
                        }
                        else
                        {
                            string strnocookies = "";
                            strnocookies = strnocookies + " <div class='tracking-box panel' style='border:none;'>";
                            strnocookies = strnocookies + " <img class='img-circle img-responsive' style='padding-top: 10px;' src='images/Login-Track.png' alt='' />";
                            strnocookies = strnocookies + " <h4 style='padding-bottom:10px;text-align:center' >YOU ARE NOT LOGGED IN CURRENTLY</h4>";
                            strnocookies = strnocookies + " <p style='text-align:center'>Please login to see your booking history </p>";
  // strnocookies = strnocookies + " <p style='text-align:center; color:#ee846a;'><a style='color:#ee846a;cursor:pointer;' onClick='sendlink()'>Click Here<a></p>";

 strnocookies = strnocookies + "<p style='text-align:center; color:#ee846a;'><a href='#' id='toploginlink' data-toggle='modal' data-target='#login' >Click Here</a></p>";





                            strnocookies = strnocookies + " </div>";
                            accordion.InnerHtml = strnocookies.ToString();
                        }

                    }
                    else
                    {
                        string strnocookies1 = "";
                        strnocookies1 = strnocookies1 + " <div class='tracking-box panel text-center' style='padding-bottom:10px;''>";
                        strnocookies1 = strnocookies1 + " <h4>Incorrect Taskid</h4>";
                        strnocookies1 = strnocookies1 + " <p>Please login to see your booking history </p>";
                        strnocookies1 = strnocookies1 + " <input type='button' class='form-control' style='width:25%;background-color:#ee846a;color:#fff;margin-left: 38%;padding:2px; ' value='Login' onclick='sendlink()' />";
                        strnocookies1 = strnocookies1 + " </div>";
                        divright.InnerHtml = strnocookies1.ToString();
                        divright.Style.Add("padding-top", "5%");
                        string strnocookies = "";
                        strnocookies = strnocookies + " <div class='tracking-box panel' style='border:none;'>";
                        strnocookies = strnocookies + " <img class='img-circle img-responsive' style='padding-top: 10px;' src='images/Login-Track.png' alt='' />";
                        strnocookies = strnocookies + " <h4 style='padding-bottom:10px;text-align:center' >YOU ARE NOT LOGGED IN CURRENTLY</h4>";
                        strnocookies = strnocookies + " <p style='text-align:center'>Please login to see your booking history </p>";
                        strnocookies = strnocookies + " <p style='text-align:center; color:#ee846a;'><a style='color:#ee846a;cursor:pointer;' onClick='sendlink()'>Click Here<a></p>";
                        strnocookies = strnocookies + " </div>";
                        accordion.InnerHtml = strnocookies.ToString();
                        // Response.Write("<script>alert('Invalid TaskId...');</script>");

                    }
                }
            }
            else
            {
                string strnocookies1 = "";
                strnocookies1 = strnocookies1 + " <div class='tracking-box panel text-center' style='padding-bottom:10px;border:none;''>";
                strnocookies1 = strnocookies1 + " <h4>Incorrect Taskid</h4>";
                strnocookies1 = strnocookies1 + " <p>Please login to see your booking history </p>";
                strnocookies1 = strnocookies1 + " <input type='button' class='form-control' style='width:25%;background-color:#ee846a;color:#fff;margin-left: 38%;padding:2px; ' value='Login' onclick='sendlink()' />";
                strnocookies1 = strnocookies1 + " </div>";
               divright.InnerHtml = strnocookies1.ToString();
                divright.Style.Add("padding-top", "5%");
                string strnocookies = "";
                strnocookies = strnocookies + " <div class='tracking-box panel' style='border:none;'>";
                strnocookies = strnocookies + " <img class='img-circle img-responsive' style='padding-top: 10px;' src='images/Login-Track.png' alt='' />";
                strnocookies = strnocookies + " <h4 style='padding-bottom:10px;text-align:center' >YOU ARE NOT LOGGED IN CURRENTLY</h4>";
                strnocookies = strnocookies + " <p style='text-align:center'>Please login to see your booking history </p>";
  //strnocookies = strnocookies + " <p style='text-align:center;color:#ee846a; '><a style='color:#ee846a;cursor:pointer;' onClick='sendlink()'>Click Here<a></p>";
 strnocookies = strnocookies + " <p style='text-align:center; color:#ee846a;'><a href='#' id='toploginlink' data-toggle='modal' data-target='#login' >Click Here</a></p>";
                strnocookies = strnocookies + " </div>";
                accordion.InnerHtml = strnocookies.ToString();
                //Response.Write("<script>alert('Invalid TaskId...');</script>");
            }
            //



        }

    }
}