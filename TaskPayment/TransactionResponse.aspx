<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TransactionResponse.aspx.cs" Inherits="TaskPayment_TransactionResponse" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%
   
%>


<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>Russsh</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="../css1/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- Custom Theme files -->
    <link href="../css1/style.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="../css1/flexslider.css" type="text/css" media="screen" />
    <script src="../js1/jquery.min.js"> </script>
    <link href="../css1/menutopdwop.css" rel="stylesheet type='text/css'">
    <link href="../css1/custom.css" rel="stylesheet type='text/css'">
    <link rel="stylesheet" href="../fonts/css/font-awesome.min.css">

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
        $(function () {
            $("#includeHeaderContent").load("../header_inner.html");
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
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-65976441-1', 'auto');
  ga('send', 'pageview');

</script>

    <!--//webfonts-->
</head>
<body>
    <form align="center" method="post">


        <!--start-header-->
        <div id="home" class="innerbackground">
           
            <div class="top-header">
                <div class="container">
                    <div id="includeHeaderContent"></div>
                </div>
            </div>

            <div id="responsive_menu"></div>

            <!-- script-for-menu -->
            <div class="banner">
                <div class="container">
                    <!--  logon-->
                    <div class="col-md-9 yourordersbox">
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
        <div id="includedContent"></div>
    </form>
</body>
</html>
