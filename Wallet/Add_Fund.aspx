<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_Fund.aspx.cs" Inherits="Wallet_Add_Fund" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/Footer.ascx" %>
<%
    //Need to replace the last part of URL("your-vanityUrlPart") with your Testing/Live URL
    //string formPostUrl = "https://sandbox.citruspay.com/sslperf/russsh";
    string formPostUrl = "https://www.citruspay.com/russshpay";
    //Need to change with your Secret Key
    string secret_key = "2d2ed82733071d05c98378f5b989e423a218554a";

    //Need to change with your Vanity URL Key from the citrus https://www.russsh.com
    string vanityUrl = "russshpay";
    //Should be unique for every transaction
    string merchantTxnId = System.DateTime.Now.ToString("yyyyMMddHHmmssffff");

    //Need to change with your Order Amount
    string orderAmount = Session["AddAmount"].ToString();

    string currency = "INR";
    string data = vanityUrl + orderAmount + merchantTxnId + currency;

    //Need to change with your Return URL
    string returnURL = "https://www.russsh.com/Wallet/WalletTransactionCompleted.aspx";
    //Need to change with your Notify URL
    string notifyUrl = "https://www.russsh.com/Wallet/WalletTransactionNotified.aspx";

    string Client_Name = Session["Client_Name"].ToString();
    string Client_Email = Session["Client_Email"].ToString();
    string Client_Phone = Session["Client_Phone"].ToString();




    System.Security.Cryptography.HMACSHA1 myhmacsha1 = new System.Security.Cryptography.HMACSHA1(Encoding.ASCII.GetBytes(secret_key));
    System.IO.MemoryStream stream = new System.IO.MemoryStream(Encoding.ASCII.GetBytes(data));
    string securitySignature = BitConverter.ToString(myhmacsha1.ComputeHash(stream)).Replace("-", "").ToLower();
%>


<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>Russsh</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--From Zubair-->
    <%-- <link rel="stylesheet" href="../fonts/css/font-awesome.min.css">
     <link href="../css1/style.css" rel='stylesheet' type='text/css' />
     <link rel="stylesheet" href="../css1/flexslider.css" type="text/css" media="screen" />
    <script src="../js1/jquery.min.js"> </script>
    
    <script type="text/javascript" src="../js1/move-top.js"></script>
    <script type="text/javascript" src="../js1/easing.js"></script>

    <link rel="stylesheet" href="css/main.css" />
    <link href="css/button-switcher.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css" />
     <link href="../css1/menutopdwop.css" rel="stylesheet type='text/css'">
    <link href="../css1/custom.css" rel="stylesheet type='text/css'">
    --%>


    <link href="../css-web/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../css-web/style.css" rel="stylesheet" type="text/css">
    <link href="../css-web/media-style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="../css-web/hover.css">
    <link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.theme.default.min.css">
    <link rel="stylesheet" type="text/css" href="../plugin/flex-slider/flexslider.css">
    <link rel="stylesheet" type="text/css" href="../mega-dropdown/css/style.css">
    <link rel="stylesheet" type="text/css" href="../plugin/tabbed/css/style.css">
    <link rel="stylesheet" type="text/css" href="../plugin/login-slider/content-slide.css">
    <link href="https://fonts.googleapis.com/css?family=Courgette" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="../js1/move-top.js"></script>
    <script type="text/javascript" src="../js1/easing.js"></script>
    <style type="text/css">
        .ajax__calendar_years {
            top: 0px;
            left: 180px !important;
            height: 139px !important;
            width: 200px;
            position: absolute;
            text-align: center;
        }

        .ajax__calendar_day {
            height: 25px !important;
            width: 25px !important;
            text-align: right;
            padding: 5px !important;
            cursor: pointer;
            font-size: 13px !important;
        }

        .ajax__calendar_container {
            padding: 4px !important;
            cursor: default;
            width: 200px !important;
            height: 190px !important;
            font-size: 15px !important;
            text-align: center;
            font-family: tahoma,verdana,helvetica;
            background-color: white !important;
            border: 1px solid #999999;
        }

            .ajax__calendar_container TD {
                padding: 0 !important;
                margin: 0 !important;
            }
    </style>
    <script>
        function toggleChevron(e) {
            $(e.target)
                .prev('.panel-heading')
                .find("i.indicator")
                .toggleClass('glyphicon-chevron-down glyphicon-chevron-up');
        }
        $('#accordion').on('hidden.bs.collapse', toggleChevron);
        $('#accordion').on('shown.bs.collapse', toggleChevron);
    </script>
    <!--webfonts-->
    <!--webfonts-->
    <link href='/../fonts.googleapis.com/css?family=PT+Mono|Abril+Fatface' rel='stylesheet' type='text/css'>
    <script>

        function CreateOrderCookie(s) {
            window.location = '../OrderDetails/Default.aspx?ORDERNUM=' + s;
            /*
            var d = new Date();
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
            var expires = "expires=" + d.toUTCString();
            document.cookie = "ORDERNUM=" + s + "; " + expires;
            alert(s);
           */
        }
    </script>

    <!--//webfonts-->
</head>
<body>
    <form align="center" method="post" action="<%=formPostUrl%>">


        <!--start-header-->
        <div id="home" class="innerbackground">

            <div class="top-header">
                <div class="container">
                    <uc:Header ID="Header" runat="server" MinValue="1" MaxValue="10" />
                </div>
            </div>

            <div id="responsive_menu"></div>

            <!-- script-for-menu -->
            <div class="banner">
                <div class="container">
                    <!--  logon-->
                    <div class="col-md-9 yourordersbox" style="margin-top: 140px;">
                        <h3>Add Fund to Your Wallet Rs.<%=orderAmount%>
                            
                        </h3>
                        <p style="text-align: center; margin-top: 20px;">
                            <input type="hidden" id="merchantTxnId" name="merchantTxnId" value="<%=merchantTxnId%>" />
                            <input type="hidden" id="orderAmount" name="orderAmount" value="<%=orderAmount%>" />
                            <input type="hidden" id="currency" name="currency" value="<%=currency%>" />
                            <input type="hidden" name="returnUrl" value="<%=returnURL%>" />
                            <input type="hidden" id="notifyUrl" name="notifyUrl" value="<%=notifyUrl%>" />
                            <input type='hidden' name='firstName' value="<%=Client_Name%>" />
                            <input type='hidden' name='lastName' value="<%=Client_Name%>" />
                            <input type='hidden' name='email' value="<%=Client_Email%>" />
                            <input type='hidden' name='addressStreet1' value='' />
                            <input type='hidden' name='addressStreet2' value='' />
                            <input type='hidden' name='addressCity' value='Mumbai' />
                            <input type='hidden' name='addressState' value='Maharashtra' />
                            <input type='hidden' id='citrusCountry' value='India' />
                            <input type='hidden' name='addressZip' value='' />
                            <input type='hidden' name='phoneNumber' value="<%=Client_Phone%>" />
                            <input type="hidden" id="secSignature" name="secSignature" value="<%=securitySignature%>" />

                            <input id="PayNow" name="PayNow" type="Submit" value="Pay Now" />

                            <br>
                            <br>
                        </p>
                    </div>
                </div>
                <!--end  logonbox-->
            </div>
        </div>
        </div>
        <!--//end-slider-->
    </form>
    
    <script type="text/javascript">
        document.getElementById("PayNow").click();
    </script>
    <!--footer-->
    <div id="includedContent1">
        <form id="form2" name="form2" runat="server">
            <fc:Footer ID="Footer1"
                runat="server"
                MinValue="1"
                MaxValue="10" />
    </div>

    </form>
</body>
</html>
