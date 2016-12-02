<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WalletTransactionResponse.aspx.cs" Inherits="Wallet_TransactionResponse" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/Footer.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%
   
%>


<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>Russsh</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
     <!--From Zubair-->
 
 <link href="../css1/bootstrap.css" rel="stylesheet" type="text/css">
   
   


    <!--From Zubair-->
 <link rel="stylesheet" href="../fonts/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link href="css/button-switcher.css" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../css/font-awesome.css">
   <link href="../css1/menutopdwop.css" rel="stylesheet type='text/css'">
  
   
    <script src="../js1/jquery.min.js"> </script>

     
<link href="../css-web/style.css" rel="stylesheet" type="text/css">
<link href="../css-web/media-style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../css-web/hover.css">
<link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.carousel.min.css">
<link href="https://fonts.googleapis.com/css?family=Courgette" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.theme.default.min.css">
<link rel="stylesheet" type="text/css" href="../plugin/flex-slider/flexslider.css">
<link rel="stylesheet" type="text/css" href="../mega-dropdown/css/style.css">
<link rel="stylesheet" type="text/css" href="../plugin/tabbed/css/style.css">
<link rel="stylesheet" type="text/css" href="../plugin/login-slider/content-slide.css">

<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
<!--[if lt IE 9]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" type="text/css" href="css/ie8.css" media="screen"/><![endif]-->
<script src="../js-web/modernizr.js"></script><!-- Modernizr -->
<script type="javascript">
function bringtofront()
{
$(".cd-dropdown-content").show();
}
</script>

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
        $(function () {
        
            $("#responsive_menu").load("../responsive_menu_inner.html");
            $("#includedContent").load("../footer.html");
        });

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
    <form align="center" method="post">


        <!--start-header-->
        <div id="home" class="innerbackground">
           
            <div class="top-header">
                <div class="container">
                    <uc:Header id="Header" 
        runat="server" 
        MinValue="1" 
        MaxValue="10" />
                </div>
            </div>

            <div id="responsive_menu"></div>

            <!-- script-for-menu -->
            <div class="banner">
                <div class="container">
                    <!--  logon-->
                    <div class="col-md-9 yourordersbox" style="margin-top:150px;">
                        <h3>Transaction Completed
                            
                        </h3>
                        <p>
                          
                        


                        </p>
                    </div>



                </div>
                <!--end  logonbox-->


            </div>
        </div>
        </div>
        <!--//end-slider-->




        <!--footer-->
      <div id="includedContent1"><fc:Footer ID="Footer1"
                        runat="server"
                        MinValue="1"
                        MaxValue="10" /></div>
    </form>
</body>
</html>
