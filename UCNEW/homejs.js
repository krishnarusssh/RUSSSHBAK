
	 <script type="text/javascript">
	     function ValidateLogin() {
	         $('#loginfail').css("display", "none");
	         var Userid = $('#txtuid').val();
	         var pass = $('#txtpass').val();

	         $.ajax({
	             url: "ValidateLogin.ashx",
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

	     function OnComplete(result) {
	         var values = result.split(',');
	         var cid = values[0];
	         if (cid > 0) {

	             // window.open("https://www.russsh.com/about-us/Test.aspx?CLIENT_ID=" + cid + "&CLIENT_CONTACT=" + values[2] + "&CLIENT_NAME=" + values[1], "_self");
	             window.open("https://www.russsh.com/BookTask", "_self");
	         }
	         else {
	             $('#loginfail').css("display", "block");
	         }
	     }


	     function FbClick() {
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

    function Signin() {
        $('#signupfail').css("display", "none");
        var Uname = 'N';
        var Pass = 'N';
        var Email = 'N';
        var Mobile = 'N';
        Uname = $('#Footer1_txtsname').val();
        Pass = $('#txtspass').val();
        Email = $('#Footer1_txtsemail').val();
        Mobile = $('#txtsmobile').val();
        $('#change-psw').css("display", "none");
        if (Uname != '' && Pass != '' && Email != '' && Mobile != '') {
            $.ajax({
                url: "Signin.ashx",
                contentType: "application/text; charset=utf-8",
                data: {
                    'Name': Uname,
                    'Password': Pass,
                    'Email': Email,
                    'Pass': Pass,
                    'Mobile': Mobile
                },
                success: SigninComplete,
                error: SigninFail
            });
        }
        else {
            $('#signupfail').css("display", "block");
            $('#signupfail').text('All fields are mandatory.');
            return false;

        }
    }

    function SigninComplete(result) {

        $('#otp-msgdiv').css("display", "none");
        $('#otp-msgdiv1').css("display", "none");
        var values = result.split(',');
        var otp = values[0];
        $('#Footer1_sendedotp').val(otp);
        var status = values[1];
        $('#Footer1_clientid').val(values[2]);

        if (status == 'E') {
            $('#signupfail').css("display", "block");
            $('#signupfail').text('EmailId or Mobile Registered with us ...');


            //window.open("https://www.russsh.com/about-us/Test.aspx?CLIENT_ID=" + cid + "&CLIENT_CONTACT=" + values[2] + "&CLIENT_NAME=" + values[1], "_self");
            //window.open("https://www.russsh.com/BookTask", "_self");
        }
        else {

            document.getElementById("logindiv").style.display = 'none';
            document.getElementById("resetpassworddiv").style.display = 'none';
            $('.clsContainer').animate({ left: '-857' }, 300);

        }

    }

    function SigninFail(result) {
        alert('Request Failed');
    }

    function checkotp() {

        var otp = $('#reg-otp').val();
        var otp1 = $('#change-psw').val();
        if (otp != '') {
            var sendedotp = $('#Footer1_sendedotp').val();

            var cid = $('#Footer1_clientid').val();
            var n = otp.length;
            if (otp == sendedotp) {
                //document.getElementById("otpwindow").style.display = 'none';
                // document.getElementById("resetpassworddiv").style.display = 'none';

                //$('.clsContainer').animate({ left: '-857' }, 300);
                alert('Congrats! Your account is successfully up with Russsh. Please log in to continue.  ');
                window.open("Default.aspx", "_self");
            }
            else {
                $('#otp-msgdiv1').css("display", "block");
                $('#otp-msgdiv1').text('OTP Dosnt Match.');
            }
        }
        else {
            if (otp1 != '') {
                $('#id').text($('#txtforgot').val());
                $('#passdiv1').css("display", "none");
                $('#passdiv2').css("display", "none");


                var sendedotp = $('#Footer1_sendedotp').val();
                document.getElementById("otpwindow").style.display = 'none';
                document.getElementById("resetpassworddiv").style.display = 'none';

                $('.clsContainer').animate({ left: '-857' }, 300);
            }
            else {

                $('#otp-msgdiv1').css("display", "block");
                $('#otp-msgdiv1').text('Please enter OTP.');
            }
        }
    }
    function Complete(result) {

        if (result == "Y") {
            alert("Mobile Number Verified..");
            window.open("Default.aspx", "_self");
        }

    }
    function Fail() {

    }
    function resendotp() {
        var Uname = 'N';
        var Mobile = 'N';
        Uname = $('#Footer1_txtsname').val();
        Mobile = $('#txtsmobile').val();

        if (Mobile != '') {
            $.ajax({
                url: "ResendOTP.ashx",
                contentType: "application/text; charset=utf-8",
                data: {
                    'Name': Uname,
                    'Mobile': Mobile
                },
                success: ROTPComplete,
                error: ROTPFail
            });
        }
        else {
            var id = $('#txtforgot').val();
            if (id != '') {
                if (id.length == 10) {
                    $.ajax({
                        url: "ForgotPasswordSendotp.ashx",
                        contentType: "application/text; charset=utf-8",
                        data: {
                            'type': 'Mobile',
                            'destination': id
                        },
                        success: OTPSend1,
                        error: OTPFail1
                    });

                }
                else {
                    $.ajax({
                        url: "ForgotPasswordSendotp.ashx",
                        contentType: "application/text; charset=utf-8",
                        data: {
                            'type': 'Email',
                            'destination': id
                        },
                        success: OTPSend1,
                        error: OTPFail1
                    });
                }
                //$('.clsContainer').animate({ left: '-1274' }, 300);
            }
        }

    }
    function OTPSend1() {
        alert('OTP sent successfully');
    }
    function OTPFail1()
    { }
    function ROTPComplete(result) {
        alert('OTP sent successfully');
        $('#Footer1_sendedotp').val(result);
    }
    function ROTPFail() {

    }

    function onsign() {
        alert('on loasd');

    }

    function SendOTP() {
        var id = $('#txtforgot').val();
        $('#reg-otp').css("display", "none");
        $('#otp-msgdiv').css("display", "none");
        $('#otp-msgdiv1').css("display", "none");
        //url: "https://www.russsh.com/Handler/ForgotPasswordSendotp.ashx",
        if (id != '') {
            if (id.length == 10) {
                $.ajax({
                    url: "ForgotPasswordSendotp.ashx",
                    contentType: "application/text; charset=utf-8",
                    data: {
                        'type': 'Mobile',
                        'destination': id
                    },
                    success: OTPSend,
                    error: OTPFail
                });

            }
            else {
                $.ajax({
                    url: "ForgotPasswordSendotp.ashx",
                    contentType: "application/text; charset=utf-8",
                    data: {
                        'type': 'Email',
                        'destination': id
                    },
                    success: OTPSend,
                    error: OTPFail
                });
            }

        }
        else {
            $('#Fpass').css("display", "block");
            $('#Fpass').text('Please enter Email id or Mobile no');
        }
    }
    function OTPSend(result) {
        var values = result.split(',');
        var status = values[0];
        var otp = values[1];
        if (status == 'Y') {
            $('.clsContainer').animate({ left: '-1274' }, 300);
            sendedotp = $('#Footer1_sendedotp').val();
            var otp = $('#change-psw').val();
            if (otp == sendedotp) {

            }
            else {
                $('#Fpass').css("display", "block");
                $('#Fpass').text('OTP Dosnt Match....');
            }
        }
        if (status == 'No') {
            $('#Fpass').css("display", "block");
            $('#Fpass').text('Emailid / Mobile Number not registered with us.');
        }

    }
    function OTPFail() {

    }
    function changepass() {
        var npass = $('#npass').val();
        var cpass = $('#cnfrmpass').val();
        if (npass != '' || cpass != '') {
            if (npass == cpass) {
                $.ajax({
                    url: "Changepass.ashx",
                    contentType: "application/text; charset=utf-8",
                    data: {
                        'Password': npass
                    },
                    success: Passchange,
                    error: PassFail
                });
            }
            else {
                $('#passdiv1').css("display", "block");
                $('#passdiv1').text('Password does not match.');
            }
        }
        else {
            $('#passdiv1').css("display", "block");
            $('#passdiv1').text('Please enter password.');
        }
    }
    function Passchange(result) {
        if (result == "Y") {
            alert('Your Password is changed. Please Login ');
            window.open("Default.aspx", "_self");
        }
    }
    function PassFail() {
        alert('Request Failed ');
    }
    function GoogleClick() {

        window.open("https://www.russsh.com/redirectTogoogle.aspx", "_self");
    }
</script>

<script>
    window.onload = function () {
      try {
            ShowTab1();
        }
        catch (err) {
            
        }

        document.getElementById('txtpass').onkeypress = function searchKeyPress(event) {
            if (event.keyCode == 13) {
                $('#loginfail').css("display", "none");
                var Userid = $('#txtuid').val();
                var pass = $('#txtpass').val();

                $.ajax({
                    url: "ValidateLogin.ashx",
                    contentType: "application/text; charset=utf-8",
                    data: {
                        'Name': Userid,
                        'Password': pass
                    },
                    success: function (data) {
                        var values = data.split(',');
                        var cid = values[0];
                        if (cid > 0) {

                            // window.open("https://www.russsh.com/about-us/Test.aspx?CLIENT_ID=" + cid + "&CLIENT_CONTACT=" + values[2] + "&CLIENT_NAME=" + values[1], "_self");
                            window.open("https://www.russsh.com/BookTask", "_self");
                        }
                        else {
                            $('#loginfail').css("display", "block");
                        }
                    },
                    error: function (e) {
                        alert('Request Failed');
                    }
                });
            }
        };



    }
</script>

<script type="text/javascript">
    window.$zopim || (function (d, s) {
        var z = $zopim = function (c) { z._.push(c) }, $ = z.s =
        d.createElement(s), e = d.getElementsByTagName(s)[0]; z.set = function (o) {
            z.set.
            _.push(o)
        }; z._ = []; z.set._ = []; $.async = !0; $.setAttribute("charset", "utf-8");
        $.src = "https://v2.zopim.com/?3IvlOry2oxwzkoyi9roo9soCHpruqJ6Q"; z.t = +new Date; $.
        type = "text/javascript"; e.parentNode.insertBefore($, e)
    })(document, "script");
</script>
