<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="forgot_password_Default" %>
<%@ Register TagPrefix="uc" TagName="Header"     Src="~/InnerHeader.ascx" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Russsh</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <meta name="google-signin-client_id" content="91098301541-s3bl45ll36gqgntna70h05buolath3jv.apps.googleusercontent.com">
<meta name="keywords" content="" />
<meta name="google-site-verification" content="PCnwPC6sXKg7hAGCOZR4Ctvxj_EFT7bYmtpD7C_OGwE" />	
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
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-65976441-1', 'auto');
  ga('send', 'pageview');

</script>
 
</head>
<body>
<!--start-header-->
<div id="home" class="loginbanner Forgotbnner">
  <div class="top-header">
       <div class="container">
    <uc:header id="Header" runat="server" MinValue="1" MaxValue="10" /></div>
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
                  
              } else {
                  // The person is not logged into Facebook, so we're not sure if
                  // they are logged into this app or not.
                  
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
                  // 'Thanks for logging in, ' + response.name + response.email + '!';
              });
          }
</script>
  </div>

        <div id="responsive_menu"></div>

  <!-- script-for-menu -->
  
  <div class="banner">
      <form name="form1" runat="server">
    <div class="container"> 
  <!--  logon-->
    <div class="col-md-6 logon_trabox">
    <h3>Forgot Password<br> <span></span></h3>
    <div class="col-md-12 facebookimg" style="display:non;">
         <div style="width:200px;padding:3px;border-radius:3px;display:none;">
             <fb:login-button scope="public_profile,email" onlogin="checkLoginState();" width="200" max-rows="1" data-size="xlarge">
            </fb:login-button>
        </div>
                             <div id="status" style="display:none;">
    <%--<a href="#"> <img src="../images1/signup_in_facebook.png" class="img-responsive imgeffect"></a>--%>
    </div>
        <div class="col-md-12 ggogleimg">

             <div id="my-signin2" style="display:none;"></div>
  <script>
      function onSuccess(googleUser) {
          //alert(googleUser.getBasicProfile().getId());
          //alert(googleUser.getBasicProfile().getName());
          //alert(googleUser.getBasicProfile().getEmail());
          //alert(googleUser.getBasicProfile().getImageUrl());

         // window.location = "../ProcessSocialLogin/Process.ashx?Email=" + googleUser.getBasicProfile().getEmail() + "&Name=" + googleUser.getBasicProfile().getName();

          //  console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
      }
      function onFailure(error) {
          console.log(error);
      }
      function renderButton() {
          gapi.signin2.render('my-signin2', {
              'scope': 'https://www.googleapis.com/auth/plus.login',
              'width': 220,
              'height': 50,
              'longtitle': true,
              'theme': 'dark',
              'onsuccess': onSuccess,
              'onfailure': onFailure
          });
      }
  </script>

  <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>

      <%--  <a href="#"><img src="../images1/signup_in_ggogle.png" class="img-responsive imgeffect"></a>--%>
        </div>
        <div class="clearfix"> </div>
        <div>
            
            <div style="float:left;padding-bottom:20px;margin:auto;width:100%;">
            
               
                <asp:Label ID="lblMessage0" runat="server"></asp:Label>
            
               
            </div>

        </div>
        <div class="contact-form conbg">
            <asp:TextBox ID="txtEmailID" runat="server" CssClass="text" placeholder="Enter your email id" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Registered Email ID!" ControlToValidate="txtEmailID" ValidationGroup="a" Display="Dynamic" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtEmailID" Display="Dynamic" ErrorMessage="Invalid Email ID!" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="a"></asp:RegularExpressionValidator>
            <%--<input class="text"  value="Enter your email id" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter your email id';}" type="text" style="border:none; margin:10px 0px; width:70%;">--%>
             <div class="clearfix"> </div>
             <div class="sub-button">
                 <asp:Button ID="btnContinue" runat="server" Text="Continue" CssClass="SIGN_btn" ValidationGroup="a" OnClick="btnContinue_Click" />
              <%--<input name="submit" value="Continue" class="SIGN_btn" type="submit" style="background-color:#959595; color:#FFFFFF;">--%>
            </div>
         
        </div>
        </div>
     <!--end  logonbox-->
    
    
    </div>
          </form>
  </div>
</div>
<!--//end-slider--> 
    </div></div></div></div>

        <div id="includedContent"></div>
       <script type="text/javascript" src="../lib1/js/jquery-1.10.1.min.js"> </script>
    <script type="text/javascript" src="../lib1/js/bootstrap/bootstrap.js"></script>
    <script type="text/javascript">
        $('button').on('click', function () {
            alert('preserve attached java script data!');
        });
        $('#myTab').tabCollapse();
    </script>
<!--footer-->

</body>
</html>