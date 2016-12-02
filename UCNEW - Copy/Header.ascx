﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="UserControls_Header" %>
<header>
<nav class="blue-nav navbar navbar-default navbar-fixed-top">
<div class="container-fluid">
<div class="row">
<!-- Brand and toggle get grouped for better mobile display -->
<div id="headergrid" runat="server" class="col-md-12">
<div class="navbar-header">
<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#left-nav" aria-expanded="false">
<span class="sr-only">Toggle navigation</span>
<span class="fa fa-bars"></span>
</button>
<a href="https://www.russsh.com" class="navbar-brand"><img class="logo-xs" src="https://www.russsh.com/images/russsh-logo.svg" width="75" height="30" alt="" /></a>
</div>
<!-- Collect the nav links, forms, and other content for toggling -->
<div class="collapse navbar-collapse blue-collapse" id="left-nav">
<ul class="nav navbar-nav">
<li class="active"><a href="#"><i class="fa fa-home"></i> <span class="sr-only">(current)</span></a></li>
<li><a href="https://www.russsh.com/for-business/">LAST MILE</a></li>
<li><a href="https://www.russsh.com/pricing/">PRICING</a></li>
<li><a href="https://www.russsh.com/help-center/">HELP CENTER</a></li>
<li><a href="https://www.russsh.com/contact-us/">CONTACT US</a></li>
<li><a href="#">OFFERS</a></li>

<li class="hidden-lg visible-xs"><a href="#" data-toggle="modal" data-target="#login"><i class="fa fa-sign-in"></i> LOGIN</a></li>
</ul>
<ul class="nav navbar-nav navbar-right hidden-sm hidden-xs">
    <li class="book" id="booktasklink" runat="server"><a href="#">BOOK NOW</a></li>
<li><a href="#"><i class="fa fa-phone"></i> &nbsp;+91 8080808315</a></li>
<li id="loginlink" runat="server"><a href="#" data-toggle="modal" data-target="#login"><i class="fa fa-sign-in"></i> LOGIN</a></li>
</ul>
</div><!-- /.navbar-collapse -->
</div>
<div class="cd-dropdown-wrapper " id="profilemenu"  runat="server">
<div class="cd-dropdown-trigger" ><img src="https://www.russsh.com/images/user-icon.png" height="30" width="30" class="img-circle" alt="" />
<a href="#"><span class="hidden-sm hidden-xs" id="loggedInUserName" runat="server"> Zubair1234</span></a></div>
<nav class="cd-dropdown">
<a href="#" class="cd-close">Close</a>
<ul class="cd-dropdown-content">
<li class="hidden-xs"><a href="#"><img src="https://www.russsh.com/images/caret-top.png" alt="" /></a></li>
<li><a href="https://www.russsh.com/EditProfile"><img src="https://www.russsh.com/images/russsh-icons/profile4.svg" height="25" width="25" alt="" /> My Profile</a></li> 
<li><a href="https://www.russsh.com/ChangePassword"><img src="https://www.russsh.com/images/russsh-icons/change-password.svg" height="25" width="25" alt="" /> Change Password</a></li>
<li><a href="https://www.russsh.com/Wallet"><img src="https://www.russsh.com/images/russsh-icons/my-wallet.svg" height="25" width="25" alt="" /> My Wallet</a></li>
<li><a href="https://www.russsh.com/Orders"><img src="https://www.russsh.com/images/russsh-icons/my-order.svg" height="25" width="25" alt="" /> My Order</a></li>
<li><a href="https://www.russsh.com/EditAddress"><img src="https://www.russsh.com/images/russsh-icons/Address-book.svg" height="25" width="25" alt="" /> Address Book</a></li>
<li><a href="https://www.russsh.com/Signout"><img src="https://www.russsh.com/images/russsh-icons/sign-out.svg" height="25" width="25" alt="" /> Sign Out</a></li>
<li class="active"><a href="https://www.russsh.com/BookTask"><img src="https://www.russsh.com/images/russsh-icons/book-a-task.svg" height="25" width="25" alt="" /> Book A Task</a></li>
</ul> <!-- .cd-dropdown-content -->
</nav> <!-- .cd-dropdown -->
</div>

</div>
</div><!-- container-end -->
</nav>
</header>