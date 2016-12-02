<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="MyAddress_T_Default" %>

<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/Footer.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Task - Save Address</title>
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
    <script type="text/javascript">
        function fnchange() {
            var aid = document.getElementById("pickuparea").value;
            $.ajax({
                url: "../BookTask/GetPincode.ashx",
                contentType: "application/text; charset=utf-8",
                data: {
                    'AreaId': aid
                },
                success: ppcode,
                error: pfail
            });
            return false;
        }
        function ppcode(result) {
            var pincode = result;
        }
        function pfail() {

        }
        $(document).ready(function () {
            {
                $.ajax({
                    type: "GET",
                    url: "../BookTask/Areas.xml",
                    dataType: "xml",
                    success: function (xml) {
                        var select = document.getElementById("pickuparea");
                        var i = 0;
                        var option = document.createElement('option');
                        $(xml).find('AREAS').each(function () {

                            var sValue = $(this).find('Area_ID').text();
                            var sText = $(this).find('Area_Name').text();
                            i = i + 1;
                            var option1 = document.createElement('option');
                            option1.text = sText;
                            option1.value = sValue;
                            select.add(option1, i);
                        });
                    },
                    error: function () {
                       // alert("An error occurred while processing XML file.");
                    }
                });
            }
        });

        function FillAdd(elm) {
            //alert($(elm).attr('data-id'));
            $("#address").modal('show');
            var ClientId = '<%= Session["CLIENT_ID"] %>';
            var addressline = $(elm).attr('data-id');
            var alldata = $(elm).attr('data-id')
            var values = addressline.split('^');
            var addid = $(elm).attr('data-aid')
            var Name = values[0].replace("~", " ");
            var mobile = values[2].replace("~", " ");
            var aline = values[3].replace("~", " ");
            var landmark = values[4].replace("~", " ");
            var area = values[5].replace("~", " ");
            var pincode = values[6].replace("~", " ");
            var aid = values[7].replace("~", " ");
            var cat = values[8].replace("~", " ");
            var lname = values[1].replace("~", " ");
            var favcat = values[9].replace("~", " ");
            var addlabel = values[10].replace("~", " ");
            var fname = Name;
            var lname = lname
            var ddlareaelm = document.getElementById('pickuparea');
			 var Marea = area + ',Mumbai,Maharastra,India';
            $('#txtSource').val(Marea);
            $('#txtDestination').val(Marea);
            SearchRoute();
            ddlareaelm.value = aid;
            $("#t" + cat).click();
            $('#f_name').val(fname);
            $('#aid').val(addid);
            $('#mno').val(mobile);
            $('#location').val(aline);
            $('#lmark').val(landmark);
            $('#pincode').val(pincode);
            $('#IsFlagFav').val(favcat);
            //if (favcat = 'Y') {
            //    $('#IsFlagFav').addClass('fav_star');
            //}
            //else {
            //    $('#IsFlagFav').addClass('star');
            //}
                       
            $('#addtype').val(cat);
            $('#enterurown').val(addlabel);
            $('#pickuparea').val(aid);
            $('#lname').val(lname);
			document.getElementById('name').innerHTML='EDIT ADDRESS';
            
           // DataSave(addid, ClientId, fname, lname, mobile, aline, landmark, 1, aid, pincode, favcat, cat, addlabel, 'Mumbai', ddlareaelm.value);
        }
        function confirmation() {
            var answer = confirm("Are you sure you want to save this address.")
            if (answer) {
                saveadd();
                window.parent.location = window.parent.location.href;
            }
        }
        function refreshPage() {
           // window.location.reload();
        }
        function opendata() {
            $('#f_name').val('');
            $('#mno').val('');
            $('#location').val('');
            $('#lmark').val('');
            $('#pincode').val('');
            $('#IsFlagFav').val('');
            $('#addtype').val('');
            $('#pickuparea').val(0);
            $('#lname').val('');
			document.getElementById('name').innerHTML='ADD NEW ADDRESS';
        }
        function saveadd()
        {
            var aid = 0;
            aid = $('#aid').val();
            var ClientId = '<%= Session["CLIENT_ID"] %>';
            var fname = $('#f_name').val();
            var lastname = $('#lname').val();
            var mobileno = $('#mno').val();
            var Address = $('#location').val();
            var landmark = $('#lmark').val();
            var cityname = $('#ddlcity').innerText;
            var areaname = $('#pickuparea').innerText;
            var pcode = $('#pincode').val();
            var IsFlagFav = $('#IsFlagFav').val();
            var cat = $('#addtype').val();
            var own = $('#enterurown').val();
            var city = $('#ddlcity').val();
            var area = $('#pickuparea').val();
            //alert(aid, ClientId, fname, lastname, mobileno, Address, landmark, cityname, areaname, pcode, IsFlagFav, cat, own, city, area);
            DataSave(aid, ClientId, fname, lastname, mobileno, Address, landmark, "Sample", "Sample", pcode, IsFlagFav, cat, own, city, area);
        }
        function DataSave(aid, ClientId, fname, lastname, mobileno, Address, landmark, cityname, areaname, pcode, IsFlagFav, cat, own, city, area) {

            $.ajax({
                url: "SaveMyAddress.ashx",
                contentType: "application/text; charset=utf-8",
                data: {
                    'AddressID': aid,
                    'ClientID': ClientId,
                    'AddressName': fname,
                    'LastName':lastname,
                    'MobileNo': mobileno,
                    'Address': Address,
                    'Landmark': landmark,
                    'AreaName': areaname,
                    'CityName': cityname,                 
                    'PinCode': pcode,
                    'IsFlagFav': IsFlagFav,
                    'Category': cat,
                    'AddressLabel': own,
                    'CityID': city,
                    'AreaID': area            
                },             
            });
            return false;
        }
        function select(elm) {
           // alert($(elm).attr('data-aid'));
            var aid = $(elm).attr('data-aid')
            SelectData(aid);
            window.parent.location = window.parent.location.href;
        }
        function SelectData(aid) {

            $.ajax({
                url: "SelectAddress.ashx",
                contentType: "application/text; charset=utf-8",
                data: {
                    'AddressID': aid,
                },
            });
            return false;
        }
        function opclose(elm) {
            //alert($(elm).attr('data-aid'));
            var aid = $(elm).attr('data-aid')
            var answer = confirm("Are you sure you want to delete this address.")
           // alert(answer);
            if (answer) {
                DeleteData(aid);
                window.parent.location = window.parent.location.href;
            }
        }
        function DeleteData(aid) {

            $.ajax({
                url: "DeleteAddress.ashx",
                contentType: "application/text; charset=utf-8",
                data: {
                    'AddressID': aid,
                },
            });
            return false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
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
                    <%-- <div class="_profile_header_pic">
                        <img src="../img/user.png" alt=""  />
                        <h3 id="profilename1" runat="server"></h3>
                        <p id="addressplace" runat="server"></p>
                    </div>--%>
                     <div class="_profile_header_pic">
                               <div id="profileimg" runat="server"><img src="../img/user.png" alt="" /></div>
                            <h3 id="ProfileName1" style="text-transform:capitalize;" name="ProfileName1" runat="server"></h3>
						  <p>Mumbai</p>
                        </div>
                </div>
                <div class="container profile_tab_window">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <div>
                                <div class="profile-tab">
                                    <ul class="col-md-2 col-sm-3">
                                        <li><a href="../EditProfile/">MY PROFILE</a></li>
                                    <li ><a href="../ChangePassword/">CHANGE PASSWORD</a></li>
                                    <li><a href="../Wallet/">RUSSSHPAY</a></li>
                                    <li><a href="../Orders/">MY DELIVERIES</a></li>
                                    <li class="active"><a href="../EditAddress/">MY ADDRESSES</a></li>

                                    </ul>
                                </div>
                                <div class="col-md-10 col-sm-9" style="margin: 0; padding: 0">
                                    <div class="profile-content" style="display: block;">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="profile_body row">
                                                    <div class="col-md-11">
                                                        <p>Your Saved Addresses <span onclick="opendata(this)" class="__ad_ddres" data-toggle="modal" data-target="#address">Add Address &nbsp;<i class="fa fa-plus"></i></span></p>
                                                        <h4 class="name" id="profilename2" runat="server"></h4>
                                                        <div  id="accordion" runat="server">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <img src="../img/saved_address.svg" class="center-block" style="padding-top: 150px;">
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
                <div class="modal" id="address" runat="server" tabindex="-1" role="dialog" aria-hidden="true" data-appear-animation="bounceInUp" data-appear-animation-delay="70">
                    <div class="modal-dialog bt_box">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="row">
                                    <a class="bt-close" data-dismiss="modal">
                                        <img src="../img/close-icon.svg" height="15" onclick="refreshPage()" width="14" alt="" />
                                    </a>
                                    <div class="bt_body" style="height: 100%;">
                                        <div class="row">
                                            <div class="col-md-6" style="padding-right: 30px;">
                                                <div class="address-tab1">
                                                      <h3 class="address-title"><label id="name"></label></h3>
                                                    <ul class="col-md-12 col-xs-12" id="category">
                                                        <li class="active col-xs-4"><a href="#home" id="t0" data-id="0" onclick="office(this)">Home</a></li>
                                                        <li class="col-xs-4"><a href="#home" id="t1" data-id="1" onclick="office(this)">Office</a></li>
                                                        <li class="col-xs-4"><a href="#home" id="t2" data-id="2" onclick="others(this)">Others</a></li>
                                                    </ul>
                                                </div>
                                                <div id="home" class="address-content1">
                                                    <div class="address-scroll">
                                                        <div id="other_show" class="row adds-form" style="display: none;">
                                                            <div class="col-md-12 col-xs-12 adds-element">
                                                              <%--  <input id="addressid" type="text" />--%>
                                                                <input id="enterurown" type="text" class="form-control" placeholder="Enter Your Own Label" />
                                                            </div>
                                                        </div>
                                                        <div class="row adds-form">
                                                            <div class="col-md-6 col-xs-6 adds-element bdr-right">
                                                                <input id="f_name" type="text" class="form-control" placeholder="First Name" />
                                                                <img id="f_edit" class="_edit" src="../img/edit.png" alt="" />
                                                            </div>
                                                            <div class="col-md-6 col-xs-6 adds-element">
                                                                <input id="lname" type="text" class="form-control" placeholder="Last Name"  />
                                                                <img id="l_edit" class="_edit" src="../img/edit.png" alt="" />
                                                            </div>
                                                        </div>
                                                        <div class="row adds-form">
                                                            <div class="col-md-12 col-xs-12 adds-element">
                                                                <input id="mno" type="text" class="form-control" onkeypress="return isNumberKey(event)"  placeholder="Mobile No" />
                                                                <img id="no_edit" class="_edit" src="../img/edit.png" alt="" />
                                                            </div>
                                                        </div>
                                                        <div class="row adds-form">
                                                            <div class="col-md-12 col-xs-12 adds-element">
                                                                <input id="location" type="text" class="form-control" placeholder="Address" />
                                                                <img id="loc_edit" class="_edit" src="../img/edit.png" alt="" />
                                                            </div>
                                                        </div>
                                                         <div class="row adds-form">
                                                            <div class="col-md-12 col-xs-12 adds-element">
                                                                <input id="lmark" type="text" class="form-control" placeholder="Landmark" />
                                                                <img id="mark_edit" class="_edit" src="../img/edit.png" alt="" />
                                                            </div>
                                                        </div>
                                                        <div class="row adds-form">
                                                            <div class="col-md-12 col-xs-12 adds-element" style="line-height: 12px; margin-top: -4px;">
                                                                <select id="ddlcity" class="select-style" style="padding-left:1px;">
                                                                    <option value="1">Mumbai</option>
                                                                    <%--<option>Pune</option>--%>
                                                                </select>
                                                                
                                                            </div>
                                                        </div>
                                                        <div class="row adds-form">
                                                            <div class="col-md-12 col-xs-12" style="line-height: 12px; margin-top: -4px;" >
                                                                <select class="select-style" id="pickuparea" name="pickuparea" onchange="fnchange();">
                                                                    <option value="0" selected="selected">Select Area</option>
                                                                </select>
                                                                
                                                            </div>
                                                        </div>
                                                        <div class="row adds-form" style="display: none;">
                                                            <div class="col-md-12 col-xs-12 adds-element">
                                                                <input id="pincode" type="text" class="form-control" placeholder="Pincode"  onkeypress="return isNumberKey(event)" />
                                                                <img id="pin_edit" class="_edit" src="../img/edit.png" alt="" />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <button id="save_addr" type="button" class="btn btn_reset" onclick="confirmation()" >SAVE ADDRESS</button>
                                                            <input id="addtype" type ="hidden" />
                                                              <input id="aid" type ="hidden" value="0" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 hidden-xs hidden-sm" style="border-left: 1px solid #eee;">
                                                <div class="__star" style="display:none;"><i class="fa fa-star star" id="IsFlagFav"  runat="server"></i></div>               <div id="track-map" style="margin-top: 25px; height: 448px; padding-right: 0px; padding-left: 5px;">
                                                <img src="../img/map_view.png"  class="img-responsive" alt=""  />
												</div></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="../code.jquery.com/jquery-latest.min.js"></script>
                <!-- Jquery Library Call -->
                <script src="../js-web/helper-plugins.js"></script>
                <!-- Plugins -->
                <script src="../js-web/bootstrap.js"></script>
                <!-- UI -->
                <script src="../bt-js/select-style.js"></script>
                <!-- select style-->
                <script src="../bt-js/enscroll-0.6.2.min.js"></script>
                <!-- scrollstyle-->
                <script type="text/javascript">
                    $('.address-scroll').enscroll({
                        showOnHover: true,
                        verticalTrackClass: 'track3',
                        verticalHandleClass: 'handle3'
                    });
                </script>

                <script type="text/javascript">
                    $(document).ready(function () {
                        $(".address-tab1 a").click(function (event) {
                            event.preventDefault();
                            $(this).parent().addClass("active");
                            $(this).parent().siblings().removeClass("active");
                            var tab = $(this).attr("href");
                            $(".address-content1").not(tab).css("display", "none");
                            $(tab).fadeIn('slow');
                        });
                    });

                    $("#f_edit").click(function () {
                        $("#f_name").removeAttr("disabled").focus();
                        $("#f_name").val("");
                        $("#f_edit").attr("src", "../img/Un-Selec.png");
                    });

                    $('#f_name').keyup(function () {
                        if ($(this).val().length == 0) {
                            $("#save_addr").css("background", "#CCC");
                            $("#f_edit").attr("src", "../img/Un-Selec.png");
                        }
                        else {
                            $("#save_addr").css("background", "#f0713e");
                            $("#f_edit").attr("src", "../img/Tick-Select.png");
                        }
                    });
                    ///////
                    $("#l_edit").click(function () {
                        $("#lname").removeAttr("disabled").focus();
                        $("#lname").val("");
                        $("#l_edit").attr("src", "../img/Un-Selec.png");
                    });

                    $('#lname').keyup(function () {
                        if ($(this).val().length == 0) {
                            $("#save_addr").css("background", "#CCC");
                            $("#l_edit").attr("src", "../img/Un-Selec.png");
                        }
                        else {
                            $("#save_addr").css("background", "#f0713e");
                            $("#l_edit").attr("src", "../img/Tick-Select.png");
                        }
                    });
                    ///////////////////
                    function isNumberKey(evt) {
                        var charCode = (evt.which) ? evt.which : event.keyCode
                        if (charCode > 31 && (charCode < 48 || charCode > 57))
                            return false;
                        return true;
                    }
                    function isNumber(o) {
                        return !isNaN(o - 0);
                    }

                    $("#mno").keyup(function (e) {
                        txtVal = $(this).val();
                        if (isNumber(txtVal) && txtVal.length > 9) {
                            $(this).val(txtVal.substring(0, 10));
                            $("#no_edit").attr("src", "../img/Tick-Select.png");
                        }
                        else {
                            $("#no_edit").attr("src", "../img/Un-Selec.png");
                        }
                    });
                    $("#no_edit").click(function () {
                        $("#mno").removeAttr("disabled").focus();
                        $("#mno").val("");
                        $("#no_edit").attr("src", "../img/Un-Selec.png");
                    });

                    ///////////////////
                    $("#loc_edit").click(function () {
                        $("#location").removeAttr("disabled").focus();
                        $("#location").val("");
                        $("#loc_edit").attr("src", "../img/Un-Selec.png");
                    });

                    $('#location').keyup(function () {
                        if ($(this).val().length == 10) {
                            $("#save_addr").css("background", "#CCC");
                            $("#loc_edit").attr("src", "../img/Un-Selec.png");
                        }
                        else {
                            $("#save_addr").css("background", "#f0713e");
                            $("#loc_edit").attr("src", "../img/Tick-Select.png");
                        }
                    });
                    ///////////////////
                    $("#mark_edit").click(function () {
                        $("#lmark").removeAttr("disabled").focus();
                        $("#lmark").val("");
                        $("#mark_edit").attr("src", "../img/Un-Selec.png");
                    });

                    $('#lmark').keyup(function () {
                        if ($(this).val().length == 10) {
                            $("#save_addr").css("background", "#CCC");
                            $("#mark_edit").attr("src", "../img/Un-Selec.png");
                        }
                        else {
                            $("#save_addr").css("background", "#f0713e");
                            $("#mark_edit").attr("src", "../img/Tick-Select.png");
                        }
                    });
                    ///////////////
                    function isNumberKey(evt) {
                        var charCode = (evt.which) ? evt.which : event.keyCode
                        if (charCode > 31 && (charCode < 48 || charCode > 57))
                            return false;
                        return true;
                    }
                    function isNumber(o) {
                        return !isNaN(o - 0);
                    }
                    $("#pincode").keyup(function (e) {
                        txtVal1 = $(this).val();
                        if (isNumber(txtVal1) && txtVal1.length > 6) {
                            $(this).val(txtVal1.substring(0, 6));
                            $("#pin_edit").attr("src", "../img/Tick-Select.png");
                        }
                        else {
                            $("#pin_edit").attr("src", "../img/Un-Selec.png");
                        }
                    });
                    $("#pin_edit").click(function () {
                        $("#pincode").removeAttr("disabled").focus();
                        $("#pincode").val("");
                        $("#pin_edit").attr("src", "../img/Un-Selec.png");
                    });
                   
                    ///////////////
                   
                    //function opclose(elm) {
                    //    $("#address").modal('hide');

                    //    // alert($(elm).attr('data-id'));
                    //}
                </script>
                <script src="../bt-js/bt-init.js"></script>
                <!-- bt-init -->
                <script type="text/javascript" src="../bt-js/jquery.label_better.js"></script>
                <script>
                    $(document).ready(function () {
                        $(".label_better").label_better({
                            easing: "bounce"
                        });
                    });
                </script>
            </div>
        </div>
	  <%--Map Script--%>

        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCrB9n3LnOWgQy3dUapyuZY0jCx0MadqiI"></script>
       
       <%-- <%--Map Script--%>

       
        <script type="text/javascript">
            if (navigator.geolocation) {

                // navigator.geolocation.getCurrentPosition(success);

            } else {

                alert("There is Some Problem on your current browser to get Geo Location!");
            }

            function success(position) {
                var lat = position.coords.latitude;
                var long = position.coords.longitude;
                var city = position.coords.locality;
                var LatLng = new google.maps.LatLng(lat, long);
                var mapOptions = {
                    center: LatLng,
                    zoom: 1,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    //size:12
                };

                var map = new google.maps.Map(document.getElementById("track-map"), mapOptions);
                map.setCenter(LatLng);
                var marker = new google.maps.Marker({
                    position: LatLng,
                    title: "<div style = 'height:60px;width:200px'><b>Your location:</b><br />Latitude: "
                                + lat + +"<br />Longitude: " + long
                });
               // map.setZoom(100);
                //marker.setMap(map);
                var getInfoWindow = new google.maps.InfoWindow({
                    content: "<b>Your Current Location</b><br/> Latitude:" +
                                            lat + "<br /> Longitude:" + long + ""
                });
                getInfoWindow.open(map, marker);
            }
        </script>
        <script type="text/javascript">

            function SearchRoute() {
                //  document.getElementById("track-map").style.display = 'none';
                // alert ('Js call');

                var markers = new Array();
                var myLatLng;
                //var myLatLng = new google.maps.LatLng(p.coords.latitude, p.coords.longitude);
                if (document.getElementById("txtSource").value.length > 1 && document.getElementById("txtDestination").value.length > 1) {
                    var m = {};
                    var address1 = document.getElementById("txtSource").value;
                    //m.title = "Your Current Location";
                    //m.lat = p.coords.latitude;
                    //m.lng = p.coords.longitude;
                    //markers.push(m);
                    var geocoder = new google.maps.Geocoder();
                    //Find source lang lat from area name 
                    geocoder.geocode({ 'address': address1 }, function (results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            m = {};
                            m.title = address1;
                            m.lat = results[0].geometry.location.lat();
                            m.lng = results[0].geometry.location.lng();
                            markers.push(m);
                        }
                    });
                    //Find Destination address location.
                    var address = document.getElementById("txtDestination").value;

                    geocoder.geocode({ 'address': address }, function (results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            m = {};
                            m.title = address;
                            m.lat = results[0].geometry.location.lat();
                            m.lng = results[0].geometry.location.lng();
                            markers.push(m);
                            var mapOptions = {
                                center: myLatLng,
                               // zoom:1,
                                mapTypeId: google.maps.MapTypeId.ROADMAP
                            };
                            var map = new google.maps.Map(document.getElementById("track-map"), mapOptions);
                            var infoWindow = new google.maps.InfoWindow();
                            var lat_lng = new Array();
                            var latlngbounds = new google.maps.LatLngBounds();

                            for (i = 0; i < markers.length; i++) {
                                var data = markers[i];
                                var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                                lat_lng.push(myLatlng);
                                var marker = new google.maps.Marker({
                                    position: myLatlng,
                                   // zoom: 1,
                                    map: map,
                                    title: data.title
                                });
                                latlngbounds.extend(marker.position);
                                (function (marker, data) {
                                    google.maps.event.addListener(marker, "click", function (e) {
                                        infoWindow.setContent(data.title);
                                        infoWindow.open(map, marker);
                                    });
                                })(marker, data);
                            }
                          //  map.setCenter(latlngbounds.getCenter());
                            map.fitBounds(latlngbounds);

                            //***********ROUTING****************//

                            //Initialize the Path Array.
                            var path = new google.maps.MVCArray();

                            //Getting the Direction Service.
                            var service = new google.maps.DirectionsService();

                            //Set the Path Stroke Color.
                            var poly = new google.maps.Polyline({ map: map, strokeColor: '#4986E7' });

                            //Loop and Draw Path Route between the Points on MAP.
                            for (var i = 0; i < lat_lng.length; i++) {
                                if ((i + 1) < lat_lng.length) {
                                    var src = lat_lng[i];
                                    var des = lat_lng[i + 1];
                                    path.push(src);
                                    poly.setPath(path);
                                    service.route({
                                        origin: src,
                                        destination: des,
                                        travelMode: google.maps.DirectionsTravelMode.DRIVING
                                    }, function (result, status) {
                                        //if (status == google.maps.DirectionsStatus.OK) {
                                        //    for (var i = 0, len = result.routes[0].overview_path.length; i < len; i++) {
                                        //        path.push(result.routes[0].overview_path[i]);
                                        //    }
                                        //} else {
                                        //    alert("Invalid location.");
                                        //    window.location.href = window.location.href;
                                        //}
                                    });
                                }
                            }
                        } else {
                            alert("Request failed.")
                        }
                    });
                }
            }

        </script>
        <%--Map Script End--%>
        <div style="width: 1px; height: 1px; overflow: hidden;">
            <input type="text" id="txtSource" value="Bandra, Mumbai, India" runat="server" style="width: 200px" />
            <input type="text" id="txtDestination" value="Andheri, Mumbai, India" runat="server" style="width: 200px" />
            <input type="button" value="Get Route" onclick="SearchRoute()" />
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
