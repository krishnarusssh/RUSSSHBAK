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
public partial class MyDeliveries_T_Default : System.Web.UI.Page
{
    CrmClass ObjCrm = new CrmClass();
    CrmClass crmObj = new CrmClass();
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





if(Session["CLIENT_ID"].ToString()=="15532")
{
  Response.Redirect("../OrdersP");
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
                //profilename2.InnerHtml = Session["CLIENT_NAME"].ToString();

                if (PLT_FORM == "M")
                {


                }
                else
                {


                    if (PLT_FORM == "F")
                    {

                        profileimg.InnerHtml = "<img src=" + "'https://graph.facebook.com/" + APPID + "/picture'" + "  style='border-radius:50%; border: 3px solid #CCC;'draggable='false' /> ";
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

                        profileimg.InnerHtml = "<img src='" + stuff.entry.gphoto_thumbnail._t + "' style='border-radius:50%; border: 3px solid #CCC;'  draggable='false'/> ";


                    }


                    ProfileName1.InnerHtml = Session["CLIENT_NAME"].ToString();
                    // profilename2.InnerHtml = Session["CLIENT_NAME"].ToString();
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
            else
            {
                int.TryParse(Request.QueryString["TaskID"], out Taskid);
                // Response.Redirect("../Signin/");
            }
if (Session != null)
            {
                if (Session["CLIENT_ID"] == null || Session["CLIENT_ID"] == "")
                {
                    Response.Redirect("../");
                }

            }
            DataSet dsTracking1 = ObjCrm.GetTrackingdetails(Convert.ToInt32(Session["CLIENT_ID"].ToString()), Taskid);
            if (dsTracking1.Tables.Count > 0)
            {
                if (dsTracking1.Tables[0].Rows.Count > 0)
                {

                    int status = 0;
                    status = Convert.ToInt32(dsTracking1.Tables[0].Rows[0].ItemArray[9].ToString());
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
                        ptime.InnerText = dsTracking1.Tables[0].Rows[0].ItemArray[16].ToString();
                        dtime.InnerText = dsTracking1.Tables[0].Rows[0].ItemArray[17].ToString();
                    }


                    tcat.InnerText = dsTracking1.Tables[0].Rows[0].ItemArray[3].ToString();
                    ttotal.InnerText = dsTracking1.Tables[0].Rows[0].ItemArray[18].ToString();
                    ename.InnerText = dsTracking1.Tables[0].Rows[0].ItemArray[12].ToString();
                    emobile.InnerText = dsTracking1.Tables[0].Rows[0].ItemArray[13].ToString();
                    emobile.InnerText = "+91 8080808315";
                    btime.InnerText = dsTracking1.Tables[0].Rows[0].ItemArray[10].ToString();
                    ctime.InnerText = dsTracking1.Tables[0].Rows[0].ItemArray[11].ToString();
                    padd.InnerText = dsTracking1.Tables[0].Rows[0].ItemArray[14].ToString();
                    dadd.InnerText = dsTracking1.Tables[0].Rows[0].ItemArray[15].ToString();


                    Htime.InnerText = dsTracking1.Tables[0].Rows[0].ItemArray[20].ToString();
                    txtSource.Value = dsTracking1.Tables[0].Rows[0].ItemArray[21].ToString();
                    txtDestination.Value = dsTracking1.Tables[0].Rows[0].ItemArray[22].ToString();
                    lblday.InnerText = dsTracking1.Tables[0].Rows[0].ItemArray[23].ToString();
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "myJsFn", "SearchRoute()", true);
                    if (dsTracking1.Tables[0].Rows[0].ItemArray[12].ToString() == " ")
                    {
                        confirm.Style.Add("opacity", "0.3");
                        divconf.Attributes.Add("Class", "task-circleof");
                    }
                    if (Clientid != 0)
                    {
                        int i = 0;
                        string strproc = "";
                        if (dsTracking1.Tables[1].Rows.Count > 0)
                        {
                            foreach (DataRow dr in dsTracking1.Tables[1].Rows)
                            {

                                strproc = strproc + " <div class='tracking-box panel'>";
                                if (i + 1 == 1)
                                {
                                    strproc = strproc + " <h4 data-toggle='collapse' class='accordion-toggle' data-parent='#accordion' href='#" + (i + 1) + "'>&nbsp; <span>Tracking Id: " + dsTracking1.Tables[1].Rows[i].ItemArray[0].ToString() + "</span></h4> <a class='track_link' href='https://www.russsh.com/Orders/default.aspx?TaskID=" + dsTracking1.Tables[1].Rows[i].ItemArray[0].ToString() + "'> Track</a>";
                                    strproc = strproc + " <div style='padding-top:10px;' class='row collapse in' id='" + (i + 1) + "'>";
                                }
                                else
                                {
                                    strproc = strproc + " <h4 data-toggle='collapse' class='accordion-toggle collapsed' data-parent='#accordion' href='#" + (i + 1) + "'>&nbsp; <span>Tracking Id: " + dsTracking1.Tables[1].Rows[i].ItemArray[0].ToString() + "</span></h4> <a class='track_link' href='https://www.russsh.com/Orders/default.aspx?TaskID=" + dsTracking1.Tables[1].Rows[i].ItemArray[0].ToString() + "'> Track</a>";
                                    strproc = strproc + " <div style='padding-top:10px;' class='row collapse' id='" + (i + 1) + "'>";
                                }

                                strproc = strproc + " <div class='col-md-8'>";
                                strproc = strproc + " <p>" + dsTracking1.Tables[1].Rows[i].ItemArray[2].ToString() + " <br />";
                                strproc = strproc + dsTracking1.Tables[1].Rows[i].ItemArray[20].ToString() + "  <br />";
                                strproc = strproc + " Cake Delivery</p>";
                                strproc = strproc + " </div>";
                                strproc = strproc + " <div class='col-md-4'><strong ><i class='fa fa-rupee' style='margin-left: 14px;' ></i>" + dsTracking1.Tables[1].Rows[i].ItemArray[18].ToString() + "/-</strong>";

                                if (Convert.ToInt32(dsTracking1.Tables[1].Rows[i].ItemArray[9].ToString()) == 0)
                                {
                                    strproc = strproc + " <p><span class='track-badge'>BOOKED</span></p>";
                                }
                                if (Convert.ToInt32(dsTracking1.Tables[1].Rows[i].ItemArray[9].ToString()) == 1)
                                {
                                    strproc = strproc + " <p><span class='track-badge'>INPROCESS</span></p>";
                                }
                                strproc = strproc + " </div>";
                                strproc = strproc + " <div class='col-md-12 col-xs-12 p-bt10 order-drop'>";
                                strproc = strproc + " <span class='expand track-gbtn' id='#exp-" + i + "'>Order Details <i class='plus'></i> </span> &nbsp;<span class='track-gbtn' data-toggle='modal' data-target='#cancel" + i + "'>Cancel Delivery</span>";
                                strproc = strproc + " <div class='expandable' id='expandable-" + i + "' >";
                                strproc = strproc + " <div class='order-over'>";
                                strproc = strproc + " <div class='row'>";
                                strproc = strproc + " <div class='col-md-6 col-xs-6'>Task Mode</div><div class='col-md-6 col-xs-6 text-right'> " + dsTracking1.Tables[1].Rows[i].ItemArray[4].ToString() + "</div>";
                                strproc = strproc + " <div class='col-md-6 col-xs-6'>Service Fee</div><div class='col-md-6 col-xs-6 text-right'> " + dsTracking1.Tables[1].Rows[i].ItemArray[5].ToString() + "</div>";
                                strproc = strproc + " <div class='col-md-6 col-xs-6'>Excess Baggage</div><div class='col-md-6 col-xs-6 text-right'>" + dsTracking1.Tables[1].Rows[i].ItemArray[6].ToString() + "</div>";
                                strproc = strproc + " <div class='col-md-6 col-xs-6'>Waiting Fee </div><div class='col-md-6 col-xs-6 text-right'>" + dsTracking1.Tables[1].Rows[i].ItemArray[7].ToString() + "</div>";
                                strproc = strproc + " <div class='col-md-6 col-xs-6'>Transport Fee </div><div class='col-md-6 col-xs-6 text-right'> " + dsTracking1.Tables[1].Rows[i].ItemArray[8].ToString() + "</div>";
                                strproc = strproc + " </div>";
                                strproc = strproc + "<div class='row total-line'>";
                                strproc = strproc + " <div class='col-md-6 col-xs-6'><strong>Total Amount</strong></div><div class='col-md-6 col-xs-6 text-right'><strong>" + dsTracking1.Tables[1].Rows[i].ItemArray[18].ToString() + "</strong></div>";
                                strproc = strproc + " </div></div>";
                                strproc = strproc + " </div></div></div></div>";


                                strproc = strproc + "<div class='modal fade' id='cancel" + i + "' tabindex='-1' role='dialog' aria-labelledby='pricing' aria-hidden='true'>";
                                strproc = strproc + "<div class='modal-dialog cancel-box'>";
                                strproc = strproc + "<div class='modal-content'>";
                                strproc = strproc + "<div class='modal-body'>";
                                strproc = strproc + "<div class='row'>";
                                strproc = strproc + "<a class='close-cancel' data-dismiss='modal'><img src='../img/close-icon.svg' height='15' width='14' alt='' /></a>";
                                strproc = strproc + "<div class='col-md-12'>";
                                strproc = strproc + "<div class='cancel-body'>";
                                strproc = strproc + "<h4>ARE YOU SURE YOU WANT TO CANCEL?</h4>";
                                strproc = strproc + "<p>If you cancel a task within 2 hrs of the scheduled pick-up time, A cancellation fee of Rs. 100/- will be charged.</p>";
                                strproc = strproc + "<div class='cancel-bottom'><div class='pull-right'><a href='#' data-toggle='modal' data-target='#reason" + i + "'>YES</a> <a href='#' data-dismiss='modal'>NO</a>";
                                strproc = strproc + "</div></div></div></div></div></div></div></div></div>";

                                strproc = strproc + "<div class='modal fade' id='reason" + i + "' tabindex='-1' role='dialog' aria-hidden='true'>";
                                strproc = strproc + "<div class='modal-dialog reason-pop'>";
                                strproc = strproc + "<div class='modal-content'>";
                                strproc = strproc + "<div class='modal-body'>";
                                strproc = strproc + "<div class='row'>";
                                strproc = strproc + "<a class='close-cancel' data-dismiss='modal'><img src='../img/close-icon.svg' height='15' width='14' alt='' /></a>";
                                strproc = strproc + "<div class='col-md-12'>";
                                strproc = strproc + "<div class='cancel-body'>";
                                strproc = strproc + "<h4>Why did you cancel?</h4>";
                                strproc = strproc + "<p class='md'>Let us know we can improve? </p>";
                                strproc = strproc + "<hr class='thin-line' />";

                                strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking1.Tables[1].Rows[i].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@1" + "'" + ")><a href='#'>Service fee is too expensive</a></div>";
                                strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking1.Tables[1].Rows[i].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@2" + "'" + ")><a href='#'>Pick up was delayed</a></div>";
                                strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking1.Tables[1].Rows[i].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@3" + "'" + ")><a href='#'>Person at pick up location is not available</a></div>";
                                strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking1.Tables[1].Rows[i].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@4" + "'" + ")><a href='#'>Person at delivery point is not available</a></div>";
                                strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking1.Tables[1].Rows[i].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@5" + "'" + ")><a href='#'>The parcel is not available</a></div>";
                                strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking1.Tables[1].Rows[i].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@6" + "'" + ")><a href='#'>Need to change pick up or drop location</a></div>";
                                strproc = strproc + "<div class='reason-box'><a href='#' id='feedback_trigger'>My reason is not listed?</a></div>";
                                strproc = strproc + "</div></div>";
                                strproc = strproc + "<div class='col-md-12'>";
                                strproc = strproc + "<div id='feedback_body'>";
                                strproc = strproc + "<div id='feedback_body_box'>";
                                strproc = strproc + "<div id='feedback_div' class='own_fdk'>";
                                strproc = strproc + "<a class='close-cancel' id='feedback_close'><img src='../img/close-icon.svg' height='15' width='14' alt='' /></a>";
                                strproc = strproc + "<h4>Write your own reason</h4>";
                                strproc = strproc + "<p>Let us know we can improve? </p>";
                                strproc = strproc + "<hr class='thin-line'/>";
                                strproc = strproc + "<input type='text' class='form-control' id='txtSub' name='Subject' placeholder='Subject'>";
                                strproc = strproc + "<textarea class='form-control' rows='6' id='txtcomm' placeholder='Write your own text'></textarea>";
                                strproc = strproc + "<button class='btn btn_feedback' onclick=confirmation1(" + "'" + dsTracking1.Tables[1].Rows[i].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@7" + "'" + ")>SEND FEEDBACK</button>";
                                strproc = strproc + "</div></div></div></div></div></div></div></div></div>";

                                // strproc = strproc + " </div></div></div></div></div></div>";
                                i++;
                            }
                        }
                       
                        strproc = strproc + "<h5 class='past-title'>PAST DELIVERY</h5>";
                        strproc = strproc + "<div class='scroll_bar' style='max-height: 230px;overflow: hidden;overflow-y: auto;padding-top: 2px;padding-bottom:2px;'>";
                        strproc = strproc + "<div id='accordion2'>";
                        int j = i + 2;
                        i = 0;
                        int k = 0;
                        if (dsTracking1.Tables[2].Rows.Count > 0)
                        {
                            foreach (DataRow dr in dsTracking1.Tables[2].Rows)
                            {
                                strproc = strproc + " <div class='tracking-box panel'>";
                                strproc = strproc + " <h4 data-toggle='collapse' class='accordion-toggle collapsed' data-parent='#accordion2' href='#" + j + "'>&nbsp; <span>Tracking Id: " + dsTracking1.Tables[2].Rows[k].ItemArray[0].ToString() + "</span></h4> <a class='track_link' href='https://www.russsh.com/Orders/default.aspx?TaskID=" + dsTracking1.Tables[2].Rows[k].ItemArray[0].ToString() + "'> Track</a>";
                                strproc = strproc + " <div style='padding-top:10px;' class='row collapse' id='" + j + "'>";
                                strproc = strproc + " <div class='col-md-8'>";
                                strproc = strproc + " <p>" + dsTracking1.Tables[2].Rows[k].ItemArray[2].ToString() + " <br />";
                                strproc = strproc + dsTracking1.Tables[2].Rows[k].ItemArray[20].ToString() + "  <br />";
                                strproc = strproc + " Cake Delivery</p>";
                                strproc = strproc + " </div>";

                                strproc = strproc + " <div class='col-md-4'><strong   ><i class='fa fa-rupee' style='margin-left: 14px;' ></i>" + dsTracking1.Tables[2].Rows[k].ItemArray[18].ToString() + "/-</strong>";

                                strproc = strproc + " <p><span class='track-badge-done'>COMPLETED</span></p>";
                                strproc = strproc + " </div>";
                                strproc = strproc + " <div class='col-md-12 col-xs-12 p-bt10 order-drop'>";
                                strproc = strproc + " <span class='expand track-gbtn' id='#exp-" + j + "'>Order Details <i class='plus'></i></span> ";
                                //strproc = strproc + " </span> &nbsp;<span class='track-gbtn' data-toggle='modal' data-target='#cancel" + j + "'>Cancel Delivery</span>";
                                //strproc = strproc + "  &nbsp;<span class='track-gbtn'><b> <a href='https://www.russsh.com/Orders/default.aspx?TaskID=" + dsTracking1.Tables[2].Rows[k].ItemArray[0].ToString() + "'> Track</a></b> </span>";
                                strproc = strproc + " <div class='expandable' id='expandable-" + j + "' >";
                                strproc = strproc + " <div class='order-over'>";
                                strproc = strproc + " <div class='row'>";
                                strproc = strproc + " <div class='col-md-6 col-xs-6'>Task Mode</div><div class='col-md-6 col-xs-6 text-right'> " + dsTracking1.Tables[2].Rows[k].ItemArray[4].ToString() + "</div>";
                                strproc = strproc + " <div class='col-md-6 col-xs-6'>Service Fee</div><div class='col-md-6 col-xs-6 text-right'> " + dsTracking1.Tables[2].Rows[k].ItemArray[5].ToString() + "</div>";
                                strproc = strproc + " <div class='col-md-6 col-xs-6'>Excess Baggage</div><div class='col-md-6 col-xs-6 text-right'>" + dsTracking1.Tables[2].Rows[k].ItemArray[6].ToString() + "</div>";
                                strproc = strproc + " <div class='col-md-6 col-xs-6'>Waiting Fee </div><div class='col-md-6 col-xs-6 text-right'>" + dsTracking1.Tables[2].Rows[k].ItemArray[7].ToString() + "</div>";
                                strproc = strproc + " <div class='col-md-6 col-xs-6'>Transport Fee </div><div class='col-md-6 col-xs-6 text-right'> " + dsTracking1.Tables[2].Rows[k].ItemArray[8].ToString() + "</div>";
                                strproc = strproc + " </div>";
                                strproc = strproc + "<div class='row total-line'>";
                                strproc = strproc + " <div class='col-md-6 col-xs-6'><strong>Total Amount</strong></div><div class='col-md-6 col-xs-6 text-right'><strong>" + dsTracking1.Tables[2].Rows[k].ItemArray[18].ToString() + "</strong></div>";
                                strproc = strproc + " </div></div>";
                                strproc = strproc + " </div></div></div></div>";


                                strproc = strproc + "<div class='modal fade' id='cancel" + j + "' tabindex='-1' role='dialog' aria-labelledby='pricing' aria-hidden='true'>";
                                strproc = strproc + "<div class='modal-dialog cancel-box'>";
                                strproc = strproc + "<div class='modal-content'>";
                                strproc = strproc + "<div class='modal-body'>";
                                strproc = strproc + "<div class='row'>";
                                strproc = strproc + "<a class='close-cancel' data-dismiss='modal'><img src='../img/close-icon.svg' height='15' width='14' alt='' /></a>";
                                strproc = strproc + "<div class='col-md-12'>";
                                strproc = strproc + "<div class='cancel-body'>";
                                strproc = strproc + "<h4>ARE YOU SURE YOU WANT TO CANCEL?</h4>";
                                strproc = strproc + "<p>If you cancel a task within 2 hrs of the scheduled pick-up time, A cancellation fee of Rs. 100/- will be charged.</p>";
                                strproc = strproc + "<div class='cancel-bottom'><div class='pull-right'><a href='#' data-toggle='modal' data-target='#reason" + j + "'>YES</a> <a href='#' data-dismiss='modal'>NO</a>";
                                strproc = strproc + "</div></div></div></div></div></div></div></div></div>";

                                strproc = strproc + "<div class='modal fade' id='reason" + j + "' tabindex='-1' role='dialog' aria-hidden='true'>";
                                strproc = strproc + "<div class='modal-dialog reason-pop'>";
                                strproc = strproc + "<div class='modal-content'>";
                                strproc = strproc + "<div class='modal-body'>";
                                strproc = strproc + "<div class='row'>";
                                strproc = strproc + "<a class='close-cancel' data-dismiss='modal'><img src='../img/close-icon.svg' height='15' width='14' alt='' /></a>";
                                strproc = strproc + "<div class='col-md-12'>";
                                strproc = strproc + "<div class='cancel-body'>";
                                strproc = strproc + "<h4>Why did you cancel?</h4>";
                                strproc = strproc + "<p class='md'>Let us know we can improve? </p>";
                                strproc = strproc + "<hr class='thin-line' />";
                                strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking1.Tables[2].Rows[k].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@1" + "'" + ")><a href='#'>Service fee is too expensive</a></div>";
                                strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking1.Tables[2].Rows[k].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@2" + "'" + ")><a href='#'>Pick up was delayed</a></div>";
                                strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking1.Tables[2].Rows[k].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@3" + "'" + ")><a href='#'>Person at pick up location is not available</a></div>";
                                strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking1.Tables[2].Rows[k].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@4" + "'" + ")><a href='#'>Person at delivery point is not available</a></div>";
                                strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking1.Tables[2].Rows[k].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@5" + "'" + ")><a href='#'>The parcel is not available</a></div>";
                                strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking1.Tables[2].Rows[k].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@6" + "'" + ")><a href='#'>Need to change pick up or drop location</a></div>";
                                strproc = strproc + "<div class='reason-box'><a href='#' id='feedback_trigger'>My reason is not listed?</a></div>";
                                strproc = strproc + "</div></div>";
                                strproc = strproc + "<div class='col-md-12'>";
                                strproc = strproc + "<div id='feedback_body'>";
                                strproc = strproc + "<div id='feedback_body_box'>";
                                strproc = strproc + "<div id='feedback_div' class='own_fdk'>";
                                strproc = strproc + "<a class='close-cancel' id='feedback_close'><img src='../img/close-icon.svg' height='15' width='14' alt='' /></a>";
                                strproc = strproc + "<h4>Write your own reason</h4>";
                                strproc = strproc + "<p>Let us know we can improve? </p>";
                                strproc = strproc + "<hr class='thin-line'/>";
                                strproc = strproc + "<input type='text' class='form-control' id='txtSub' name='Subject' placeholder='Subject'>";
                                strproc = strproc + "<textarea class='form-control' id='txtcomm' rows='6' placeholder='Write your own text'></textarea>";
                                strproc = strproc + "<button class='btn btn_feedback' onclick=confirmation1(" + "'" + dsTracking1.Tables[2].Rows[k].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@7" + "'" + ")>SEND FEEDBACK</button>";
                                strproc = strproc + "</div></div></div></div></div></div></div></div></div>";


                                k++;
                                j++;
                            }
                        }
                        strproc = strproc + "</div></div>";
                        accordion.InnerHtml = strproc.ToString();
                    }
                }

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
                        emobile.InnerText = "+91 8080808315";
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
                                        strproc = strproc + " <h4 data-toggle='collapse' class='accordion-toggle' data-parent='#accordion' href='#" + (i + 1) + "'>&nbsp; <span>Tracking Id: " + dsTracking.Tables[1].Rows[i].ItemArray[0].ToString() + "</span></h4> <a class='track_link' href='https://www.russsh.com/Orders/default.aspx?TaskID=" + dsTracking.Tables[1].Rows[i].ItemArray[0].ToString() + "'> Track</a>";
                                        strproc = strproc + " <div style='padding-top:10px;' class='row collapse in' id='" + (i + 1) + "'>";
                                    }
                                    else
                                    {
                                        strproc = strproc + " <h4 data-toggle='collapse' class='accordion-toggle collapsed' data-parent='#accordion' href='#" + (i + 1) + "'>&nbsp; <span>Tracking Id: " + dsTracking.Tables[1].Rows[i].ItemArray[0].ToString() + "</span></h4> <a class='track_link' href='https://www.russsh.com/Orders/default.aspx?TaskID=" + dsTracking.Tables[1].Rows[i].ItemArray[0].ToString() + "'> Track</a>";
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
                                    strproc = strproc + " <span class='expand track-gbtn' id='#exp-" + i + "'>Order Details <i class='plus'></i></span> &nbsp;<span class='track-gbtn' data-toggle='modal' data-target='#cancel" + i + "'>Cancel Delivery</span> ";
                                    //strproc = strproc + " </span> &nbsp;<span class='track-gbtn'><b> <a href='https://www.russsh.com/Orders/default.aspx?TaskID=" + dsTracking.Tables[1].Rows[i].ItemArray[0].ToString() + "'> Track</a></b> </span>";
                                    strproc = strproc + " <div class='expandable' id='expandable-" + i + "' >";
                                    strproc = strproc + " <div class='order-over'>";
                                    strproc = strproc + " <div class='row'>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'>Task Mode</div><div class='col-md-6 col-xs-6 text-right'> " + dsTracking.Tables[1].Rows[i].ItemArray[4].ToString() + "</div>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'>Service Fee</div><div class='col-md-6 col-xs-6 text-right'> " + dsTracking.Tables[1].Rows[i].ItemArray[5].ToString() + "</div>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'>Excess Baggage</div><div class='col-md-6 col-xs-6 text-right'>" + dsTracking.Tables[1].Rows[i].ItemArray[6].ToString() + "</div>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'>Waiting Fee </div><div class='col-md-6 col-xs-6 text-right'>" + dsTracking.Tables[1].Rows[i].ItemArray[7].ToString() + "</div>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'>Transport Fee </div><div class='col-md-6 col-xs-6 text-right'> " + dsTracking.Tables[1].Rows[i].ItemArray[8].ToString() + "</div>";
                                    strproc = strproc + " </div>";
                                    strproc = strproc + "<div class='row total-line'>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'><strong>Total Amount</strong></div><div class='col-md-6 col-xs-6 text-right'><strong>" + dsTracking.Tables[1].Rows[i].ItemArray[18].ToString() + "</strong></div>";
                                    strproc = strproc + " </div></div>";
                                    strproc = strproc + " </div></div></div></div>";


                                    strproc = strproc + "<div class='modal fade' id='cancel" + i + "' tabindex='-1' role='dialog' aria-labelledby='pricing' aria-hidden='true'>";
                                    strproc = strproc + "<div class='modal-dialog cancel-box'>";
                                    strproc = strproc + "<div class='modal-content'>";
                                    strproc = strproc + "<div class='modal-body'>";
                                    strproc = strproc + "<div class='row'>";
                                    strproc = strproc + "<a class='close-cancel' data-dismiss='modal'><img src='../img/close-icon.svg' height='15' width='14' alt='' /></a>";
                                    strproc = strproc + "<div class='col-md-12'>";
                                    strproc = strproc + "<div class='cancel-body'>";
                                    strproc = strproc + "<h4>ARE YOU SURE YOU WANT TO CANCEL?</h4>";
                                    strproc = strproc + "<p>If you cancel a task within 2 hrs of the scheduled pick-up time, A cancellation fee of Rs. 100/- will be charged.</p>";
                                    strproc = strproc + "<div class='cancel-bottom'><div class='pull-right'><a href='#' data-toggle='modal' data-target='#reason" + i + "'>YES</a> <a href='#' data-dismiss='modal'>NO</a>";
                                    strproc = strproc + "</div></div></div></div></div></div></div></div></div>";

                                    strproc = strproc + "<div class='modal fade' id='reason" + i + "' tabindex='-1' role='dialog' aria-hidden='true'>";
                                    strproc = strproc + "<div class='modal-dialog reason-pop'>";
                                    strproc = strproc + "<div class='modal-content'>";
                                    strproc = strproc + "<div class='modal-body'>";
                                    strproc = strproc + "<div class='row'>";
                                    strproc = strproc + "<a class='close-cancel' data-dismiss='modal'><img src='../img/close-icon.svg' height='15' width='14' alt='' /></a>";
                                    strproc = strproc + "<div class='col-md-12'>";
                                    strproc = strproc + "<div class='cancel-body'>";
                                    strproc = strproc + "<h4>Why did you cancel?</h4>";
                                    strproc = strproc + "<p class='md'>Let us know we can improve? </p>";
                                    strproc = strproc + "<hr class='thin-line' />";
                                    strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking.Tables[1].Rows[i].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@1" + "'" + ")><a href='#'>Service fee is too expensive</a></div>";
                                    strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking.Tables[1].Rows[i].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@2" + "'" + ")><a href='#'>Pick up was delayed</a></div>";
                                    strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking.Tables[1].Rows[i].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@3" + "'" + ")><a href='#'>Person at pick up location is not available</a></div>";
                                    strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking.Tables[1].Rows[i].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@4" + "'" + ")><a href='#'>Person at delivery point is not available</a></div>";
                                    strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking.Tables[1].Rows[i].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@5" + "'" + ")><a href='#'>The parcel is not available</a></div>";
                                    strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking.Tables[1].Rows[i].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@6" + "'" + ")><a href='#'>Need to change pick up or drop location</a></div>";
                                    strproc = strproc + "<div class='reason-box'><a href='#' id='feedback_trigger'>My reason is not listed?</a></div>";
                                    strproc = strproc + "</div></div>";
                                    strproc = strproc + "<div class='col-md-12'>";
                                    strproc = strproc + "<div id='feedback_body'>";
                                    strproc = strproc + "<div id='feedback_body_box'>";
                                    strproc = strproc + "<div id='feedback_div' class='own_fdk'>";
                                    strproc = strproc + "<a class='close-cancel' id='feedback_close'><img src='../img/close-icon.svg' height='15' width='14' alt='' /></a>";
                                    strproc = strproc + "<h4>Write your own reason</h4>";
                                    strproc = strproc + "<p>Let us know we can improve? </p>";
                                    strproc = strproc + "<hr class='thin-line'/>";
                                    strproc = strproc + "<input type='text' class='form-control' id='txtSub' name='Subject' placeholder='Subject'>";
                                    strproc = strproc + "<textarea class='form-control' id='txtcomm' rows='6' placeholder='Write your own text'></textarea>";
                                    strproc = strproc + "<button class='btn btn_feedback' onclick=confirmation1(" + "'" + dsTracking.Tables[1].Rows[i].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@7" + "'" + ")>SEND FEEDBACK</button>";
                                    strproc = strproc + "</div></div></div></div></div></div></div></div></div>";

                                    // strproc = strproc + " </div></div></div></div></div></div>";
                                    i++;
                                }
                            }
                            
                            strproc = strproc + "<h5 class='past-title'>PAST DELIVERY</h5>";
                            strproc = strproc + "<div class='scroll_bar' style='max-height: 230px;overflow: hidden;overflow-y: auto;padding-top: 2px;padding-bottom:2px;'>";
                            strproc = strproc + "<div id='accordion2'>";
                            int j = i + 2;
                            i = 0;
                            int k = 0;
                            if (dsTracking.Tables[2].Rows.Count > 0)
                            {
                                foreach (DataRow dr in dsTracking.Tables[2].Rows)
                                {
                                    strproc = strproc + " <div class='tracking-box panel' >";
                                    strproc = strproc + " <h4 data-toggle='collapse' class='accordion-toggle collapsed' data-parent='#accordion2' href='#" + j + "'>&nbsp; <span>Tracking Id: " + dsTracking.Tables[2].Rows[k].ItemArray[0].ToString() + "</span></h4> <a class='track_link' href='https://www.russsh.com/Orders/default.aspx?TaskID=" + dsTracking.Tables[2].Rows[k].ItemArray[0].ToString() + "'> Track</a>";
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
                                    strproc = strproc + " <span class='expand track-gbtn' href='#exp-" + j + "'>Order Details <i class='plus'></i></span>";
                                   // strproc = strproc + " </span> &nbsp;<span class='track-gbtn'><b> <a href='https://www.russsh.com/Orders/default.aspx?TaskID=" + dsTracking.Tables[2].Rows[k].ItemArray[0].ToString() + "'> Track</a></b> </span>";
                                    strproc = strproc + " <div class='expandable' id='expandable-" + j + "' >";
                                    strproc = strproc + " <div class='order-over'>";
                                    strproc = strproc + " <div class='row'>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'>Task Mode</div><div class='col-md-6 col-xs-6 text-right'> " + dsTracking.Tables[2].Rows[k].ItemArray[4].ToString() + "</div>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'>Service Fee</div><div class='col-md-6 col-xs-6 text-right'> " + dsTracking.Tables[2].Rows[k].ItemArray[5].ToString() + "</div>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'>Excess Baggage</div><div class='col-md-6 col-xs-6 text-right'>" + dsTracking.Tables[2].Rows[k].ItemArray[6].ToString() + "</div>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'>Waiting Fee </div><div class='col-md-6 col-xs-6 text-right'>" + dsTracking.Tables[2].Rows[k].ItemArray[7].ToString() + "</div>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'>Transport Fee </div><div class='col-md-6 col-xs-6 text-right'> " + dsTracking.Tables[2].Rows[k].ItemArray[8].ToString() + "</div>";
                                    strproc = strproc + " </div>";
                                    strproc = strproc + "<div class='row total-line'>";
                                    strproc = strproc + " <div class='col-md-6 col-xs-6'><strong>Total Amount</strong></div><div class='col-md-6 col-xs-6 text-right'><strong>" + dsTracking.Tables[2].Rows[k].ItemArray[18].ToString() + "</strong></div>";
                                    strproc = strproc + " </div></div>";
                                    strproc = strproc + " </div></div></div></div>";


                                    strproc = strproc + "<div class='modal fade' id='cancel" + j + "' tabindex='-1' role='dialog' aria-labelledby='pricing' aria-hidden='true'>";
                                    strproc = strproc + "<div class='modal-dialog cancel-box'>";
                                    strproc = strproc + "<div class='modal-content'>";
                                    strproc = strproc + "<div class='modal-body'>";
                                    strproc = strproc + "<div class='row'>";
                                    strproc = strproc + "<a class='close-cancel' data-dismiss='modal'><img src='../img/close-icon.svg' height='15' width='14' alt='' /></a>";
                                    strproc = strproc + "<div class='col-md-12'>";
                                    strproc = strproc + "<div class='cancel-body'>";
                                    strproc = strproc + "<h4>ARE YOU SURE YOU WANT TO CANCEL?</h4>";
                                    strproc = strproc + "<p>If you cancel a task within 2 hrs of the scheduled pick-up time, A cancellation fee of Rs. 100/- will be charged.</p>";
                                    strproc = strproc + "<div class='cancel-bottom'><div class='pull-right'><a href='#' data-toggle='modal' data-target='#reason" + j + "'>YES</a> <a href='#' data-dismiss='modal'>NO</a>";
                                    strproc = strproc + "</div></div></div></div></div></div></div></div></div>";

                                    strproc = strproc + "<div class='modal fade' id='reason" + j + "' tabindex='-1' role='dialog' aria-hidden='true'>";
                                    strproc = strproc + "<div class='modal-dialog reason-pop'>";
                                    strproc = strproc + "<div class='modal-content'>";
                                    strproc = strproc + "<div class='modal-body'>";
                                    strproc = strproc + "<div class='row'>";
                                    strproc = strproc + "<a class='close-cancel' data-dismiss='modal'><img src='../img/close-icon.svg' height='15' width='14' alt='' /></a>";
                                    strproc = strproc + "<div class='col-md-12'>";
                                    strproc = strproc + "<div class='cancel-body'>";
                                    strproc = strproc + "<h4>Why did you cancel?</h4>";
                                    strproc = strproc + "<p class='md'>Let us know we can improve? </p>";
                                    strproc = strproc + "<hr class='thin-line' />";
                                    strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking.Tables[2].Rows[k].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@1" + "'" + ")><a href='#'>Service fee is too expensive</a></div>";
                                    strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking.Tables[2].Rows[k].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@2" + "'" + ")><a href='#'>Pick up was delayed</a></div>";
                                    strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking.Tables[2].Rows[k].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@3" + "'" + ")><a href='#'>Person at pick up location is not available</a></div>";
                                    strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking.Tables[2].Rows[k].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@4" + "'" + ")><a href='#'>Person at delivery point is not available</a></div>";
                                    strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking.Tables[2].Rows[k].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@5" + "'" + ")><a href='#'>The parcel is not available</a></div>";
                                    strproc = strproc + "<div class='reason-box' onclick=confirmation(" + "'" + dsTracking.Tables[2].Rows[k].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@6" + "'" + ")><a href='#'>Need to change pick up or drop location</a></div>";
                                    strproc = strproc + "<div class='reason-box'><a href='#' id='feedback_trigger'>My reason is not listed?</a></div>";
                                    strproc = strproc + "</div></div>";
                                    strproc = strproc + "<div class='col-md-12'>";
                                    strproc = strproc + "<div id='feedback_body'>";
                                    strproc = strproc + "<div id='feedback_body_box'>";
                                    strproc = strproc + "<div id='feedback_div' class='own_fdk'>";
                                    strproc = strproc + "<a class='close-cancel' id='feedback_close'><img src='../img/close-icon.svg' height='15' width='14' alt='' /></a>";
                                    strproc = strproc + "<h4>Write your own reason</h4>";
                                    strproc = strproc + "<p>Let us know we can improve? </p>";
                                    strproc = strproc + "<hr class='thin-line'/>";
                                    strproc = strproc + "<input type='text' class='form-control' id='txtSub' name='Subject' placeholder='Subject'>";
                                    strproc = strproc + "<textarea class='form-control' rows='6' id='txtcomm' placeholder='Write your own text'></textarea>";
                                    strproc = strproc + "<button class='btn btn_feedback' onclick=confirmation1(" + "'" + dsTracking.Tables[2].Rows[k].ItemArray[0].ToString() + "@" + Session["CLIENT_ID"].ToString() + "@7" + "'" + ")>SEND FEEDBACK</button>";
                                    strproc = strproc + "</div></div></div></div></div></div></div></div></div>";


                                    k++;
                                    j++;
                                }
                            }
                            strproc = strproc + "</div></div>";
                            accordion.InnerHtml = strproc.ToString();
                        }
                    }

                }
            }
        }

    }
}
