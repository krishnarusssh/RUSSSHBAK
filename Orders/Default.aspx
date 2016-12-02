<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="MyDeliveries_T_Default" %>

<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/Footer.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Task - My Deliveries</title>
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
    <link href="../css-web/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="tracking.css" />
    <link rel="stylesheet" type="text/css" href="../bt-css/profile_style.css" />
    <!-- profile css -->
    <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <!--[if lt IE 9]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <script type="text/javascript">  
    </script>
    <script src="../js-web/modernizr.js"></script>
    <script type="text/javascript">
        function SearchTask1() {
            var yid = $('#tid').val();
            if (yid == '') {
                //alert('Enter TaskID / TrackingID');
            }
            else {
                var url = 'Default.aspx?TaskID=' + yid;
                window.location.href = url;
            }

            $("#tid").keyup(function (event) {
                if (event.keyCode == 13) {
                    $("#tid").click();
                }
            });
        }

        //function SearchTask11(elm) {
        //    //alert(elm);
        //    var yid = elm;
        //    if (yid == '') {
        //        //alert('Enter TaskID / TrackingID');
        //    }
        //    else {
        //        var url = 'Default.aspx?TaskID=' + yid;
        //        window.location.href = url;
        //    }
        //}
        function sendlink() {
            var url = 'https://www.russsh.com/signin';
            window.location.href = url;
        }
        function confirmation1(elm) {
            //alert($('#txtSub').val());
            //alert($('#txtcomm').val());
            var values = elm.split('@');
            var TaskId = values[0];
            var CancelledBy = values[1];
            var Reason = values[2];
            if (values[2] == 7) {
                Reason = "My reason is not listed?";
            }
            var Subject = ($('#txtSub').val());
            var Comment = ($('#txtcomm').val());
            //var answer = confirm("Are you sure you want to delete this task.")
            //if (answer) {
            DataDelete1(TaskId, CancelledBy, Reason, Subject, Comment);
            window.parent.location = window.parent.location.href + '?mode=1';
            //}
        }
        function confirmation(elm) {
            //alert(elm);
            var values = elm.split('@');
            var TaskId = values[0];
            var CancelledBy = values[1];
            var Reason = values[2];
            if (values[2] == 1) {
                Reason = "Service fee is too expensive";
            }
            else if (values[2] == 2) {
                Reason = "Pick up was delayed";
            }
            else if (values[2] == 3) {
                Reason = "Person at pick up location is not available";
            }
            else if (values[2] == 4) {
                Reason = "Person at delivery point is not available";
            }
            else if (values[2] == 5) {
                Reason = "The parcel is not available";
            }
            else if (values[2] == 6) {
                Reason = "Need to change pick up or drop location";
            }
            // var answer = confirm("Are you sure you want to delete this task.")
            // if (answer) {
            DataDelete(TaskId, CancelledBy, Reason);
            window.parent.location = window.parent.location.href + '?mode=1';
            // }
        }
        function showpop() {
            if (window.location.href == 'https://www.russsh.com/MyDeliveries_T/?mode=1') {
                $(function () {
                    $('#msgalert').text("Task Cancelled Successfully");
                    $("#msgalert").delay(5000).slideUp(0).css("display","block");
                });
            }
            else if (window.location.href == 'https://www.russsh.com/MyDeliveries_T/') {
                $(function () {
                    $("#msgalert").delay(0).hide(0);
                });
            }
        }

        function DataDelete(TaskId, CancelledBy, Reason) {

            $.ajax({
                url: "CancelTask.ashx",
                contentType: "application/text; charset=utf-8",
                data: {
                    'TaskId': TaskId,
                    'CancelledBy': CancelledBy,
                    'Reason': Reason
                },
            });
            //alert('Task cancelled successfully');
            return false;
        }
        function DataDelete1(TaskId, CancelledBy, Reason, Subject, Comment) {

            $.ajax({
                url: "CancelTaskwithSub.ashx",
                contentType: "application/text; charset=utf-8",
                data: {
                    'TaskId': TaskId,
                    'CancelledBy': CancelledBy,
                    'Reason': Reason,
                    'Subject': Subject,
                    'Comment': Comment
                },
            });
            //alert('Task cancelled successfully');
            return false;
        }
        $(".notify-trigger").click(function () {
            $(".notify_box").fadeToggle("slow", "linear");
            setTimeout(function () { $(".notify_box").slideUp(500) }, 8000);
        });
    </script>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.0.3.min.js"></script>
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-65976441-1', 'auto');
        ga('send', 'pageview');
    </script>
    <!-- Modernizr -->
</head>
<body>
    <script type="text/javascript">
        showpop();
    </script>
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
            <div class="notify_box" id="msgalert"></div>
            <header class="__header"></header>
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
                        <div id="profileimg" runat="server">
                            <img src="../img/user.png" alt="" />
                        </div>
                        <h3 id="ProfileName1" style="text-transform: capitalize;" name="ProfileName1" runat="server"></h3>
                        <p>Mumbai</p>
                    </div>
                </div>
                <div class="container profile_tab_window">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <div class="profile-tab">
                                <ul class="col-md-2 col-sm-3">
                                    <li><a href="../EditProfile/">MY PROFILE</a></li>
                                    <li><a href="../ChangePassword/">CHANGE PASSWORD</a></li>
                                    <li><a href="../Wallet/">RUSSSHPAY</a></li>
                                    <li class="active"><a href="../Orders/">MY DELIVERIES</a></li>
                                    <li><a href="../EditAddress/">MY ADDRESSES</a></li>

                                </ul>
                            </div>
                            <div class="col-md-10 col-sm-9" style="margin: 0; padding: 0">
                                <div class="profile-content" style="overflow: hidden; padding: 0; margin-bottom: 50px; display: block; overflow-x: hidden;">
                                    <section>
                                        <div class="container hidden-lg hidden-md">
                                            <div class="row" style="padding-bottom: 60px;">
                                                <span id="plus-icon" class="plus-icon">
                                                    <i class="fa fa-plus-circle"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-sm-4 left-pane mobile-hidden">
                                                    <div class="sidebar">
                                                        <div class="side-search">
                                                            <input id="tid" type="text" class="form-control" placeholder="Search By Tracking Id" onclick="SearchTask1()" />
                                                            <i class="search-icon fa fa-search"></i>
                                                        </div>
                                                        <div id="accordion" runat="server">
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="right-pane col-sm-6" id="divright" runat="server">
                                                    <div id="track-map" class="row map-layer"></div>
                                                    <div class="map-overlay map-timebar">
                                                        <h4>TRACK YOUR ORDER</h4>
                                                    </div>
                                                <%--   <div class="map-overlay map-timebar">
                                                       <iframe src="taskdata.aspx" height="300" width="250"></iframe>
                                                    </div>--%>
                                                    <div class="map-overlay"></div>
                                                    <div class="row">
                                                        <div class="order">
                                                            <div class="order-title">
                                                                <div class="order-today col-md-offset-1" style="margin-left: 32px;">
                                                                    <span class="order-line"></span>
                                                                    <span class="label label-today" id="lblday" runat="server">TODAY</span>
                                                                    <span class="time" id="Htime" runat="server"></span>
                                                                    <span class="clock">
                                                                        <ul>
                                                                            <li id="hours"></li>
                                                                            <li class="point">:</li>
                                                                            <li id="min"></li>
                                                                            <li class="point">:</li>
                                                                            <li id="sec"></li>
                                                                        </ul>
                                                                    </span>
                                                                    <span class="pull-right wheather">
                                                                        <img src="../tracking/images/rain.svg" id="wimg" width="25" height="25" alt="" runat="server" />
                                                                        <span id="temp"></span><sup>o</sup>C
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <div class="order-ins-container clearfix">
                                                                <div class="order-ins clearfix">
                                                                    <div class="order-ins-time text-center">
                                                                        <p><span id="btime" runat="server"></span></p>
                                                                    </div>
                                                                    <div class="order-ins-sen">
                                                                        <div class="task-circle"></div>
                                                                        <p class="title">BOOK A DELIVERY</p>
                                                                        <p class="text-body"><span id="tcat" runat="server"></span>|&nbsp; <i class="fa fa-rupee"></i>&nbsp;<span id="ttotal" runat="server"></span></p>
                                                                    </div>
                                                                </div>
                                                                <div class="order-ins clearfix" id="confirm" runat="server">
                                                                    <div class="order-ins-time text-center">
                                                                        <p><span id="ctime" runat="server"></span></p>
                                                                    </div>
                                                                    <div class="order-ins-sen">
                                                                        <div class="task-circle" id="divconf" runat="server"></div>
                                                                        <p class="title">BOOKING ACCEPTED</p>
                                                                        <div class="con-body">
                                                                            <div class="row">
                                                                                <div class="col-sm-2 col-xs-3">
                                                                                    <img class="img-circle img-responsive" style="padding-top: 10px;" src="https://www.russsh.com/tracking/images/delivery-boy.svg" width="55" height="55" alt="" />
                                                                                </div>
                                                                                <div class="col-sm-10 col-xs-9">
                                                                                    <div class="row">
                                                                                        <p class="text-body"><span id="ename" runat="server"></span>&nbsp;has accepted your order</p>
                                                                                        <div style="padding-top: 10px;">
                                                                                            &nbsp;&nbsp;
                                                                                            <span data-toggle="modal" data-target="#rating" style="color: #71cd50;"><i class="fa fa-phone" aria-hidden="true"></i><span id="emobile" runat="server"></span></span>
                                                                                            <%-- <span><a style="color: #DA3B50;" href="#" data-toggle="modal" data-target="#track-home"><i class="fa fa-life-ring" aria-hidden="true"></i>&nbsp;HELP</a></span>--%>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="order-ins clearfix" id="pdone" runat="server">
                                                                    <div class="order-ins-time text-center">
                                                                        <p><span id="ptime" runat="server"></span></p>
                                                                    </div>
                                                                    <div class="order-ins-sen">
                                                                        <div class="task-circle" id="divpickup" runat="server"></div>
                                                                        <p class="title">PICKUP PACKAGE</p>
                                                                        <p class="text-body"><span id="padd" runat="server"></span></p>
                                                                        <p class="text-body"><span id="pno" runat="server"></span></p>
                                                                    </div>
                                                                </div>
                                                                <div class="order-ins clearfix" id="ddone" runat="server">
                                                                    <div class="order-ins-time text-center">
                                                                        <p><span id="dtime" runat="server"></span></p>
                                                                    </div>
                                                                    <div class="order-ins-sen">
                                                                        <div class="task-circle" id="divdrop" runat="server"></div>
                                                                        <p class="title">DROP PACKAGE</p>
                                                                        <p class="text-body"><span id="dadd" runat="server"></span></p>
                                                                        <p class="text-body"><span id="dno" runat="server"></span></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- profile_tab_window  -->
                </div>
                <div style="height: 1px; visibility: hidden">
                    <input type="text" id="txtSource" value="" runat="server" />
                    <input type="text" id="txtDestination" value="" runat="server" />
                </div>
                <!-- profile wrapper -->
                <!-- book task -->
                <script src="../code.jquery.com/jquery-latest.min.js"></script>
                <!-- Jquery Library Call -->
                <script src="../js-web/helper-plugins.js"></script>
                <!-- Plugins -->
                <script src="../js-web/bootstrap.js"></script>
                <!-- UI -->
		<script>
                    $(document).ready(function () {
                        $("#plus-icon").click(function () {
                            $(".mobile-hidden").slideToggle();
                            $(this).find('i').toggleClass('fa-plus-circle fa-minus-circle');
                        });
                    });
                </script>
                <script type="text/javascript" src="../bt-js/jquery.label_better.js"></script>
                <script>
                    $(document).ready(function () {
                        $(".label_better").label_better({
                            easing: "bounce"
                        });
                    });
                </script>
                <script>
                    $("#cancel,#reason").on('show.bs.modal', function (e) {
                        setTimeout(function () {
                            $('.modal-backdrop').addClass('modal-backdrop-custom');
                        });
                    });
                    $("#customer_feedback").on('show.bs.modal', function (e) {
                        setTimeout(function () {
                            $('.modal-backdrop').addClass('modal-backdrop-own_fdk');
                        });
                    });
                </script>
                <script>
                    $('.order-drop').on('shown.bs.expandable', function () {
                        $(".expand track-gbtn i").removeClass("plus").addClass("minus");
                    });
                    $('.order-drop').on('hidden.bs.expandable', function () {
                        $(".expand track-gbtn i").removeClass("minus").addClass("plus");
                    });
                </script>

                <script>
                    $(document).ready(function () {
                        //window.location.replace("https://www.russsh.com/tracking/Default.aspx");
                        window.history.pushState("Russsh", "Tracking", "https://www.russsh.com/tracking/");
                      
                    });
                </script>
                
                <script type="text/javascript">
                    $('#feedback_trigger,#feedback_close').click(function () {
                        $('#feedback_body #feedback_body_box').slideToggle({
                            direction: "up"
                        }, 400);
                    });
                </script>
                <script src="../bt-js/bt-init.js"></script>
                
                <!-- End -->
                <script src="https://code.jquery.com/jquery.js"></script>
                <%--<script async defer src="https://maps.googleapis.com/maps/api/js??sensor=false&key=AIzaSyCrB9n3LnOWgQy3dUapyuZY0jCx0MadqiI" type="text/javascript"></script>--%>
                <script>
                    function formatItem(item) {
                        return item.Name + ': $' + item.Price;
                    }

                    function find() {
                        var id = $('#prodId').val();
                        $.getJSON(uri + '/' + id)
                            .done(function (data) {
                                $('#product').text(formatItem(data));
                            })
                            .fail(function (jqXHR, textStatus, err) {
                                $('#product').text('Error: ' + err);
                            });
                    }

                </script>
                <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>

                <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCrB9n3LnOWgQy3dUapyuZY0jCx0MadqiI&sensor=false"></script>
                <%--<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDooAr_nJW0oI17y9IJT_5fL_RhrxZsQaA&libraries=places"></script>--%>

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
                            zoom: 12,
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        };

                        var map = new google.maps.Map(document.getElementById("track-map"), mapOptions);
                        var marker = new google.maps.Marker({
                            position: LatLng,
                            title: "<div style = 'height:60px;width:200px'><b>Your location:</b><br />Latitude: "
                                        + lat + +"<br />Longitude: " + long
                        });

                        marker.setMap(map);
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
                        var uri = 'https://api.apixu.com/v1/current.json?key=4f4a929382304590bdf95150161807&q=Mumbai';
                        // Send an AJAX request
                        $.getJSON(uri)
                            .done(function (data) {
                                document.getElementById('wimg').src = data.current.condition.icon;
                                document.getElementById('temp').innerText = data.current.temp_c;
                            });
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
                                        zoom: 4,
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
                                            zoom: 8,
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
                                    map.setCenter(latlngbounds.getCenter());
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
                                                if (status == google.maps.DirectionsStatus.OK) {
                                                    for (var i = 0, len = result.routes[0].overview_path.length; i < len; i++) {
                                                        path.push(result.routes[0].overview_path[i]);
                                                    }
                                                } else {
                                                    alert("Invalid location.");
                                                    window.location.href = window.location.href;
                                                }
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
                <script>
                    $('.expand').click(function () {
                        target_num = $(this).attr('id').split('-')[1];
                        content_id = '#expandable-'.concat(target_num);
                        $(content_id).slideToggle('fast');
                        $(".expand i").toggleClass("minus");
                    });
                </script>
                <!-- bt-init -->
                <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
                <script type="text/javascript">
                    $(document).ready(function () {
                        // Create two variable with the names of the months and days in an array
                        var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
                        var dayNames = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

                        // Create a newDate() object
                        var newDate = new Date();
                        // Extract the current date from Date object
                        newDate.setDate(newDate.getDate());
                        // Output the day, date, month and year    
                        $('#Date').html(dayNames[newDate.getDay()] + " " + newDate.getDate() + ' ' + monthNames[newDate.getMonth()] + ' ' + newDate.getFullYear());

                        setInterval(function () {
                            // Create a newDate() object and extract the seconds of the current time on the visitor's
                            var seconds = new Date().getSeconds();
                            // Add a leading zero to seconds value
                            $("#sec").html((seconds < 10 ? "0" : "") + seconds);
                        }, 1000);

                        setInterval(function () {
                            // Create a newDate() object and extract the minutes of the current time on the visitor's
                            var minutes = new Date().getMinutes();
                            // Add a leading zero to the minutes value
                            $("#min").html((minutes < 10 ? "0" : "") + minutes);
                        }, 1000);

                        setInterval(function () {
                            // Create a newDate() object and extract the hours of the current time on the visitor's
                            var hours = new Date().getHours();
                            // Add a leading zero to the hours value
                            $("#hours").html((hours < 10 ? "0" : "") + hours);
                        }, 1000);
                        SearchRoute();
                    });
                </script>
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
