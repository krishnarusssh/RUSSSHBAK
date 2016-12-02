<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GuestUser.aspx.cs" Inherits="GuestUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Guest User</title>

    <script src="//code.jquery.com/jquery-latest.min.js"></script>
    <!-- Jquery Library Call -->
    <script type="text/javascript" src="//code.jquery.com/jquery-2.2.4.min.js"></script>
    <script>if (typeof jQuery == 'undefined') { document.write(unescape("%3Cscript src='js/jquery-2.0.0.min.js' type='text/javascript'%3E%3C/script%3E")); }</script>
    <script src="https://www.russsh.com/js-web/helper-plugins.js"></script>
    <!-- Plugins -->
    <script src="https://www.russsh.com/js-web/bootstrap.js"></script>
    <!-- UI -->
    <script src="https://www.russsh.com/plugin/flex-slider/jquery.flexslider.js"></script>
    <script src="https://www.russsh.com/mega-dropdown/js/jquery.menu-aim.js"></script>
    <script src="https://www.russsh.com/mega-dropdown/js/main.js"></script>
    <script src="https://www.russsh.com/plugin/tabbed/js/main.js"></script>
    <script src="https://www.russsh.com/plugin/owl-2016/owl.carousel.js"></script>
    <script src="https://www.russsh.com/js-web/init.js"></script>
    <script src="https://www.russsh.com/plugin/login-slider/Home.js"></script>
    <script type="text/javascript">


function validateForm()
        {
            var x = document.forms["form1"]["txtsname"].value;
            var Mob = document.forms["form1"]["txtsmobile"].value;
            var Email = document.forms["form1"]["txtsemail"].value;
            var value = document.forms["form1"]["txtsemail"].value;
            var atposition = value.indexOf("@");
            var dotposition = value.lastIndexOf(".");
            var phoneno = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
            if (x == null || x == "")
            {
                alert("Name must be filled out");
                return false;
            }
           
            else if (Email == null || Email == "")
            {
                alert("Email must be filled out");
                return false;
            }
            else if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= value.length) 
            {
                alert("Please enter a valid e-mail address");
                return false;
            }
            else if (Mob == null || Mob == "") {
                alert("Mobile must be filled out");
                return false;
            }           
            else if (Mob.value.match(phoneno))
            {
                return true;
            }
            else {
                alert("Not a valid Phone Number");
                return false;
            }

		


        }

        function onlyNumber(id)
        {
            var DataVal = document.getElementById(id).value;
            document.getElementById(id).value = DataVal.replace(/[^0-9]/g, '');
        }

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode != 46 && charCode > 31
              && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }
    </script>


    <style>
       
           .navbar-brand
            {
            color: #5e5e5e;
            background-color: black;
            width:100%;
            padding:7px;
            text-align:center;
            }

        .form-control {
            height: 30px;
            border: 3px solid #EBE6E2;
            border-radius: 5px;
            -webkit-transition: all 0.3s ease-out;
            -moz-transition: all 0.3s ease-out;
            -ms-transition: all 0.3s ease-out;
            -o-transition: all 0.3s ease-out;
            transition: all 0.3s ease-out;
            width: 97%;
            padding:5px;
        }

            .form-control:focus {
                border-color: #BBB;
                outline: none;
            }


        .button1 {
            background: #ee846a;
            text-align: center;
            font-weight:bold;
            color: #FFF;
            height: 45px;
            border: 0;
            width: 97%;
            border-radius: 0;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div>
            <asp:HiddenField ID="sendedotp" runat="server" />
            <asp:HiddenField ID="hdnVcode"  runat="server" />
            <asp:HiddenField ID="clientid"  runat="server" />
            <div class="clsSlide" id="signupwindow">
                <div class="navbar-brand" >
                    <img class="logo-xs" src="https://www.russsh.com/images/russsh-logo.svg" width="75" height="30" alt=""/>
                </div>
                <div class="login-container">
                    <div style="padding-top: 30px;">
                        <div class="col-md-12">
                            <div class="form-group" style="padding-top: 15px;">
                                <input type="text" id="txtsname" class="form-control" runat="server" placeholder="Name" />
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group" style="padding-top: 15px;">
                                <input type="text" id="txtsemail" class="form-control" runat="server" placeholder="Email Id" />
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group" style="padding-top: 15px;">
                                <input type="text" id="txtsmobile" maxlength="10" class="form-control" runat="server" onkeypress="return isNumberKey(event)" placeholder="Mobile No" />
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group" >
                                <%--  <input id="sign-otp" type="button" class="form-control" value="SIGN UP" onclick="Signin()">--%>
                                <asp:Button ID="btnSignUp" CssClass="button1" runat="server" Text="Continue" OnClientClick="return validateForm()" OnClick="btnSignUp_Click" />

                            </div>
                        </div>
                        <div class="col-md-11 alert-box">
                            <div class="alert alert-danger" id="signupfail" style="display: none;" runat="server">
                                You are not authorised  user!!! Please try again.
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
