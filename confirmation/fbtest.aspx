<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fbtest.aspx.cs" Inherits="confirmationnew_fbtest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Facebook share sampel</title>
    <script src="http://static.ak.fbcdn.net/connect.php/js/FB.Share" type="text/javascript"></script>
<script src="http://static.ak.connect.facebook.com/js/api_lib/v0.4/FeatureLoader.js.php"
           type="text/javascript">
</script>
</head>
<body>
   <form id="form1" runat="server">
    <div>
    <a name="sharebutton" type="button" href="http://www.facebook.com/sharer.php">Share</a>  
    </div>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script><div style="overflow:hidden;height:500px;width:600px;"><div id="gmap_canvas" style="height:500px;width:600px;"><style>#gmap_canvas img{max-width:none!important;background:none!important}</style><a class="google-map-code" href="https://www.pinterest.com/wpicus/wordpress-themes/" id="get-map-data">pinterest</a></div></div><script type="text/javascript"> function init_map() { var myOptions = { zoom: 15, center: new google.maps.LatLng(19.1808735, 72.85745580000003), mapTypeId: google.maps.MapTypeId.ROADMAP }; map = new google.maps.Map(document.getElementById("gmap_canvas"), myOptions); marker = new google.maps.Marker({ map: map, position: new google.maps.LatLng(19.1808735, 72.85745580000003) }); infowindow = new google.maps.InfoWindow({ content: "<b>Andheri East</b><br/>Andheri East<br/> India" }); google.maps.event.addListener(marker, "click", function () { infowindow.open(map, marker); }); infowindow.open(map, marker); } google.maps.event.addDomListener(window, 'load', init_map);</script>


</form>
</body>
</html>
