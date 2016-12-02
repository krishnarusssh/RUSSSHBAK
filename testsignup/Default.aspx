<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="signup_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Russsh – Register with us</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="google-signin-client_id" content="91098301541-s3bl45ll36gqgntna70h05buolath3jv.apps.googleusercontent.com">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="title" content="Russsh – Register with us"/>
	<meta name="description" content="New! Feature added wherein every customer can save multiple address, pay using an e-wallet, credit/debit card. Customers can also view all orders placed with Russsh."/>
    <meta name="keywords" content="" />
	<meta name="google-site-verification" content="PCnwPC6sXKg7hAGCOZR4Ctvxj_EFT7bYmtpD7C_OGwE" />	
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="../css1/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- Custom Theme files -->
    <link href="../css1/style.css" rel='stylesheet' type='text/css' />
    <link href="../css1/menutopdwop.css" rel="stylesheet type='text/css'">
    <link href="../css1/custom.css" rel="stylesheet type='text/css'">
    <link rel="stylesheet" href="../css1/flexslider.css" type="text/css" media="screen" />
    <script src="../js1/jquery.min.js"> </script>
    <link rel="stylesheet" href="../fonts/css/font-awesome.min.css">
    <script type="text/javascript" src="../js1/move-top.js"></script>
    <script type="text/javascript" src="../js1/easing.js"></script>
    <!--webfonts-->
    <link href='//fonts.googleapis.com/css?family=PT+Mono|Abril+Fatface' rel='stylesheet' type='text/css'>
    <!--//webfonts-->
    <style type="text/css">
        .contact-form input[type="text"].paym_box, .contact-form input[type="password"].paym_box {
            width: 100%;
            border: solid 1px #000000;
            margin: 5px 0px;
        }

        .pass {
            padding: 9px;
            width: 49%;
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
    </style>
    <script>
        $(function () {
            $("#includeHeaderContent").load("../header_inner.html");
            $("#responsive_menu").load("../responsive_menu_inner.html");
            $("#includedContent").load("../footer.html");
        });
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

                  window.location = "../signin/Forwarding.ashx?Email=" + googleUser.getBasicProfile().getEmail() + "&Name=" + googleUser.getBasicProfile().getName() + "&AppID=" + googleUser.getBasicProfile().getId();
              }, function (error) {
                  alert(JSON.stringify(error, undefined, 2));
              });
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




</head>
<body>
    <!--start-header-->
    <form runat="server">


           <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>


        <div id="home" >
            <div class="top-header">
                <div class="container">
                    <div id="includeHeaderContent"></div>
                </div>
                
            </div>
            <div id="responsive_menu"></div>
            <div class="banner">
                <div class="container">
                    <!--  logon-->
                    <div class="about divisiontop division" id="divtop" runat="server"  >
                        <h3>Register with us.<br>
                           </h3>
                        <div class="col-md-12 facebookimg" style="display:non;">
                            
                            <asp:ImageButton ID="ImageButton1" runat="server" OnClick="Login"  ImageUrl="~/images1/signup_in_facebook.png"/>
                            
                        </div>
                         <div class="col-md-12 ggogleimg">
                            
        <div id="gSignInWrapper">
   
    <div id="customBtn" class="customGPlusSignIn">
      <span class="icon"></span>
      <span class="buttonText">Google</span>
    </div>
  </div>
  <div id="name"></div>
  <script>startApp();</script>
                                <%--<asp:ImageButton ID="imggoogle" runat="server" CssClass="img-responsive imgeffect" ImageUrl="../images1/signup_in_ggogle.png" />--%>
                        </div>
                        <div class="clearfix"></div>

                           


                        <div class="contact-form">

                            

                            <asp:TextBox ID="txtFname" runat="server" class="text" type="text" placeholder="First name *" Style="border: 1px thin black; margin: 8px 0px 5px;"></asp:TextBox>
                            <asp:TextBox ID="txtLname" runat="server" class="text" type="text" placeholder="Last name *" Style="border: 1px thin black; margin: 8px 0px 5px;"></asp:TextBox>
                            <asp:TextBox ID="txtEmail" runat="server" class="text" type="text" placeholder="Enter your email id" Style="border: 1px thin black; margin: 8px 0px 5px;"></asp:TextBox><br />
                            <asp:TextBox ID="txtMobile"  runat="server" class="text" type="text" placeholder="Mobile number *" MaxLength="10" Style="border: 1px thin black; margin: 8px 0px 5px;"></asp:TextBox><br />
                            <h6 style="color:#999;font-style:italic;">Verification OTP Code will be sent to this Mobile No.</h6>
                            <asp:TextBox ID="txtPassword" runat="server" class="text" type="text" placeholder="Enter your password *" Style="border: 1px thin black; margin: 8px 0px 5px;" TextMode="Password" CssClass="pass"></asp:TextBox>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" class="text" type="text" placeholder="Confirm password *" Style="border: 1px thin black; margin: 8px 0px 5px;" TextMode="Password" CssClass="pass"></asp:TextBox>
                            <div class="clearfix"></div>
                            <br />
                            <asp:Label ID="lblAccountID" runat="server" Text="0" Visible="false"></asp:Label>
                            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtPassword" ID="RegularExpressionValidator3" ValidationExpression="^[\s\S]{4,14}$" ForeColor="Red" runat="server" ErrorMessage="Minimum 4 and Maximum 10 characters required." ValidationGroup="signup"></asp:RegularExpressionValidator>

                            <br />
                          <div style="display:none;">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                                ShowSummary="False" ValidationGroup="signup" /></div>
                            <div class="clearfix"></div>
                            <h4 style="display:none;">By signing up you agree to our <a href="termsconditions.html" style="font-size: 16px; text-decoration: underline;">Terms & Conditions</a></h4>
                            <div class="clearfix"></div>
                            <div class="sub-button">

                                <asp:Button ID="txtSubmit" class="SIGN_btn" Text="Submit" Style="background-color: #959595; color: #FFFFFF;" ValidationGroup="signup" runat="server" OnClick="txtSubmit_Click" /><br />
                                <div style="display:none;">
                                <asp:RequiredFieldValidator ValidationGroup="signup" Display="Dynamic" ID="rfvtxtFname" ControlToValidate="txtFname" ErrorMessage="Enter First Name" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RequiredFieldValidator ValidationGroup="signup" Display="Dynamic" ID="rfvtxtLname" ControlToValidate="txtLname" ErrorMessage="Enter Last Name" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RequiredFieldValidator ValidationGroup="signup" Display="Dynamic" ID="rfvtxtEmail" ControlToValidate="txtEmail" ErrorMessage="Enter EmailId " ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Invalid Email ID!" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="signup"></asp:RegularExpressionValidator>
                                <br />
                                <asp:RequiredFieldValidator ValidationGroup="signup" Display="Dynamic" ID="rfvtxtMobile" ControlToValidate="txtMobile" ErrorMessage="Enter Mobile Number" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
                                    ControlToValidate="txtMobile" ErrorMessage="Invalid Mobile No." Display="Dynamic" ValidationExpression="[0-9]{10}" ValidationGroup="signup" ForeColor="#FF3300"></asp:RegularExpressionValidator>
                                <br />
                                <asp:RequiredFieldValidator ValidationGroup="signup" Display="Dynamic" ID="rfvtxtPassword" ControlToValidate="txtPassword" ErrorMessage="Enter Password" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                <br />
                                  <asp:RequiredFieldValidator ValidationGroup="signup" Display="None" ID="rfvtxtConfirmPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Enter Confirmed password" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                <br />
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="Passwords dont match!" ForeColor="Red" ValidationGroup="signup"></asp:CompareValidator>
                                    </div>
                            </div>
                        </div>
                    </div>

                    <div style="border-style: solid;z-index:9999;background-color:white;" class="col-md-6 logon_trabox" id="validationsection" runat="server" >
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                        <ProgressTemplate>
                            <div style="border: 5px solid #FF9900; width:250px; height:150px;background-color: #FFFFFF; font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: medium; color: #003366; position: fixed; top: 20%; right: 35%;z-index:99991;">
                                <div  style="text-align:center;padding:10px;"><br />
                                    Validating Mobile No.<br /> Please wait!<br />
                                    <img alt="" src="loading_spinner.gif" width="60" />
                                </div>
                            </div>
                        </ProgressTemplate>
                        </asp:UpdateProgress>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                                                 
                    <table style="width: 100%;">
                        <tr>
                            <td>Validate your Mobile No.</td>
                        </tr>
                        <tr>
                            <td>We have recently sent you an OTP code. </td>
                        </tr>
                        <tr>
                            <td>
                                <h5>Enter the OTP&nbsp;
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtMissedCallNo" Display="Dynamic" ErrorMessage="*" Font-Size="10pt" ForeColor="#FF4646" ValidationGroup="b"></asp:RequiredFieldValidator>
                                </h5>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtMissedCallNo" runat="server" CssClass="t" placeholder="XXXXXX" Rows="1" MaxLength="6"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center;">
                                <asp:Button ID="btnValidate" runat="server" CssClass=" " Text="Validate" ValidationGroup="b" Width="100px" OnClick="btnValidate_Click" />&nbsp;
                                       <asp:Button ID="btnCancel" runat="server" CssClass=" " Text="Cancel" Width="100px" OnClick="btnCancel_Click" />

                            </td>
                        </tr>
                    </table>
                              </ContentTemplate>
                    </asp:UpdatePanel>
                </div>


                      <div class="about divisiontop division division1 devicewsie" id="div1" runat="server" style="float:left;" >
                        
                           <h3>Benefits of Registration</h3>
        <hr class="dotted">
        <p class="bboktext">
            <div class="pointsclass" style="margin-top:-10px;">
         <ul>
             <li>Have your own account. </li>
              <li>Save all addresses.</li>
              <li>Pay via wallet</li>
              <li>Maintain order history</li>
              <li>Ease of booking tasks</li>
              <li>and many more following...</li>
         </ul>
                <div class="clearfix"> </div>
              
                 <br /><br />
<%--<asp:Button ID="btnnn" class="SIGN_btn" Text="Have an account? LOGIN" Style="background-color: #959595; color: #FFFFFF;padding:10px;" ValidationGroup="signupf" runat="server" OnClick="btnnn_Click"  />--%>
                </div>
              
                </p>  <div class="clearfix"> </div>
         



                          </div>
                     
                </div>
             
            </div>
    </form>
    </div>
        
        
        

    </div>
     <!--end  logonbox-->


    </div>
  </div>
</div>
       <div id="includedContent"></div>
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
