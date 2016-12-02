<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="confirmationNew_Default" %>

<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/Footer.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0" />
    <title>Book Task - Confirmation</title>
    <link rel="stylesheet" type="text/css" href="../css-web/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../bt-css/profile_style.css" />
    <!-- profile css -->
    <link rel="stylesheet" type="text/css" href="../bt-css/confirmation_css.css" />
    <!-- profile css -->
    <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <!--[if lt IE 9]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <script src="../js-web/modernizr.js"></script>
    <!-- Modernizr -->

    <link href="../css-web/style.css" rel="stylesheet" type="text/css" />
    <link href="../css-web/media-style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../css-web/hover.css" />
    <link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.carousel.min.css" />
    <link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.theme.default.min.css" />
    <link rel="stylesheet" type="text/css" href="../plugin/flex-slider/flexslider.css" />
    <link rel="stylesheet" type="text/css" href="../mega-dropdown/css/style.css" />
    <link rel="stylesheet" type="text/css" href="../plugin/tabbed/css/style.css" />
    <link rel="stylesheet" type="text/css" href="../plugin/login-slider/content-slide.css" />
  <%--   <script type="text/javascript">    
       
    </script>--%>

<script src="https://code.jquery.com/jquery-1.11.1.min.js"> </script>




 <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-65976441-1', 'auto');
  ga('send', 'pageview');

</script>
<script>(function() {
  var _fbq = window._fbq || (window._fbq = []);
  if (!_fbq.loaded) {
    var fbds = document.createElement('script');
    fbds.async = true;
    fbds.src = '//connect.facebook.net/en_US/fbds.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(fbds, s);
    _fbq.loaded = true;
  }
})();
window._fbq = window._fbq || [];
window._fbq.push(['track', '6025954254999', {'value':'0.00','currency':'INR'}]);
</script>
<noscript><img height="1" width="1" alt="" style="display:none" src="https://www.facebook.com/tr?ev=6025954254999&amp;cd[value]=0.00&amp;cd[currency]=INR&amp;noscript=1" /></noscript>

</head>
<body>
     <form id="form1" runat="server">
    <div class="top-header">
        <div class="container">
            <uc:Header ID="Header"
                runat="server"
                MinValue="1"
                MaxValue="10" />
        </div>
    </div>
    <header class="__header"></header>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 paddingtb_30">
                <img src="../img/confirmation_box.svg" class="center-block confirm_img" width="150" alt="" title="" />
            </div>
            <div class="col-md-12 text_body">
                <h2>Thank You!</h2>
                <p> 
                    Your task <span id="taskid"  runat="server"></span> has been created.
                        <br />
                    Check your email shortly for a confirmation of your task.
                </p>
            </div>
        </div>
        <div class="row grey_feedback">
            <div class="col-md-12 text_body">
                <p id="text_fade">We'd like to know what you think of our new booking page.</p>
                <input id="txtans1" type="text" class="form-control" style="display: none;" />
                <input id="txtans2" type="text" class="form-control" style="display: none;" />
                <input id="txtans3" type="text" class="form-control" style="display: none;" />
                <div class="feedback_box_overflow">
                    <div class="feedback_box" id="f1_box">
                        <p>Did the screen load fast?</p>
                        <button id="Y" class="f1">Yes</button>
                        <button id="N" class="f1">No</button>
                    </div>
                    <div class="feedback_box" id="f2_box">
                        <p>Was the online booking process long?</p>
                        <button id="Y1" class="f2">Yes</button>
                        <button id="N1" class="f2">No</button>
                    </div>
                    <div class="feedback_box" id="f3_box">
                        <p>Do you like the visuals?</p>
                        <button id="Y2" class="f3" onclick="saveadd('Y')">Yes</button>
                        <button id="N2" class="f3" onclick="saveadd('N')">No</button>
                    </div>
                    <div class="feedback_box" id="f4_box">
                        <p>We have received your valueable feedback.</p>
                        <img src="../img/tick_check.svg" alt=""  />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 share_frnd">
                <h3>Share with your friends</h3>
                <p>I just hired russsh to finish my task</p>
               <%-- <a href="https://www.facebook.com/Russshindia/">--%>


<div id="fb-root"></div>
	
	<!-- USE 'Asynchronous Loading' version, for IE8 to work
	http://developers.facebook.com/docs/reference/javascript/FB.init/ -->
	
	<script>
	  window.fbAsyncInit = function() {
		FB.init({
		  appId  : '337488946374891',
		  status : true, // check login status
		  cookie : true, // enable cookies to allow the server to access the session
		  xfbml  : true  // parse XFBML
		});
	  };
	
	  (function() {
		var e = document.createElement('script');
		e.src = 'https://connect.facebook.net/en_US/all.js';
		e.async = true;
		document.getElementById('fb-root').appendChild(e);
	  }());
	</script>
	
	
	
	
	
	
	<script type="text/javascript">
	$(document).ready(function(){
	$('#share_button').click(function(e){
	e.preventDefault();
	FB.ui(
	{
	method: 'feed',
	name: 'Russsh Delivery Service',
	link: 'https://www.russsh.com',
	picture: 'https://www.russsh.com/images/imge-1.jpg',
	caption: 'I just hired @russshindia to finish my task.',
	description: 'I just hired @russshindia to finish my task.',
	message: ''
	});
	});
	});
	</script>
	
	







        <img id = "share_button" style="margin-top: -30px; cursor:pointer" src = "https://www.russsh.com/img/facebook.png">
                <%--<a href="https://twitter.com/russsh_in"><img src="../img/tweeter.png" alt="" /></a>--%>
                <asp:ImageButton  ID="btnTw" runat="server" OnClick="btnTwitter_Click" ImageUrl="../img/tweeter.png"> </asp:ImageButton>
            </div>

            <div class="col-md-8 btn_task col-md-offset-4 paddingtb_30" style="margin-top: 10px;">
                 <a href="../BookTask/"><input type="button" value="SCHEDULE ANOTHER TASK" /></a>
                <a href="../Orders/Default.aspx?TaskID=<%= Session["NEWBOOKINGID"] %>"><input style="margin-left: 10px;" type="button" value="TRACK YOUR ORDER" /></a>
            </div>

            <div class="col-md-12 paddingtb_30">
                <div class="paddinglr_70">
                    <div class="row map-layer"></div>
                        <div id="track-map" style="width: 100%; height: 300px">
                        </div>
                        <%--<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3771.0184322752425!2d72.83051761446772!3d19.062927187095422!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7c946e51531fb%3A0xcf18778d6fc35aae!2sRusssh!5e0!3m2!1sen!2sin!4v1478588530004" width="100%" height="250" frameborder="0" style="border: 0" allowfullscreen></iframe>--%>
                    
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
    <script src="../bt-js/bt-init.js"></script>
    <!-- bt-init -->
    <script type="text/javascript">
        $("#Y").click(function () {
            //alert("Y");
            $('#txtans1').val('Y');
            $("#f1_box").slideToggle(350).fadeOut('slow');
            return false;
        });
        $("#N").click(function () {
            //alert("N");
            $('#txtans1').val('N');
            $("#f1_box").slideToggle(350).fadeOut('slow');
            return false;
        });
        $("#Y1").click(function () {
            //alert("Y");
            $('#txtans2').val('Y');
            $("#f2_box").slideToggle(350).fadeOut('slow');
            return false;
        });
        $("#N1").click(function () {
           // alert("N");
            $('#txtans2').val('N');
            $("#f2_box").slideToggle(350).fadeOut('slow');
            return false;
        });
        $("#Y2").click(function () {
            //alert("Y");
            $('#txtans3').val('Y');
            $("#f3_box").slideToggle(350).fadeOut('slow');
            $("#text_fade").fadeIn('slow').css('opacity', '0.2');
            return false;
        });
        $("#N2").click(function () {
            //alert("N");
            $('#txtans3').val('N');
            $("#f3_box").slideToggle(350).fadeOut('slow');
            $("#text_fade").fadeIn('slow').css('opacity', '0.2');
            return false;
        });
      function saveadd(S) {
            var Taskid ='<%= Session["NEWBOOKINGID"] %>';// 60231;
            var ans1 = $('#txtans1').val();
            var ans2 = $('#txtans2').val();
            var ans3 = S;
           // alert(Taskid, ans1, ans2, ans3);
            DataSave(Taskid, ans1, ans2, ans3);
        }

        function DataSave(Taskid, ans1, ans2, ans3) {

            $.ajax({
                url: "SaveFeedBack.ashx",
                contentType: "application/text; charset=utf-8",
                data: {
                    'TASKID': Taskid,
                    'ANS1': ans1,
                    'ANS2': ans2,
                    'ANS3': ans3
                },
            });
            return false;
        }
        </script>
	 <%--Map Script--%>

        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCrB9n3LnOWgQy3dUapyuZY0jCx0MadqiI&sensor=false"></script>
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



