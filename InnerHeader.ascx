<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InnerHeader.ascx.cs" Inherits="InnerHeader" %>
<style type="text/css">
    .mymenu {
    }
  .mymenu  ul {
  
  font-size: 14px;
  margin: 0;
  padding: 0;
  list-style: none;
 
}
.mymenu ul li {
  display: block;
  position: relative;
  float: left;
  width:220px;
}
.mymenu li ul { display: none; }
.mymenu ul li a {
  display: block;
  text-decoration: none;
  color: #ffffff;
  border-top: 0px solid #ffffff;
  padding: 5px 15px 5px 15px;
 /* background: #2C5463;*/
  margin-left: 1px;
  white-space: nowrap;
}
.mymenu ul li a:hover {/* background: #617F8A; */}
.mymenu li:hover ul {
  display: block;
  position: absolute;
}
.mymenu li:hover li {
  float: none;
  font-size: 14px;
border-bottom: dotted 1px #FFF;
}
.mymenu li:hover a { background:rgba(0, 0, 0, 0.7) none repeat scroll 0% 0%}
.mymenu li:hover li a:hover { background: #95A9B1; }
</style>
<script type="text/javascript">

    function getCook(cookiename) {
        // Get name followed by anything except a semicolon

        var cookiestring = RegExp("" + cookiename + "[^;]+").exec(document.cookie);
        // Return everything after the equal sign
        return unescape(!!cookiestring ? cookiestring.toString().replace(/^[^=]+./, "") : "");
    }
    var cookieValue = getCook('LOGINNAME');

    if (cookieValue != "") {
        document.getElementById("namelink").innerHTML = "Hello " + cookieValue + " <span id='arrowplace' class='glyphicon glyphicon-chevron-down' aria-hidden='true' onclick='OpenCloseMenu()'></span>";
        document.getElementById("namelink").style.display = 'block';
        document.getElementById("floatingmenu").style.display = 'none';
        document.getElementById("loginsignuplabel").style.display = 'none';
    }
    else {
        document.getElementById("namelink").innerHTML = "Hello Guest <span id='arrowplace' class='glyphicon glyphicon-chevron-down' aria-hidden='true' onclick='OpenCloseMenu()'></span>";
        document.getElementById("namelink").style.display = 'none';
        document.getElementById("floatingmenu").style.display = 'none';
        document.getElementById("loginsignuplabel").style.display = 'block';
    }

    function OpenCloseMenu() {
        if (document.getElementById("floatingmenu").style.display == 'none') {
            document.getElementById("floatingmenu").style.display = 'block';
            document.getElementById("arrowplace").className = "glyphicon glyphicon-chevron-up";

        }
        else if (document.getElementById("floatingmenu").style.display == 'block') {
            document.getElementById("floatingmenu").style.display = 'none';
            document.getElementById("arrowplace").className = "glyphicon glyphicon-chevron-down";
        }
    }
    document.getElementById("floatingmenu").style.display = 'none';
</script>

<div class="nav menuhidetop">
    <ul class="nav">
      <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="https://www.russsh.com/images1/menu.png" style="margin-top:-3px;" alt="" /> Menu </a>
        <ul class="dropdown-menu">
          <li><a href="https://www.russsh.com/"><i class="fa fa-home"></i>
Home</a></li>
          <li class="dropdown-submenu"> <a tabindex="-1" href="#">Services </a>
            <ul class="dropdown-menu dwopbox">
                <ul class="col-md-4 inner_menutop">
                  <li class="link"> <a href="https://www.russsh.com/services/cake-delivery/">Cake Delivery</a> </li>
                  <li class="link"> <a href="https://www.russsh.com/services/clothes-delivery-service/" title="">Clothes delivery service</a> </li>
                  <li class="link"> <a href="https://www.russsh.com/services/grocery-shopping-and-delivery/" title="">Grocery Shopping &amp; Delivery</a> </li>
                  <li class="link"> <a href="https://www.russsh.com/services/food-delivery/" title="">Food Delivery</a> </li>
                  <li class="link"> <a href="https://www.russsh.com/services/gift-and-flower-delivery/" title="">Gift Delivery</a> </li>
                  <li class="link"> <a href="https://www.russsh.com/services/flower-delivery/" title="">Flower Delivery</a> </li>
                  <li class="link"> <a href="https://www.russsh.com/services/Laptop-computer-hard-drive-usb-delivery/" title="">Electronic Devices Delivery</a> </li>
                 <li class="link"> <a href="https://www.russsh.com/services/Crockery-utensils-jar-delivery/" title="">Home &amp; Kitchen Item Delivery</a> </li>
                </ul>
                
           <ul class="col-md-4 inner_menutop">
                  
                  <li class="link"> <a href="https://www.russsh.com/services/bakery-delivery/" title="">Bakery Delivery</a> </li>
                  <li class="link"> <a href="https://www.russsh.com/services/chocolate-delivery/" title="">Chocolate Delivery</a> </li>
                  <li class="link"> <a href="https://www.russsh.com/services/cash-cheque-delivery/" title="">Cash & Cheque Delivery</a> </li>
                  <li class="link"> <a href="https://www.russsh.com/services/bulk-delivery/" title="">Bulk Delivery</a> </li>
                  <li class="link"> <a href="https://www.russsh.com/services/same-day-document-delivery/" title="">Same Day Document Delivery</a> </li>
                  <li class="link"> <a href="https://www.russsh.com/services/parcel-delivery/" title="">Parcel Delivery</a> </li>
                
                </ul>
         

            </ul>
          </li>
		  <li><a href="https://www.russsh.com/for-business">For Business</a></li>
		  <li><a href="https://www.russsh.com/pricing">Pricing</a></li>
          <li><a href="https://www.russsh.com/about-us">About Us</a></li>
          <li><a href="https://www.russsh.com/help-center/">Help Center</a></li>
          <li><a href="https://www.russsh.com/testimonials">Testimonials</a></li>
          <li><a href="https://www.russsh.com/blog">Blog</a></li>
          <li><a href="https://www.russsh.com/contact-us">Contact us</a></li>
           
        </ul>
      </li>
    </ul>
  </div>    
 <div class="logo" style="padding-bottom:3px;padding-top:3px;"><a href="https://www.russsh.com"><img src="https://www.russsh.com/images1/logo1.png" title="Russsh" alt="russsh-the delivery people"></a></div>
            
<div class="calltext"><i class="fa fa-phone-square fa-lg"></i>&nbsp;+91-80808 08315<br>

     <div class="mymenu" id="sidemenu" runat="server" >
      <ul id="menu">
   <li style="border-top: 0px solid #ffffff;" ><a href="" style="border-top: 0px solid #ffffff;" id="namelink" runat="server">Hello Krishna Kant Verma</a>
    <ul>
   <li><a href="https://www.russsh.com/EditProfile"><i class="fa fa-user fa-lg"></i>&nbsp;&nbsp; My Profile</a></li>
<li><a href="https://www.russsh.com/ChangePassword"><i class="fa fa-key fa-lg"></i>&nbsp;&nbsp; Change Password</a></li>
<li><a href="https://www.russsh.com/Wallet"><i class="fa fa-money"></i>&nbsp;&nbsp;
My Wallet</a></li>
<li><a href="https://www.russsh.com/Orders"><i class="fa fa-tasks fa-lg"></i>&nbsp;&nbsp; My Orders</a></li>
<li><a href="https://www.russsh.com/EditAddress"> <i class="fa fa-book fa-lg"></i>&nbsp;&nbsp; Address Book</a></li>
<li><a href="https://www.russsh.com/BookTask"><i class="fa fa-file-text fa-lg"></i>&nbsp;&nbsp; Book a Task</a></li>
<li><a href="https://www.russsh.com/Signout"><i class="fa fa-sign-out fa-lg"></i>&nbsp;&nbsp; Sign Out</a></li>
    </ul>
  </li>
 
</ul>
  </div>

    <span id="loginsignuplabel" runat="server"><a href="https://www.russsh.com/signin">Login</a> | <a href="https://www.russsh.com/signup">Sign up</a></span>
</div>     
      <div class="clearfix"> </div>