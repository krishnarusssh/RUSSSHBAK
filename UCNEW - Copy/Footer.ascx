<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Footer.ascx.cs" Inherits="UserControls_Footer" %>

<script type="text/javascript">
    function ValidateLogin() {
        $('#loginfail').css("display", "none");
        var Userid = $('#txtuid').val();
        var pass = $('#txtpass').val();
 
        $.ajax({
            url: "https://www.russsh.com/Handler/ValidateLogin.ashx",
            contentType: "application/text; charset=utf-8",
            data: {
                'Name': Userid,
                'Password': pass
            },
            success: OnComplete,
            error: OnFail
        });
        return false;
    }

    function OnComplete(result)
    {
        var values = result.split(',');
        var cid = values[0];
        if (cid > 0)
        {

           // window.open("https://www.russsh.com/about-us/Test.aspx?CLIENT_ID=" + cid + "&CLIENT_CONTACT=" + values[2] + "&CLIENT_NAME=" + values[1],"_self");
           window.open("https://www.russsh.com/BookTask","_self");
        }
        else
        {
            $('#loginfail').css("display", "block");
        }
    }
   
    
       function FbClick()
       {
           var url = 'https://www.facebook.com/dialog/oauth?' +
                     'client_id=<%=ConfigurationManager.AppSettings["AppID"].ToString()%>' +
                    '&redirect_uri= <%=ConfigurationManager.AppSettings["Websitepath"].ToString()%>' + 'Default.aspx' +
                    '&scope=email,user_birthday'
           '&response_type=token';
           top.location.href = url;
       }
      
    function OnFail(result) {
        alert('Request Failed');
    }
  
    function onsign()
    {
        alert('on loasd');
       
    }
</script>
<footer class="footer">

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-4">
                <h6>About Russsh</h6>
                <p>Russsh is an on demand delivery service offering first mile and last mile solutions to individuals and businesses. Founded in 2012 we are currently live in Mumbai, Thane and Navi Mumbai and have helped over 30,000 clients. </p>
            </div>
            <div class="col-md-3 col-md-offset-1 col-sm-4">
                <div class="row">
                    <div class="col-md-3">
                        <img src="https://www.russsh.com/images/russsh-icons/headphones.svg" width="66" height="76" class="headset" alt="" title="" /></div>
                    <div class="col-md-9">
                        <h6>Call Now</h6>
                        <h2>8080900300</h2>
                        <p>Mon-Sat 9:00 Am to 8:00 Pm
                            <br />
                            Support@russsh.com</p>
                    </div>
                </div>

            </div>
            <div class="col-md-3 col-md-offset-1 col-sm-4">
                <div class="row">
                    <div class="col-md-3">
                        <img src="https://www.russsh.com/images/russsh-icons/newsletter.svg" class="headset" alt="" title="" width="66" height="76" /></div>
                    <div class="col-md-9">
                        <h6>Subscribe To Our Newsletter</h6>
                        <input type="text" class="form-control" placeholder="ENTER YOUR EMAIL ID" >
                        <button class="subscribe">SUBSCRIBE</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row paddingtb-20">
            <div class="col-md-2 col-sm-3">
                <h6>General Information</h6>
                <ul class="footer-element">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">Drop Shipment</a></li>
                    <li><a href="#">Testimonials</a></li>
                    <li><a href="#">Blog</a></li>
                </ul>
            </div>
            <div class="col-md-3 col-md-offset-1 col-sm-3">
                <h6>Services</h6>
                <ul class="footer-element">
                    <li><a href="#">Cake Delivery</a></li>
                    <li><a href="#">Clothes Delivery Service</a></li>
                    <li><a href="#">Grocery Shopping &amp; Delivery</a></li>
                    <li><a href="#">Food Delivery</a></li>
                    <li><a href="#">Gift Delivery</a></li>
                    <li><a href="#">Flower Delivery</a></li>
                    <li><a href="#">Electronic Devices Delivery</a></li>
                </ul>
            </div>
            <div class="col-md-3 col-sm-3">
                <h6>Other Services</h6>
                <ul class="footer-element">
                    <li><a href="#">Home &amp; Kitchen Item Delivery</a></li>
                    <li><a href="#">Bakery Delivery</a></li>
                    <li><a href="#">Chocolate Delivery</a></li>
                    <li><a href="#">Cash &amp; Cheque Delivery</a></li>
                    <li><a href="#">Bulk Delivery</a></li>
                    <li><a href="#">Same Day Document Delivery</a></li>
                    <li><a href="#">Parcel Delivery</a></li>
                </ul>
            </div>
            <div class="col-md-2 col-md-offset-1  col-sm-3">
                <h6>Help</h6>
                <ul class="footer-element">
                    <li><a href="#">Help Center</a></li>
                    <li><a href="#">Pricing</a></li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <hr class="fw" />
            </div>
            <div class="col-md-12">
                <div class="col-md-6 col-sm-6">
                    <p>Copyright 2016 &copy; RUSSSH Pvt.Ltd. All Rights Reserved.</p>
                </div>
                <div class="col-md-6 col-sm-6">
                    <div class="social-img">
                        <a  onclick="FbClick()">
                            <img src="https://www.russsh.com/images/russsh-icons/facebook.svg" width="10" height="25" alt="" /></a>
                        <a href="#">
                            <img src="https://www.russsh.com/images/russsh-icons/twitter.svg" width="25" height="20" alt="" /></a>
                        <a href="#">
                            <img src="https://www.russsh.com/images/russsh-icons/instagram.svg" width="24" height="24" alt="" /></a>
                        <a href="#">
                            <img src="https://www.russsh.com/images/russsh-icons/google plus.svg" width="25" height="20" alt="" /></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- Portfolio Modals -->
<div class="portfolio-modal modal fade" id="login" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <a class="close-modal" data-dismiss="modal">
                    <img src="https://www.russsh.com/images/russsh-icons/close-icon.svg" height="15" width="14" alt="" /></a>
                <div>
                    <div class="col-md-5 hidden-xs">
                        <img src="https://www.russsh.com/images/login-russsh.jpg" class="img-responsive" alt="" />
                    </div>
                    <div class="col-md-7 login-wall col-xs-12 col-sm-12">
                        <div class="clsRight">
                            <div style="width: 100%; position: relative;">
                                <div class="clsContainer">
                                    <div class="clsSlide paddingt-75">
                                        <div class="login-home">
                                            <div class="img">
                                                 <asp:ImageButton ID="GLogin" runat="server" OnClick="GLogin_Click" ImageUrl="https://www.russsh.com/images/russsh-icons/Login-Gplus.svg" /></div>
                                            <div class="img">
                                                <img src="https://www.russsh.com/images/russsh-icons/Login-Facebook.svg"  onclick="FbClick()" alt="" /></div>
                                            <p>Or use your email address</p>
                                            <div class="img">
                                                <img src="https://www.russsh.com/images/russsh-icons/Login.svg" class="clsLogin" alt="" /></div>
                                            <div class="img">
                                                <img src="https://www.russsh.com/images/russsh-icons/Signup.svg" class="clsSignUp" alt="" /></div>
                                        </div>
                                    </div>
                                    <div class="clsSlide" id="signupwindow">
                                        <div class="login-container">
                                            <div class="col-md-12">
                                                <h3>
                                                    <img id="login-home2" src="https://www.russsh.com/images/russsh-icons/backarrow.svg" alt="" />
                                                    Sign Up With Email</h3>
                                            </div>
                                            <div style="padding-top: 30px;">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input type="text" id="txtsname" class="form-control" runat="server" placeholder="Name"></div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input type="text" id="txtsemail" class="form-control" runat="server" placeholder="Email Id"></div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input type="text" id="txtsmobile" class="form-control" placeholder="Mobile No"></div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input type="password" id="txtspass" class="form-control" placeholder="Choose Password"></div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input id="sign-otp" type="button" class="form-control" value="Sign Up"></div>
                                                </div>
                                                <div class="col-md-11">
                                                    <p>By clicking Sign Up, Your agree to Russsh's<br />
                                                        <a href="#">Terms of Use </a>and <a href="#">Privacy Policy</a> </p>
                                                </div>
                                            </div>
                                            <div class="col-md-11">
                                                <div class="signup-bottom-item">
                                                    <p>Already have a Russsh account? <a class="clsLogin">Login</a></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                        </div>
                                    </div>
                                    <div class="clsSlide login-container" id="logindiv">
                                        <div class="col-md-12">
                                            <h3>
                                                <img id="login-home" src="https://www.russsh.com/images/russsh-icons/backarrow.svg" alt="" />
                                                Login With Email</h3>
                                        </div>
                                        <div style="padding-top: 80px;">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="txtuid" placeholder="Enter Your Email Id" ></div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input type="password" class="form-control" id="txtpass" placeholder="Enter Your Password"></div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input type="button" class="form-control" value="LOGIN" onclick="ValidateLogin()"></div>
                                            </div>
                                            <div class="col-md-7 col-md-offset-5"><a class="clsForgotPsw">Forgot password? </a></div>
                                            <div class="col-md-11 alert-box">
                                                <div class="alert alert-success" id="logindone" style="display: none;">
                                                    <strong>Success!</strong> Indicates a successful or positive action.
                                                </div>
                                                <div class="alert alert-danger" id="loginfail" style="display: none;">
                                                    <strong>Error !&nbsp;&nbsp;</strong>The email and password you entered don't match..
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-11">
                                            <div class="login-bottom-item">
                                                <p>New to Russsh? <a class="clsSignUp">Sign Up</a></p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="clsSlide login-container" id="resetpassworddiv">
                                        <div class="col-md-12">
                                            <h3>
                                                <img class="clsLogin2" src="https://www.russsh.com/images/russsh-icons/backarrow.svg" alt="" />
                                                Reset Password</h3>
                                        </div>
                                        <div style="padding-top: 100px;">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="Enter Your Email Id or Mobile No" ></div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input type="button" id="OTP" class="form-control" value="SEND REQUEST"></div>
                                            </div>
                                        </div>
                                    </div>



                                    <div class="clsSlide login-container" id="otpwindow">
                                        <div class="col-md-12">
                                            <h3>
                                                <img class="clsLogin2" src="https://www.russsh.com/images/russsh-icons/backarrow.svg" alt="" />
                                                Enter Your OTP</h3>
                                        </div>
                                        <div style="padding-top: 100px;">
                                            <div class="col-md-12">

                                                <div class="form-group">
                                                    <input id="change-psw" type="text" class="form-control" placeholder="Enter Your OTP number"></div>
                                                <div class="form-group">
                                                    <input id="reg-otp" type="text" class="form-control" placeholder="Enter Your OTP number"></div>
                                            </div>
                                            <div class="col-md-6 col-md-offset-6">
                                                <a href="#">Resend OTP</a>
                                            </div>
                                            <div class="row paddingtb-20 alert-box">
                                                <div class="col-md-10" style="margin-top: 10px;">
                                                    <div class="alert alert-success">
                                                        <strong>Success!</strong> successful or positive action.
                                                    </div>
                                                </div>
                                                <div class="col-md-10">
                                                    <div class="alert alert-danger">
                                                        <strong>Error !</strong> Indicates a error or negative action.
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="clsSlide login-container">
                                        <div class="col-md-12">
                                            <h3>
                                                <img class="clsLogin2" src="https://www.russsh.com/images/russsh-icons/backarrow.svg" alt="" />
                                                Change Password</h3>
                                        </div>
                                        <div style="padding-top: 5px;">
                                            <div class="col-md-11 paddingtb-20">
                                                <p class="text-center">Please select a new password for your Russsh
                                                    <br />
                                                    Account 99303005054</p>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input type="password" class="form-control" placeholder="New Password"></div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input type="password" class="form-control" placeholder="Confirm New Password"></div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input type="button" class="form-control" value="SUBMIT"></div>
                                            </div>
                                            <div class="col-md-11 alert-box">
                                                <div class="alert alert-danger">
                                                    <strong>Error !</strong> Indicates a error or negative action.
                                                </div>
                                            </div>
                                            <div class="col-md-11 alert-box">
                                                <div class="alert alert-success">
                                                    <strong>Success!</strong> successful or positive action.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- Login End -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<asp:HiddenField ID="sendedotp" runat="server" />
<asp:HiddenField ID="clientid" runat="server" />
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
<script src="https://www.russsh.com/plugin/tabbed/js/jstab.js"></script>
