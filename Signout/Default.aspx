<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Signout_Default" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/Footer.ascx" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Russsh</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <%-- <meta http-equiv="refresh" content="3; url=https://www.russsh.com" />--%>
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!--From Zubair-->
    <link rel="stylesheet" href="../fonts/css/font-awesome.min.css">
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
  <link href='//fonts.googleapis.com/css?family=PT+Mono|Abril+Fatface' rel='stylesheet' type='text/css'>
<!--//webfonts-->
     <script>
         $(function () {
             $("#includeHeaderContent").load("../header_inner.html");
             $("#responsive_menu").load("../responsive_menu_inner.html");
             $("#includedContent").load("../footer.html");
         });
    </script>
    <script>
        function del_cookie(name) {
         
            document.cookie = name +
            '=; expires=Thu, 01-Jan-70 00:00:01 GMT;';
        }
        del_cookie('LOGINCOOKIE');
        del_cookie('LOGINNAME');
       
    </script>

</head>
<body>
<!--start-header-->
<div id="home" class="editbanner">
  <div class="top-header">
    <div class="container">
                <uc:header id="Header" runat="server" MinValue="1" MaxValue="10" />
            </div>
  </div>

    <script>
        // This is called with the results from from FB.getLoginStatus().
        function statusChangeCallback(response) {
            console.log('statusChangeCallback');
            console.log(response);
            // The response object is returned with a status field that lets the
            // app know the current login status of the person.
            // Full docs on the response object can be found in the documentation
            // for FB.getLoginStatus().

            if (response.status === 'connected') {
                // Logged into your app and Facebook.
               
                FB.logout(response);
            } else if (response.status === 'not_authorized') {
                // The person is logged into Facebook, but not your app.
                FB.logout(response);
            } else {
                // The person is not logged into Facebook, so we're not sure if
                // they are logged into this app or not.
                FB.logout(response);
            }
        }

        // This function is called when someone finishes with the Login
        // Button.  See the onlogin handler attached to it in the sample
        // code below.
        function checkLoginState() {
            FB.getLoginStatus(function (response) {
                statusChangeCallback(response);
            });
        }

        window.fbAsyncInit = function () {
            FB.init({
                appId: '337488946374891',
                cookie: true,  // enable cookies to allow the server to access 
                // the session
                xfbml: true,  // parse social plugins on this page
                version: 'v2.2' // use version 2.2
            });

            // Now that we've initialized the JavaScript SDK, we call 
            // FB.getLoginStatus().  This function gets the state of the
            // person visiting this page and can return one of three states to
            // the callback you provide.  They can be:
            //
            // 1. Logged into your app ('connected')
            // 2. Logged into Facebook, but not your app ('not_authorized')
            // 3. Not logged into Facebook and can't tell if they are logged into
            //    your app or not.
            //
            // These three cases are handled in the callback function.

            FB.getLoginStatus(function (response) {
                statusChangeCallback(response);
            });

        };
        checkLoginState();
      </script>



    <div id="responsive_menu"></div>
  
  <div class="banner">
    <div class="container"> 
  <!--  logon-->
    <div class="col-md-6 editprofile_trabox" style="margin-top:100px;">
    <h3>You have successfully signed out.</h3>
    <p> We’re sad to see you go.<br /><br />

   
   
   <div class="clearfix"> </div>
         
    
   
   
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
       <script type="text/javascript" src="../lib1/js/jquery-1.10.1.min.js"> </script>
    <script type="text/javascript" src="../lib1/js/bootstrap/bootstrap.js"></script>
    <script type="text/javascript">
        $('button').on('click', function () {
            alert('preserve attached java script data!');
        });
        $('#myTab').tabCollapse();
    </script>
</body>
</html>
