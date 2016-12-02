<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="RussshPay_T_Default" %>

<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/Footer.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Book Task - Russsh Pay Wallet</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="keywords" content="" />
    <meta name="google-site-verification" content="PCnwPC6sXKg7hAGCOZR4Ctvxj_EFT7bYmtpD7C_OGwE" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--From Zubair-->
    <!--From Zubair-->
    <link rel="stylesheet" type="text/css" href="https://www.russsh.com/css/font-awesome.css" />
    <link href="https://www.russsh.com/css1/menutopdwop.css" rel="stylesheet type='text/css'" />

    <script src="https://www.russsh.com/js1/jquery.min.js"> </script>

    <link href="https://www.russsh.com/css-web/style.css" rel="stylesheet" type="text/css" />
    <link href="../css-web/media-style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../css-web/hover.css" />
    <link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.carousel.min.css" />
    <link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.theme.default.min.css" />
    <link rel="stylesheet" type="text/css" href="../plugin/flex-slider/flexslider.css" />
    <link rel="stylesheet" type="text/css" href="../mega-dropdown/css/style.css" />
    <link rel="stylesheet" type="text/css" href="../plugin/tabbed/css/style.css" />
    <link rel="stylesheet" type="text/css" href="../plugin/login-slider/content-slide.css" />
    <link href="https://fonts.googleapis.com/css?family=Courgette" rel="stylesheet" type="text/css" />

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="../css-web/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../bt-css/profile_style.css" />
    <!-- profile css -->
    <link href="../daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css" />
    <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <!--[if lt IE 9]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <script src="../js-web/modernizr.js"></script>
    <!-- Modernizr -->
</head>
<body>
    <form id="form1" runat="server">
        <div id="home" class="innerbackground">
            <div class="top-header">
                <div class="container">
                    <uc:Header ID="Header"
                        runat="server"
                        minvalue="1"
                        maxvalue="10" />
                </div>
            </div>
            <header class="__header"></header>
            <div id="responsive_menu"></div>
            <div class="banner">
                <div class="_profile_wraper">
                    <div class="_profile_header">
                        <ul class="_profile_header_inner">
                             <li>No of Task <span ><asp:Label id ="lblnooftask" runat="server"></asp:Label></span></li>
                        <li>Completed <span><asp:Label id ="lblcomp" runat="server"></asp:Label></span></li>
                        <li>Cancelled <span><asp:Label id ="lblcan" runat="server"></asp:Label></span></li>
                        </ul>
                        <div class="_profile_header_pic">
                               <div id="profileimg" runat="server"><img src="../img/user.png" alt="" /></div>
                            <h3 id="ProfileName1" style="text-transform:capitalize;" name="ProfileName1" runat="server"></h3>
							<p>Mumbai</p>
                        </div>
                    </div>
                    <div class="container profile_tab_window">
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div>
                                    <div class="profile-tab">
                                        <ul class="col-md-2 col-sm-3">
                                            <li><a href="../EditProfile/">MY PROFILE</a></li>
                                    <li><a href="../ChangePassword/">CHANGE PASSWORD</a></li>
                                    <li class="active"><a href="../Wallet/">RUSSSHPAY</a></li>
                                    <li><a href="../Orders/">MY DELIVERIES</a></li>
                                    <li><a href="../EditAddress/">MY ADDRESSES</a></li>

                                        </ul>
                                    </div>
                                    <div class="col-md-10 col-sm-9" style="margin: 0; padding: 0">
                                        <div class="profile-content" style="display: block;">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="profile_body row">
                                                        <div class="col-md-11">
                                                            <p>Russsh Balance</p>
                                                            <h4 class="name" id="UserAccountBalance" runat="server"><i class="fa fa-rupee"></i></h4>
                                                            <div class="form-group">
                                                                <input id="AmountToAdd" name="AmountToAdd" type="text" class="label_better" data-new-placeholder="Amount (<i class='fa fa-rupee'></i>)" placeholder="Amount">
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-4 col-xs-4">
                                                                    <div id="AddMoneyBox1" class="amount_box">100 <i class="fa fa-rupee"></i></div>
                                                                </div>
                                                                <div class="col-md-4 col-xs-4">
                                                                    <div id="AddMoneyBox2" class="amount_box">200 <i class="fa fa-rupee"></i></div>
                                                                </div>
                                                                <div class="col-md-4 col-xs-4">
                                                                    <div id="AddMoneyBox3" class="amount_box">500 <i class="fa fa-rupee"></i></div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group" style="border-bottom: 0;">
                                                                <asp:Button ID="addmoney" runat="server" class="btn btn_reset" OnClick="btnDone_Click" Text="Add Money" height=" 35px" />
                                                            </div>
                                                           
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6" style="border-left: 1px solid #CCC;">
                                                    <div style="padding-left: 20px;">
                                                        <h4 class="trans_hist">
                                                            <span>Transaction History</span>
                                                            <div class="trans_hist_right">
                                                                <i class="fa fa-download" onclick="Fnexport()"></i>
                                                                <i class="fa fa-calendar open-datetimepicker"></i><%--//name="datefilter"--%>
                                                                <input runat="server" id="FliterByDates" name="FliterByDates" placeholder="Filter By Dates" type="text" class="reportrange" value="" />
                                                            </div>
                                                        </h4>
                                                        <div style="display: none;">
                                                            <img src="../img/transaction_wallet.png" class="center-block" style="padding-top: 35px;">
                                                            <h2 class="courgette">Sorry We couldn't find any
                                                            <br />
                                                                transactions for you!</h2>
                                                        </div>

                                                        <div class="table-responsive scroll1" style="height: 400px; overflow: hidden; overflow-x: auto; overflow-y: auto;" id="UserWalletData" runat="server">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- profile_tab_window  -->
                        </div>
                    </div>
                </div>
                <div id="includedContent1">
                    <fc:Footer ID="Footer1"
                        runat="server"
                        MinValue="1"
                        MaxValue="10" />
                </div>
                <!-- profile wrapper -->
                <!-- book task -->
                <script src="../code.jquery.com/jquery-latest.min.js"></script>
                <!-- Jquery Library Call -->
                <script src="../js-web/helper-plugins.js"></script>
                <!-- Plugins -->
                <script src="../js-web/bootstrap.js"></script>
                <!-- UI -->
                <script type="text/javascript" src="../bt-js/jquery.label_better.js"></script>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $('#AmountToAdd').keyup(function () {
                            if ($(this).val().length == 0) {
                                $("#addmoney").css("background", "#CCC");
                            }
                            else {
                                $("#addmoney").css("background", "#f0713e");
                            }
                        });
                    });

                    $('#AddMoneyBox1').click(function () {
                        document.getElementById('AmountToAdd').value = 100;
                        $("#addmoney").css("background", "#f0713e");

                        $(document).ready(function () {
                            $(".label_better").label_better({
                                easing: "bounce"
                            });
                        });
                    });

                    $('#AddMoneyBox2').click(function () {
                        document.getElementById('AmountToAdd').value = 200;
                        $("#addmoney").css("background", "#f0713e");
                    });

                    $('#AddMoneyBox3').click(function () {
                        document.getElementById('AmountToAdd').value = 500;
                        $("#addmoney").css("background", "#f0713e");
                    });
                    $(document).ready(function () {
                        $(".label_better").label_better({
                            easing: "bounce"
                        });
                    });


                </script>
                <script src="../daterangepicker/moment.js"></script>
                <!-- datep -->
                <script src="../daterangepicker/daterangepicker.js"></script>
                <!-- datep -->
                
            <script type="text/javascript">
                // Date Picker
                $(function () {
                    var start = moment().subtract(29, 'days');
                    var end = moment();
                    function cb(start, end) {
                        $('.reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
                        $('.reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));

                    }

                    $('.reportrange').daterangepicker({
                        startDate: start,
                        endDate: end,
                        autoUpdateInput: false,
                        ranges: {
                            'Today': [moment(), moment()],
                            'Yesterday': [moment().subtract(1, 'days'), moment().add(1, 'days')],
                            //'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                            //'This Weekend': [moment().add(3, 'days'), moment().add(4, 'days')],
                            ///'Next Weekend': [moment().subtract(29, 'days'), moment()],
                           'This Month': [moment().startOf('month'), moment().endOf('month')],
                            //'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                        },
                        locale: {
                            cancelLabel: 'Clear'
                        },
                        "opens": "left",
                        "showCustomRangeLabel": true,
                        "startDate": "08/25/2016",
                        "endDate": "09/10/2016"

                    }, cb);

                    cb(start, end);

                   

                });

                $('.open-datetimepicker').click(function (event) {
                    event.preventDefault();
                    $('.reportrange').click();
                });

                $('input[name="FliterByDates"]').on('apply.daterangepicker', function (ev, picker) {
                    var vid = $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));

                    var FilterWalletData = SelectDate(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));


                });

                $('input[name="FliterByDates"]').on('cancel.daterangepicker', function (ev, picker) {
                    $(this).val('');
                });
                function SelectDate(aid) {

                    $.ajax({
                        url: "GetWalletData.ashx",
                        contentType: "application/text; charset=utf-8",
                        data: {
                            'WalletDate': aid,
                        },
                        success: function OnComplete(result) {
                            $('#UserWalletData').text('');

                            $('#UserWalletData').html(result);

                        },
                        error: OnFail
                    });
                };
                function OnFail() {
                    alert('Request Failed');
                }
            </script>
                <script src="../bt-js/bt-init.js"></script>
                <script src="../js-web/table2excel.js"></script>
                <script type="text/javascript">

                    function Fnexport() {

                        $("#UserWalletData").table2excel({
                            // exclude CSS class
                            exclude: ".noExl",
                            name: "WalletData",
                            filename: "WalletData" //do not include extension
                        });
                    }
                </script>
                <!-- bt-init -->
    </form>
</body>
</html>
