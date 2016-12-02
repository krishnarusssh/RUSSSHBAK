<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="MyProfile_T_Default" %>

<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/Footer.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Task - Profile</title>
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
    <link rel="stylesheet" type="text/css" href="../bt-css/select-style.css" />
    <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <!--[if lt IE 9]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <script src="../js-web/modernizr.js"></script>
    <!-- Modernizr -->
    <!-- Modernizr -->
    <script type="text/javascript">
          function btndisabled() {
          
            $('#update_p').attr("disabled", "disabled")
            $('#update_p').attr("style", "background: #CCC;height: 38px;");
          }
    
          function enablebtn() {

              var gender = document.getElementById("SelectGender");
              var dd = document.getElementById("SelectDate");
              var mm = document.getElementById("SelectMonth");
              var yy = document.getElementById("SelectYear");
          
              //
              var ggg = gender.options[gender.selectedIndex].value;
              var ddd = dd.options[dd.selectedIndex].value;
              var mmm = mm.options[mm.selectedIndex].value;
              var yyy = yy.options[yy.selectedIndex].value;
             
              if (document.getElementById("txtclientname").value != "" && ggg != "0" && ddd != "0" && mmm != "0" && yyy != "1900") {
                  //  alert("found");
                  $('#update_p').removeAttr("disabled");
                  $('#update_p').attr("style", "background-color: rgb(240, 113, 62);height: 38px;");
                  
              }
              else {
                  $('#update_p').attr("disabled", "disabled")
                  $('#update_p').attr("style", "background: #CCC;height: 38px;");
              }


          }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="home" class="innerbackground">
            <div class="top-header">
                <div class="container">
                    <uc:Header ID="Header"
                        runat="server"
                        MinValue="1"
                        MaxValue="10" />
                </div>
            </div>
            <header class="__header"></header>
            <div id="responsive_menu"></div>
            <div class="banner">
                <div class="_profile_wraper">
                    <div class="_profile_header">
                        <ul class="_profile_header_inner">
                            <li>No of Task <span>
                                <asp:Label ID="lblnooftask" runat="server"></asp:Label></span></li>
                            <li>Completed <span>
                                <asp:Label ID="lblcomp" runat="server"></asp:Label></span></li>
                            <li>Cancelled <span>
                                <asp:Label ID="lblcan" runat="server"></asp:Label></span></li>
                        </ul>
                         <div class="_profile_header_pic">
                               <div id="profileimg" runat="server"><img src="../img/user.png" alt="" /></div>
                            <h3 id="profilename2" style="text-transform:capitalize;" name="profilename2" runat="server"></h3>
							 <p>Mumbai</p>
                        </div>
                    </div>
                    <div class="container profile_tab_window">
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div>
                                    <div class="profile-tab">
                                        <ul class="col-md-2 col-sm-3">
                                            <li class="active"><a href="../EditProfile/">MY PROFILE</a></li>
                                    <li><a href="../ChangePassword/">CHANGE PASSWORD</a></li>
                                    <li><a href="../Wallet/">RUSSSHPAY</a></li>
                                    <li><a href="../Orders/">MY DELIVERIES</a></li>
                                    <li><a href="../EditAddress/">MY ADDRESSES</a></li>

                                        </ul>
                                    </div>
                                    <div class="col-md-10 col-sm-9" style="margin: 0; padding: 0">
                                        <div id="profile" class="profile-content">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <div class="profile_body row">
                                                        <div class="col-md-8">
                                                            <p>Your Account</p>
                                                            <h4 id="profilename1" runat="server" class="name"></h4>
                                                            <p id="errorplace" runat="server" style="color: red; text-transform: uppercase;"></p>
                                                            <br />
                                                            <div class="form-group">
                                                                <asp:TextBox ID="txtEmail" runat="server" CssClass="label_better" data-new-placeholder="Email ID" placeholder="Email ID" disabled=""></asp:TextBox>
                                                                <span class="EditBtn">
                                                                    <img id="" src="../img/edit.png" type="image/svg" class="img-responsive" width="20px" height="20px">
                                                                </span>
                                                            </div>

                                                            <div class="form-group">
                                                                <asp:TextBox ID="txtphone" runat="server" CssClass="label_better" onkeypress="return isNumberKey(event)" data-new-placeholder="Phone No" placeholder="Phone No" disabled=""></asp:TextBox>
                                                                <span href="#" class="EditBtn">
                                                                    <img id="" src="../img/edit.png" type="image/svg" class="img-responsive" width="21px" height="21px">
                                                                </span>
                                                            </div>

                                                            <div class="form-group" style="margin-bottom: 15px;">
                                                                <asp:TextBox ID="txtclientname" runat="server" CssClass="label_better" data-new-placeholder="Name" placeholder="Name" disabled="" onkeyup="enablebtn()" ></asp:TextBox>
                                                                <span href="#" class="EditBtn">
                                                                    <img id="UName" src="../img/edit.png" type="image/svg" class="img-responsive" width="21px" height="21px">
                                                                </span>
                                                            </div>

                                                            <div class="form-group" style="margin-bottom: 15px">
                                                                <asp:DropDownList ID="SelectGender" name="SelectGender" runat="server" class="select1-style1" onchange="enablebtn()" >
                                                                    <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                                                    <asp:ListItem Value="1">Male</asp:ListItem>
                                                                    <asp:ListItem Value="2">Female</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="row">

                                                                <div class="col-md-4 col-xs-4 gender" style="line-height: 12px; margin-bottom: 20px;">
                                                                    <div style="border-bottom: 1px solid #CCC; margin-left: 14px; font-size: 13px;">
                                                                        <!--<select id="SelectDate" name="SelectDate" class="selectpicker show-menu-arrow">
                                                                        </select>-->
                                                                        <asp:DropDownList ID="SelectDate" name="SelectDate" class="select1-style1" runat="server" onchange="enablebtn()">
                                                                        </asp:DropDownList>

                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 col-xs-4 gender" style="line-height: 12px;">
                                                                    <div style="border-bottom: 1px solid #CCC; font-size: 13px;">
                                                                        <!--<select  id="SelectMonth" name="SelectMonth" class="selectpicker show-menu-arrow">
                                                                        </select>-->
                                                                        <asp:DropDownList ID="SelectMonth" name="SelectMonth" class="select1-style1" runat="server" onchange="enablebtn()" ></asp:DropDownList>

                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 col-xs-4 gender" style="line-height: 12px;">
                                                                    <div style="border-bottom: 1px solid #CCC; font-size: 13px;">
                                                                        <!-- <select id="SelectYear" name="SelectYear" class="selectpicker show-menu-arrow">
                                                                        </select>-->
                                                                        <asp:DropDownList ID="SelectYear" name="SelectYear" class="select1-style1" runat="server" onchange="enablebtn()"></asp:DropDownList>
                                                                   
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <!--<button id="update_p" class="btn btn_reset">UPDATE</button>-->
                                                                <asp:Button ID="update_p" runat="server" class="btn btn_reset" Text="UPDATE" OnClick="btnsubmit_Click" OnClientClick="return ProcessForm()" height=" 35px" />
                                                            </div>
                                                            <script type="text/javascript">
                                                                btndisabled();
                                                            </script>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <img src="../img/Myprofile.svg" class="prifile_icons" style="padding-top: 100px;">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- profile_tab_window  -->
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
                    <script src="../bt-js/select-style.js"></script>
                    <!-- select style-->
                    <script type="text/javascript">
                        $(document).ready(function () {

                            $("#UEmail").click(function () {
                                $("#txtEmail").removeAttr("disabled").focus();
                                $("#UEmail").attr("src", "../img/Un-Selec.png");
                                $("#txtEmail").val("");
                            });

                            $("#txtEmail").keyup(function () {
                                if (validateEmail($("#txtEmail").val()) == true) {
                                    $("#UEmail").attr("src", "../img/Tick-Select.png");
                                    $("#update_p").css("background", "#f0713e");
                                }
                                else {
                                    $("#UEmail").attr("src", "../img/Un-Selec.png");
                                    $("#update_p").css("background", "#CCC");
                                }
                            });

                            $("#UName").click(function () {
                                $("#txtclientname").removeAttr("disabled").focus();
                                $("#UName").attr("src", "../img/Un-Selec.png");
                                $("#txtclientname").val("");
                            });

                            $("#txtclientname").keyup(function () {

                                $("#UName").attr("src", "../img/Tick-Select.png");
                                $("#update_p").css("background", "#f0713e");

                            });
                            function validateEmail(email) {
                                var re = /\S+@\S+\.\S+/;
                                return re.test(email);
                            }
                            // phone No
                            function isNumberKey(evt) {
                                var charCode = (evt.which) ? evt.which : event.keyCode
                                if (charCode > 31 && (charCode < 48 || charCode > 57))
                                    return false;
                                return true;
                            }
                            function isNumber(o) {
                                return !isNaN(o - 0);
                            }

                            $("#txtphone").keyup(function (e) {
                                txtVal = $(this).val();
                                if (isNumber(txtVal) && txtVal.length > 9) {
                                    $(this).val(txtVal.substring(0, 10));
                                    $("#Uphone").attr("src", "../img/Tick-Select.png");
                                }
                                else {
                                    $("#Uphone").attr("src", "../img/Un-Selec.png");
                                }
                            });
                            $("#Uphone").click(function () {
                                $("#txtphone").removeAttr("disabled").focus();
                                $("#txtphone").val("");
                                $("#Uphone").attr("src", "../img/Un-Selec.png");
                            });
                        });
                    </script>
                    <script>
                        $(document).ready(function () {
                            $(".label_better").label_better({
                                easing: "bounce"
                            });
                        });
                    </script>
                    <script src="../bt-js/bt-init.js"></script>
                    <script type="text/javascript">
                        function ProcessForm() {
                            if (document.getElementById("txtclientname").value == "") {
                                document.getElementById("errorplace").innerHTML = "Error! Enter your Name!";
                                document.getElementById("txtclientname").focus();
                                return false;
                            }
                        }
                    </script>
                    <!-- bt-init -->
                </div>
            </div>
        </div>
         <div id="includedContent1">  <fc:Footer ID="Footer1"
                        runat="server"
                        MinValue="1"
                        MaxValue="10" /></div>
    </form>
</body>
</html>
