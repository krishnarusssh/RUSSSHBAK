<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="BookTask_Default" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/BookTaskHeader.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/BookTaskFooter.ascx" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>Book Task</title>
    <link rel="stylesheet" type="text/css" href="../css-web/bootstrap.css">
	<link href="../css-web/style.css" rel="stylesheet" type="text/css">
	<link href="../css-web/media-style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="bt-css/book-task.css">
    <link rel="stylesheet" type="text/css" href="bt-css/bootstrap-slider.css">
    <link rel="stylesheet" type="text/css" href="bt-css/select-style.css">
	<link rel="stylesheet" type="text/css" href="../mega-dropdown/css/style.css">
    <!-- datepicker -->	
	<link rel="stylesheet" type="text/css" href="datepicker/css/datepicker.css"><!-- datepicker -->
	<link rel="stylesheet" type="text/css" href="filepicker/filepicker.default.css"><!-- filepicker -->
	<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
	<!--[if lt IE 9]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
	<script src="../js-web/modernizr.js"></script><!-- Modernizr -->
    <!-- Modernizr -->
    <script type="text/javascript">
        var ObjBook = { tdate: "", ptime: "", cat: "", pval: "", weight: "", padd: "", dadd: "", rcat: "0", rval: "0", rweight: "0", isexpress: "", ttype: "Single", des: "", rdes: "0" , paddressid:"",daddressid:"",nrcost:"0",ercost:"0",service:"0", ncharge:"0",echarge:"" ,eservice:"0"};
    </script>
 
</head>
<body>
	<form runat="server">
    <div id="Div1" class="bookaervice_banner">
            <div class="top-header">
                <div class="container">
                    <uc:Header ID="Header"
                        runat="server"
                        MinValue="1"
                        MaxValue="10" />
                </div>
            </div>
            <div id="responsive_menu"></div>
            <div class="banner">
                <div class="container">
                </div>
            </div>
        </div>
    <div class="notify_box" id="msgalert">Please select complete detail about your Task and Try Again.</div>
    <div class="container">
		<div class="row">
                <div class="col-md-12 col-xs-12" id="diverror" runat="server" style="top: 53px;text-align: center;color: red;"></div>
            </div>
        <div class="row">
            <div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
                <div class="task-container">
                    <div class="cam_edit_box">
                        <img src="img/camera-icon.png" id="edit_window" class="cam_edit" width="30" />
                    </div>
                    <div class="image-editor" id="image-editor">
                        <input class="camera" type="image" src="img/camera.png" />
                        <input type="file" class="cropit-image-input" id="my_file" style="display: none;" />
                        <div class="cropit-preview"></div>
                    </div>
                    <div class="book-tab row">
                        <ul class="col-md-12 col-xs-12">
                            <li class="active col-xs-6"><a href="#tab-1" onclick="drophidesingle()">Single Delivery</a></li>
                            <li class="col-xs-6"><a href="#tab-1" onclick="dropparcel()">Return Delivery</a></li>
                             
                        </ul>
                    </div>
                    <div id="tab-1" class="book-content">
                        <div class="row bt-form">
                            <div class="col-md-12 col-xs-12 bt-element">
                                <img src="img/PickupPoint.png" alt="" />
                                <label>Pick Up</label>
                                <input type="text" placeholder="Date &amp; Time" class="datepicker1 form-control" id="tdate" readonly="" onchange="fntime()" />
                                <%-- onclick="settdate()"--%>
                                <div class="close-icon" type="reset" onclick="cleardate()">&times;</div>
                                <div id="test"></div>
                                <div id="users" class="row time-container">
                                    <img class="time-ico" src="img/timer.png" alt="" style="display:none;" />
                                    <input style="display:none;" class="search" type="text" placeholder="Select Time" />
                                    <div class="list" id="DivTime">
                                        <div class="col-md-6 col-xs-6">
                                            <p class="timetxt time" id="0">No Slot</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="drop_pick_parcel" class="row bt-form">
                            <div class="col-md-12 col-xs-12 bt-element" data-parcel-detail>
                                <img src="img/endPointParcel.png" alt="" />
                                <label>Parcel Details</label>
                                <input onclick="fnResetModal(this);" data-type="drop_pick_parcel" data-toggle="modal" data-target="#select-catg" data-id="1" type="text" placeholder="Select a Item, Description, Price &amp; Weight" class="form-control" />
                                <div class="item-collected"></div>
                            </div>
                        </div>
                        <div id="drop_parcel" class="row bt-form" style="display: none;">
                            <div class="col-md-12 col-xs-12 bt-element" data-parcel-detail>
                                <img src="img/pick-parcel.png" alt="" />
                                <label>Parcel Details Drop</label>
                                <input onclick="fnResetModal(this);" data-type="drop_parcel" data-toggle="modal" data-target="#select-catg" type="text" data-id="2" placeholder="Select a Item, Description, Price &amp; Weight" class="form-control" />
                                <div class="item-collected"></div>
                            </div>
                        </div>
                        <div class="row bt-form">
                            <div class="pickup_address">
                                <div class="bullet-from"></div>
                            </div>
                            <div id="addr_filter" class="col-md-12 col-xs-12 bt-element dropdown pick_input">
                                <label>From</label>
                                <input aria-expanded="true" data-toggle="dropdown" type="text" id="inputpadd" autocomplete="off" placeholder="Select a pickup address" class="form-control dropdown-toggle search sticky_address"   />
                                <div class="addr-dropdown dropdown-menu keep-open-on-click">
                                    <div class="addr-header">
                                        Select Delivery Address
                                        <span class="widget"><i class="fa fa-map-marker" style="display:none;" data-toggle="modal" data-target="#map-address" aria-hidden="true"></i><i class="fa fa-plus" onclick="fnclearadd(1);" aria-hidden="true"></i><i class="fa fa-times addr_close"></i>
                                        </span>
                                    </div>
                                    <div class="dropdown-scroll list" runat="server" id="DivPadd">
                                         
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row bt-form">
                            <div class="drop_address">
                                <div class="bullet-drop"></div>
                            </div>
                            <div id="drop_filter" class="col-md-12 col-xs-12 bt-element dropdown drop_input">
                                <label>Drop</label>
                                <input aria-expanded="true" data-toggle="dropdown" type="text" placeholder="Select a destination address" class="form-control dropdown-toggle search sticky_address"  />
                                <div class="addr-dropdown dropdown-menu keep-open-on-click">
                                    <div class="addr-header">
                                        Select Delivery Address <span class="search-add"><i class="fa fa-search search-add-ico"></i>
                                            <input type="text" placeholder="Search Address" autocomplete="off" /></span>
                                        <span class="widget"><i class="fa fa-map-marker" data-toggle="modal" data-target="#map-address" aria-hidden="true" style="display:none;"></i><i class="fa fa-plus" onclick="fnclearadd(2);"  aria-hidden="true"></i><i class="fa fa-times addr_close"></i>
                                        </span>
                                    </div>
                                    <div class="dropdown-scroll list" runat="server" id="Divdadd">
                                         
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <button onclick="fnproceed()" class="btn proceed-btn">PROCEED</button>
                        </div>

                    </div>
                    <!-- Return -->
                    <div id="tab-2" class="book-content">
                    </div>
                    <!-- Multi -->
                </div>
                <!-- task-container -->
            </div>
        </div>
        <div class="row hidden-xs" style="padding-bottom:30px;">
            <div class="col-md-12">
                <p class="proceed_text">By clicking "PROCEED" you are agreeing to the RUSSSH <a href="https://www.russsh.com/terms-and-condition/" target="_blank">Terms &amp; Conditions</a> and <a href="https://www.russsh.com/privacy-policy/" target="_blank">Privacy Policy</a></p>
            </div>
        </div>
    </div>
<div id="includedContent2" class="hidden-xs">
                <fc:Footer ID="Footer1"
                    runat="server"
                    MinValue="1"
                    MaxValue="10" />

            </div>
    <!-- book task -->
    <div class="modal" id="address" tabindex="-1" role="dialog" aria-hidden="true" data-appear-animation="bounceInUp" data-appear-animation-delay="70">
        <div class="modal-dialog bt_box">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <a class="bt-close" data-dismiss="modal">
                            <img src="img/close-icon.svg" height="15" width="14" alt="" />
                        </a>
                        <div class="bt_body" style="height: 100%;">
                            <div class="row">
                                <div class="address-tab row">
                                    <h3 class="address-title">ADD ADDRESS</h3>
                                    <ul class="col-md-12 col-xs-12">
                                        <li class="active col-xs-4"><a href="#home" id="t0" data-typeid="0" onclick="office(this)">Home</a></li>
                                        <li class="col-xs-4"><a href="#home" id="t1" data-typeid="1" onclick="office(this)">Office</a></li>
                                        <li class="col-xs-4"><a href="#home" id="t2" data-typeid="2" onclick="others(this)">Others</a></li>
                                    </ul>
                                </div>
                                <div id="home" class="address-content">
                                    <div class="address-scroll">
                                        <div id="other_show" class="row adds-form" style="display: none;">
                                            <div class="col-md-12 col-xs-12 adds-element">
                                                <input type="text" class="form-control" id="lbladd" placeholder="Enter Your Own Label" />
                                            </div>
                                        </div>
                                        <div class="row adds-form">
                                            <div class="col-md-6 col-xs-6 adds-element bdr-right">
                                                <input type="text" class="form-control" id="fname" placeholder="First Name" />
                                            </div>
                                            <div class="col-md-6 col-xs-6 adds-element">
                                                <input type="text" class="form-control" id="lname" placeholder="Last Name" />
                                            </div>
                                        </div>
                                        <div class="row adds-form">
                                            <div class="col-md-12 col-xs-12 adds-element">
                                                <input type="text" class="form-control" id="mno" placeholder="Mobile No/Landline"  onkeypress="return isNumberKey(event)" />
                                            </div>
                                        </div>
                                        <div class="row adds-form">
                                            <div class="col-md-12 col-xs-12 adds-element">
                                                <input type="text" class="form-control" id="aaddress" placeholder="Flat/House/Street/Society" />
                                            </div>
                                        </div>
                                        <div class="row adds-form">
                                            <div class="col-md-12 col-xs-12 adds-element" style="line-height: 12px; margin-top: -4px;">
                                                <select class="selectpicker show-menu-arrow city" id="ddlcity" data-size="4">
                                                    <option value="1">Mumbai</option>
                                                    <%--   <option>Pune</option>--%>
                                                </select>
                                                <div class="city_arrow">
                                                    <img src="img/arrow-down.png" alt="" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row ">
                                            <div class="col-md-12 col-xs-12" style="line-height: 12px; margin-top: -4px;  border-bottom: 1px solid #f0f0f0;">
                                                <select class="select-style" name="ddlarea" id="ddlarea" data-size="5">
                                                    <option value="0">Select Area</option>
                                                </select>
                                                   <input type="hidden" id="addid" value="0" />
                                                 <input type="hidden" id="addtype" value="0" />
                                                 <input type="hidden" id="cid" value="home" />
                                            </div>
                                        </div>
                                        <div class="row adds-form">
                                            <div class="col-md-12 col-xs-12 adds-element">
                                                <input type="text" class="form-control" placeholder="Landmark/Pincode" id="landmark" />
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                              
                                <div id="Div2" class="address-content">
                                    <div class="row">
                                        <button class="btn proceed-btn" style="margin: 0; position: fixed; bottom: 0; width: 100%;" onclick="fnsaveadd()">SAVE ADDRESS</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- search by map -->
    <!-- book task -->
    <div class="modal" id="map-address" tabindex="-1" role="dialog" aria-hidden="true" data-appear-animation="bounceInUp" data-appear-animation-delay="70">
        <div class="modal-dialog map_add">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <a class="bt-close" data-dismiss="modal">
                            <img src="img/close-icon.svg" height="15" width="14" alt="" /></a>
                        <div class="bt_body" style="height: 100%;">
                            <div class="row">
                                <div class="col-md-offset-1 col-md-8 col-md-offset-1 google">
                                    <input type="text" class="form-control" placeholder="Search Address On Goggle" />
                                </div>
                                <div class="col-md-2">
                                    <button class="btn proceed-btn">PROCEED</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-9 col-md-push-3">
                                    <div id="google_map">
                                        <iframe class="search_map" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15084.855870834368!2d72.82961639521486!3d19.054327857304095!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xcf18778d6fc35aae!2sRusssh!5e0!3m2!1sen!2sin!4v1474270145195" width="100%" height="600px" frameborder="0" style="border: 0"></iframe>
                                    </div>
                                </div>
                                <div class="col-md-3 col-md-pull-9">
                                    <div class="map_left">
                                        <div class="map_data_box">
                                            <h4>Monginis Cake Shop</h4>
                                            <p>
                                                Cake Shop
                                                <br />
                                                Shop No. 10, Outside Municipal...<br />
                                                022 26879587<br />
                                                <br />
                                                Open untill 9:30 PM
                                            </p>
                                        </div>
                                        <div class="map_data_box">
                                            <h4>Monginis Cake Shop</h4>
                                            <p>
                                                Cake Shop
                                                <br />
                                                Shop No. 10, Outside Municipal...<br />
                                                022 26879587<br />
                                                <br />
                                                Open untill 9:30 PM
                                            </p>
                                        </div>
                                        <div class="map_data_box">
                                            <h4>Monginis Cake Shop</h4>
                                            <p>
                                                Cake Shop
                                                <br />
                                                Shop No. 10, Outside Municipal...<br />
                                                022 26879587<br />
                                                <br />
                                                Open untill 9:30 PM
                                            </p>
                                        </div>
                                        <div class="map_data_box">
                                            <h4>Monginis Cake Shop</h4>
                                            <p>
                                                Cake Shop
                                                <br />
                                                Shop No. 10, Outside Municipal...<br />
                                                022 26879587<br />
                                                <br />
                                                Open untill 9:30 PM
                                            </p>
                                        </div>
                                        <div class="map_data_box">
                                            <h4>Monginis Cake Shop</h4>
                                            <p>
                                                Cake Shop
                                                <br />
                                                Shop No. 10, Outside Municipal...<br />
                                                022 26879587<br />
                                                <br />
                                                Open untill 9:30 PM
                                            </p>
                                        </div>
                                        <div class="map_data_box">
                                            <h4>Monginis Cake Shop</h4>
                                            <p>
                                                Cake Shop
                                                <br />
                                                Shop No. 10, Outside Municipal...<br />
                                                022 26879587<br />
                                                <br />
                                                Open untill 9:30 PM
                                            </p>
                                        </div>
                                        <div class="map_data_box">
                                            <h4>Monginis Cake Shop</h4>
                                            <p>
                                                Cake Shop
                                                <br />
                                                Shop No. 10, Outside Municipal...<br />
                                                022 26879587<br />
                                                <br />
                                                Open untill 9:30 PM
                                            </p>
                                        </div>
                                        <div class="map_data_box">
                                            <h4>Monginis Cake Shop</h4>
                                            <p>
                                                Cake Shop
                                                <br />
                                                Shop No. 10, Outside Municipal...<br />
                                                022 26879587<br />
                                                <br />
                                                Open untill 9:30 PM
                                            </p>
                                        </div>
                                        <div class="map_data_box">
                                            <h4>Monginis Cake Shop</h4>
                                            <p>
                                                Cake Shop
                                                <br />
                                                Shop No. 10, Outside Municipal...<br />
                                                022 26879587<br />
                                                <br />
                                                Open untill 9:30 PM
                                            </p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Select Item -->
    <div class="modal" id="select-catg" tabindex="-1" role="dialog" aria-hidden="true" data-appear-animation="bounceInUp" data-appear-animation-delay="70">
        <div class="modal-dialog map_add">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <a class="bt-close" data-dismiss="modal">
                            <img src="img/close-icon.svg" height="15" width="14" alt="" /></a>
                        <div id="item_filter" class="bt_body" style="height: 100%;">
                            <div class="row">
                                <div class="col-md-offset-1 col-md-8 col-md-offset-1" data-item-collection>
                                    <input type="text" class="form-control" placeholder="Select a Item, Description, Price &amp; Weight" />
                                </div>
                                <div class="filter_input">
                                    <input type="text" id="txtsearch" class="search myClass" name="" placeholder="Select a Item, Description, Price &amp; Weight" />
                                </div>
                                <div class="col-md-2">
                                    <button onclick="fnProceedParcel()" class="btn submit-bt">SUBMIT</button>
                                </div>
                            </div>
                            <div class="row" data-step="0">
                                <div data-role="items" class="col-md-offset-1 col-md-10 col-md-offset-1 select_service">
                                    <h2 class="select_item_text">Select Item</h2>
                                    <div class="margin">
                                        <div class="list">
                                            <div class="col-md-2 col-xs-3" data-name="Cake" data-id="1" data-index="0" onclick="fnAddItem(this);">
                                                <div class="none_item">
                                                    <img src="img/cake.svg" alt="">
                                                    <h3 class="filtervalue">Cake</h3>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-xs-3" data-name="Electronic" data-id="11" data-index="0" onclick="fnAddItem(this);">
                                                <div class="none_item">
                                                    <img src="img/electronic.svg" alt="">
                                                    <h3 class="filtervalue">Electronics</h3>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-xs-3" data-name="Documents" data-id="6" data-index="0" onclick="fnAddItem(this);">
                                                <div class="none_item">
                                                    <img src="img/document.svg" alt="">
                                                    <h3 class="filtervalue">Documents</h3>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-xs-3" data-name="Chocolate" data-id="14" data-index="0" onclick="fnAddItem(this);">
                                                <div class="none_item">
                                                    <img src="img/chocolate.svg" alt="">
                                                    <h3 class="filtervalue">Chocolates</h3>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-xs-3" data-name="Money" data-id="19" data-index="0" onclick="fnAddItem(this);">
                                                <div class="none_item">
                                                    <img src="img/cash.svg" alt="">
                                                    <h3 class="filtervalue">Cash</h3>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-xs-3" data-name="Gift" data-id="7" data-index="0" onclick="fnAddItem(this);">
                                                <div class="none_item">
                                                    <img src="img/gift.svg" alt="">
                                                    <h3 class="filtervalue">Gifts</h3>
                                                </div>
                                            </div>
                                            <%-- <div class="col-md-2 col-xs-3 " data-name="Grocery" data-id="ITEM007" data-index="0" onclick="fnAddItem(this);">
                                                <div class="none_item">
                                                    <img src="img/grocery.svg" alt="">
                                                    <h3 class="filtervalue">Grocery</h3>
                                                </div>
                                            </div>--%>
                                            <div class="col-md-2 col-xs-3" data-name="Cloth" data-id="9" data-index="0" onclick="fnAddItem(this);">
                                                <div class="none_item">
                                                    <img src="img/cloths.svg" alt="">
                                                    <h3 class="filtervalue">Clothes</h3>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-xs-3" data-name="Food" data-id="3" data-index="0" onclick="fnAddItem(this);">
                                                <div class="none_item">
                                                    <img src="img/food.svg" alt="">
                                                    <h3 class="filtervalue">Foods</h3>
                                                </div>
                                            </div>
                                            <%--      <div class="col-md-2 col-xs-3" data-name="Bakery" data-id="ITEM0010" data-index="0" onclick="fnAddItem(this);">
                                                <div class="none_item">
                                                    <img src="img/bakery.svg" alt="">
                                                    <h3 class="filtervalue">Bakery</h3>
                                                </div>
                                            </div>--%>
                                            <div class="col-md-2 col-xs-3" data-name="Flower" data-id="2" data-index="0" onclick="fnAddItem(this);">
                                                <div class="none_item">
                                                    <img src="img/flower.svg" alt="">
                                                    <h3 class="filtervalue">Flowers</h3>
                                                </div>
                                            </div>
                                            <%-- <div class="col-md-2 col-xs-3" data-name="Gift" data-id="ITEM0012" data-index="7" onclick="fnAddItem(this);">
                                                <div class="none_item">
                                                    <img src="img/gift.svg" alt="">
                                                    <h3>Gift</h3>
                                                </div>
                                            </div>--%>
                                            <%-- <div class="col-md-2 col-xs-3" data-name="Food" data-id="ITEM0013" data-index="0" onclick="fnAddItem(this);">
                                                <div class="none_item">
                                                    <img src="img/home-kitchen.svg" alt="">
                                                    <h3>Food</h3>
                                                </div>
                                            </div>--%>
                                        </div>
                                        <div class="col-md-2 col-xs-3" data-name="others" data-id="ITEM0015" data-index="0" onclick="fnAddItem(this);">
                                            <div class="none_item">
                                                <img src="img/others.svg" alt="">
                                                <h3>Others</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" data-step="1">
                                <div class="select_service_form col-md-offset-1 col-md-10 col-md-offset-1">
                                    <div class="col-md-12">
                                        <h2 class="select_item_text">Enter delivery price &amp; Instruction</h2>
                                        <img class="rupee" src="img/rupee.png" />
                                        <input type="number" onkeypress="return isNumberKey(event)" class="form-control pval" placeholder="Enter Parcel Value Eg. 1000" data-name="deliveryprice" data-id="ITEM0015" data-index="1" />
                                    </div>
                                    <div class="col-md-12" id="next">
                                        <input type="text" class="form-control pweight" placeholder="Give Exact Instruction" data-name="Instruction" data-id="ITEM0016" data-index="2" />
                                        <button class="btn btn-next-mobile hidden-lg hidden-sm hidden-md" onclick="fnAddPriceInd();"><i class="fa fa-arrow-right"></i></button>
                                    </div>
                                    <div class="col-md-12 hidden-xs">
                                        <div class="form-group">
                                            <button class="btn btn-next center-block" onclick="fnAddPriceInd();" style="height: 100%">NEXT</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" data-step="3">
                                <div class="col-md-offset-1 col-md-10 col-md-offset-1">
                                    <h2 class="select_item_text">Select Weight (Kgs)</h2>
                                    <div class="form-group">
                                        <input id="weight-bt" type="text" data-slider-min="0" data-slider-max="30" data-slider-step="1" data-slider-value="0" data-name="weight" data-id="ITEM0016" data-index="4" />
                                    </div>
                                    <h3 class="weight_0">0</h3>
                                    <h3 class="weight_view"><span id="weight-view">0</span> KG</h3>
                                    <div class="slider-img">
                                        <img class="img center-block">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- bt-body end -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- delivery mode -->
    <div class="modal" id="delivery-mode" tabindex="-1" role="dialog" aria-hidden="true" data-appear-animation="bounceInUp" data-appear-animation-delay="500">
        <div class="modal-dialog delivery_mode">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12 delivery_text" data-type="N" onclick="Normalclick(this)">
                            <h4>Normal Delivery</h4>
                            <p>Delivery Within 2-4 Hours</p>
                            <h3 ><i class="fa fa-rupee"></i>  <label id="Ndelibery" >0</label></h3>
                        </div>
                        <div class="col-md-12 delivery_text" data-type="E" onclick="Expressclick(this)">
                            <h4>Express Delivery</h4>
                            <p>Delivery Within 90 Minutes</p>
                            <h3 ><i class="fa fa-rupee"> </i>  <label id="Edelibery" >0</label></h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<a class="notify-trigger"></a>
     </form>
    <script src="../code.jquery.com/jquery-latest.min.js"></script>
   
   <script src="bt-js/jquery-1.10.1.min.js" type="text/javascript"></script>
    <!-- Jquery Library Call -->
    <script src="../js-web/helper-plugins.js"></script>
    <!-- Plugins -->
    <script src="../js-web/bootstrap.js"></script>
    <!-- UI -->
    <script src="bt-js/filter.js"></script>
    <!-- filter-->
    <script src="bt-js/select-style.js"></script>
    <!-- select style-->
    <script src="bt-js/jquery.cropit.js"></script>

    <script src="bt-js/enscroll-0.6.2.min.js"></script>
    <!-- scrollstyle-->
    <script src="bt-js/bootstrap-slider.min.js"></script>
    <!-- weight range-->
    <script src="bt-js/bt-init.js"></script>
    <!-- bt-init -->
    <script src="datepicker/js/datepicker.js"></script>
    <!--date js -->
    <script src="datepicker/js/datepicker.en.js"></script>
    <!--date lang -->
    <script type="text/javascript" src="bt-js/Booktask.js"></script>
    <script type="text/javascript">
        $("#test").multiSelect({
            title: "",
        });
    </script>
<script src="../mega-dropdown/js/main.js"></script>
<script type="text/javascript">
$(window).scroll(function() {
 if ($(window).scrollTop() > 120) 
 {
   $('.cd-dropdown-content').css({'display' : 'none'});		
  }
  else
   {
    $('.cd-dropdown-content').css({'display' : 'block'});	
  } 	
});
</script>
  <script src="bt-js/filter.js"></script>

</body>
</html>

