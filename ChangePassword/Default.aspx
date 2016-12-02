<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="ChangePassword_Default" %>

<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/Footer.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Book Task - change password</title>
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
    <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <!--[if lt IE 9]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <script src="../js-web/modernizr.js"></script>
     <style type="text/css">
        .redone
        {
           background-color: rgb(240, 113, 62);
          

        }
          .btndisabled
        {
          
           cursor:not-allowed;
           pointer-events:none;

        }

    </style>

    <!-- Modernizr -->
    <script type="text/javascript">
        function ProcessForm()
        {
            if (document.getElementById("currentp").value == "") {
                document.getElementById("errorplace").innerHTML = "Error! Enter your current password!";
                document.getElementById("currentp").focus();
               return false;
            }
            if (document.getElementById("newpss").value == "") {
                document.getElementById("errorplace").innerHTML = "Error! Enter new password!";
                document.getElementById("newpss").focus();
                return false;
            }
            if (document.getElementById("confpass").value == "") {
                document.getElementById("errorplace").innerHTML = "Error! Re-enter new password to confirm!";
                document.getElementById("confpass").focus();
                return false;
            }
            if (document.getElementById("newpss").value.trim() != document.getElementById("confpass").value.trim()) {
                document.getElementById("errorplace").innerHTML = "Error! Confirm password does not match!";
                document.getElementById("confpass").focus();
                return false;

            }



        }

        function btndisabled() {
          
            $('#reset_password').attr("disabled", "disabled")

        }
        function ModifyClass() {
          
            if (document.getElementById("currentp").value != "" && document.getElementById("confpass").value != "" && document.getElementById("newpss").value != "") {

              
                if (document.getElementById("confpass").value == document.getElementById("newpss").value) {
                   

                    $('#reset_password').addClass('redone');
                    $('#reset_password').removeAttr("disabled")

                    //

                    //
                }
                else {
                    $('#reset_password').removeClass('redone');
                    $('#reset_password').attr("disabled", "disabled")

                }
            }
            else {
                $('#reset_password').removeClass('redone');
                $('#reset_password').attr("disabled", "disabled")
            }
        }

      


    </script>
   
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="Div1" class="innerbackground">
            <div class="top-header">
                <div class="container">
                    <uc:Header ID="Header"
                        runat="server"
                        MinValue="1"
                        MaxValue="10" />
                </div>
            </div>
            <header class="__header"></header>
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
                            <div class="profile-tab">
                                <ul class="col-md-2 col-sm-3">
                                    <li><a href="../EditProfile/">MY PROFILE</a></li>
                                    <li class="active"><a href="../ChangePassword/">CHANGE PASSWORD</a></li>
                                    <li><a href="../Wallet/">RUSSSHPAY</a></li>
                                    <li><a href="../Orders/">MY DELIVERIES</a></li>
                                    <li><a href="../EditAddress/">MY ADDRESSES</a></li>

                                </ul>
                            </div>
                            <div class="col-md-10 col-sm-9" style="margin: 0; padding: 0">
                                <div class="profile-content" style="display: block;">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="profile_body row">

                                                <div class="col-md-8">
                                                    <p>Reset Your Account Password</p>
                                                    <h4 class="name" id="profilename2" runat="server">Wasim Mansuri</h4>
                                                

                                                    <div class="form-group">

                                                        <input id="currentp" name="currentp" type="password" class="label_better" data-new-placeholder="Current" placeholder="Current Password" maxlength="20" onblur="ModifyClass()" />
                                                    </div>
                                                    <div class="form-group">
                                                        <input id="newpss" name="newpss" type="password" class="label_better" data-new-placeholder="New" placeholder="New Password" maxlength="20" onblur="ModifyClass()"  />
                                                    </div>
                                                  
                                                    <div class="form-group">
                                                        <input id="confpass" name="confpass" type="password" class="label_better" data-new-placeholder="Confirm" placeholder="Confirm Password" maxlength="20" onkeyup="ModifyClass()" />
                                                    </div>
                                                        <div id="errorplace"  runat="server" style="color:#651B0B;text-transform:initial;text-align:center;"></div><br />
                                                    <div class="form-group">
                                                        <button id="reset_password" type="submit" class="btn btn_reset" onclick="return ProcessForm()" >RESET PASSWORD</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <img src="../img/change_password.svg" class="prifile_icons" style="padding-top: 85px;">
                                        </div>
                                        <script type="text/javascript">
                                            btndisabled();

                                        </script>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- profile_tab_window  -->
                </div>
                <!-- profile wrapper -->

                <!-- book task -->
                <!-- <script src="../code.jquery.com/jquery-latest.min.js"></script>
                <!-- Jquery Library Call -->
                <script src="../js-web/helper-plugins.js"></script>
                <!-- Plugins -->
                <script src="../js-web/bootstrap.js"></script>
                <!-- UI -->

                <!-- bt-init -->
            </div>
        </div>
        <div id="includedContent1">
            <fc:Footer ID="Footer1"
                runat="server"
                MinValue="1"
                MaxValue="10" />
        </div>
    </form>
</body>
</html>
