<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="B2B_Default" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/FooterWithoutCalc.ascx" %>
<%@ OutputCache Duration=5 VaryByParam="None" %>
<!DOCTYPE html>

<html>
<head>
<title>Russsh- Get Quote For Business</title>
<meta name="title" content="Russsh- Get Quote For Business" />
<meta name="description" content="Schedule local same day delivery from a business or retail location. Fast, reliable, affordable courier service. We offer scheduled delivery windows." />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="google-signin-client_id" content="91098301541-s3bl45ll36gqgntna70h05buolath3jv.apps.googleusercontent.com">
<meta name="keywords" content="" />
<meta name="google-site-verification" content="PCnwPC6sXKg7hAGCOZR4Ctvxj_EFT7bYmtpD7C_OGwE" />	
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
<script src="../js-web/modernizr.js"></script><!-- Modernizr -->
<script type="javascript">
function bringtofront()
{
$(".cd-dropdown-content").show();
}
</script>

    <script type="text/javascript">
        function setCookie(cname, cvalue, exdays) {
            var d = new Date();
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
            var expires = "expires=" + d.toUTCString();
            document.cookie = cname + "=" + cvalue + "; " + expires;
        }
        document.getElementById("not_signed_inbppzyli8mpdy").innerHTML = "Google";
    </script>
    


     <style type="text/css">
 .contact-form input[type="text"].paym_box,.contact-form input[type="password"].paym_box
{
    width: 100%;
    border: solid 1px #000000;
    margin: 5px 0px;
}

         .pass {

             padding: 9px;
      
        font-size: 15px;
        margin: 10px 0px;
        border: 1px solid #bbbbbb;
        color: #555;
        background: none;
        background: #fff;
        -webkit-appearance: none;
        outline: none;
        font-weight: 400;
        -webkit-border-radius: 0.3em;
        -moz-border-radius: 0.3em;
        -o-border-radius: 0.3em;
        text-align: left;
        -webkit-transition: all 0.3s ease-out;
        -moz-transition: all 0.3s ease-out;
        -ms-transition: all 0.3s ease-out;
        -o-transition: all 0.3s ease-out;
        transition: all 0.3s ease-out;
         }
    ._4z_b {
 
    width: 215px !important;
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
   

      <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
  <script src="https://apis.google.com/js/api:client.js"></script>
  <script>
      var googleUser = {};
      var startApp = function () {
          gapi.load('auth2', function () {
              // Retrieve the singleton for the GoogleAuth library and set up the client.
              auth2 = gapi.auth2.init({
                  client_id: '91098301541-s3bl45ll36gqgntna70h05buolath3jv.apps.googleusercontent.com',
                  cookiepolicy: 'single_host_origin',
                  // Request scopes in addition to 'profile' and 'email'
                  //scope: 'additional_scope'
              });
              attachSignin(document.getElementById('customBtn'));
          });
      };

      function attachSignin(element) {
          console.log(element.id);
          auth2.attachClickHandler(element, {},
              function (googleUser) {

                  window.location = "Forwarding.ashx?Email=" + googleUser.getBasicProfile().getEmail() + "&Name=" + googleUser.getBasicProfile().getName() + "&AppID=" + googleUser.getBasicProfile().getId();
              }, function (error) {
                  alert(JSON.stringify(error, undefined, 2));
              });
      }
  </script>
  <style type="text/css">
    #customBtn {
      display: inline-block;
      background: #4285f4;
      color: white;
      width: 201px;
      border-radius: 5px;
      white-space: nowrap;
    }
    #customBtn:hover {
      cursor: pointer;
    }
    span.label {
      font-weight: bold;
    }
    span.icon {
      background: url('https://google-developers.appspot.com/identity/sign-in/g-normal.png') transparent 5px 50% no-repeat;
      display: inline-block;
      vertical-align: middle;
      width: 42px;
      height: 42px;
      border: #2265d4 0px solid;
    }
    span.buttonText {
      display: inline-block;
      vertical-align: middle;
      padding-left: 42px;
      padding-right: 42px;
      font-size: 14px;
      font-weight: bold;
      /* Use the Roboto font that is loaded in the <head> */
      font-family: 'Roboto', sans-serif;
    }
  </style>

	<script type='text/javascript'>
var $zoho= $zoho || {salesiq:{values:{},ready:function(){$zoho.salesiq.floatbutton.visible('hide');}}}; var d=document; s=d.createElement('script'); s.type='text/javascript'; s.defer=true; s.src='https://salesiq.zoho.com/russsh/float.ls?embedname=russsh'; t=d.getElementsByTagName('script')[0]; t.parentNode.insertBefore(s,t);
</script>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-65976441-1', 'auto');
  ga('send', 'pageview');

</script>


</head>
<body>
    <form id="Form1" runat="server">
        
      <div id="home" >
         <div class="top-header">
      <div class="container">
                <uc:header id="Header" runat="server" MinValue="1" MaxValue="10" />

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
                        testAPI();
                    } else if (response.status === 'not_authorized') {
                        // The person is logged into Facebook, but not your app.
                        document.getElementById('status').innerHTML = '';
                    } else {
                        // The person is not logged into Facebook, so we're not sure if
                        // they are logged into this app or not.
                        document.getElementById('status').innerHTML = '';
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

                // Load the SDK asynchronously
                (function (d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];
                    if (d.getElementById(id)) return;
                    js = d.createElement(s); js.id = id;
                    js.src = "//connect.facebook.net/en_US/sdk.js";
                    fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'facebook-jssdk'));

                // Here we run a very simple test of the Graph API after login is
                // successful.  See statusChangeCallback() for when this call is made.
                function testAPI() {
                    console.log('Welcome!  Fetching your information.... ');
                    FB.api('/me', { locale: 'tr_TR', fields: 'id,name,first_name,last_name,gender,age_range,link,locale,email' }, function (response) {
                        console.log(JSON.stringify(response));
                        console.log('Successful login for: ' + response.name);

                        //window.location = "../ProcessSocialLogin/Process.ashx?Email=" + response.email + "&Name=" + response.name;

                        // document.getElementById('status').innerHTML =
                        // 'Thanks for logging in, ' + response.name  +response.email+ '!';
                    });
                }
</script>

<!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.
-->

<div>
  
</div>




            </div>
  </div></div>
        <div id="responsive_menu"></div>
           <div class="container"> 
      <div class="about martop"> 
  
  <!--<hr class="dotted">-->
  
  <div class="col-md-12" style="margin-top:100px;">
     <iframe src="https://docs.google.com/a/getmypeon.com/forms/d/1e7FWE7ECWI2YxA5YSjVP7kmFsLq9Ytu25pmwNEJ8fGA/viewform?embedded=true" height="1200" style="overflow:hidden; width:100%;border:0;">Loading...</iframe>
     </div></div></div>
       
<!--//end-slider--> 
           <div id="includedContent1"> <fc:Footer ID="Footer1"
                        runat="server"
                        MinValue="1"
                        MaxValue="10" /></div>
         
</form>
</body>
</html>
