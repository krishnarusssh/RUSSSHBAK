<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="BookTask_Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>Book Task - Payment</title>
    <link rel="stylesheet" type="text/css" href="../css-web/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../BookTask/bt-css/book-task.css" />
    <%--<link rel="stylesheet" type="text/css" href="bt-css/component.css" />--%>
    <link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.carousel.min.css" />
    <link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.theme.default.min.css" />
    <script src="../BookTask/bt-js/filter.js"></script>
    <script src="../BookTask/bt-js/jquery-1.10.1.min.js"></script>
    <script src="../BookTask/bt-js/payment.js"></script>
    <script src="../js-web/modernizr.js"></script>
    <!-- Modernizr -->
    <style type="text/css">
        .wal {
            font-size: larger;
            padding: 6px;
            color: black;
        }
		 #qpy {
            display:block;
            visibility:hidden;
        }
    </style>
 <script type="text/javascript">
        var ObjCard = { c1: "", c2: "", c3: "", c4: "", name: "", cm: "", cy: "", cv: "",cno:""  };
    </script>
	 <script type="text/javascript">
       function ValidateAlpha(evt)
    {
        var keyCode = (evt.which) ? evt.which : evt.keyCode
        if ((keyCode < 65 || keyCode > 90) && (keyCode < 97 || keyCode > 123) && keyCode != 32)
         
        return false;
            return true;
    }
		 function OpenQ()
       {
           document.getElementById("qpy").style.display = 'block';
           document.getElementById("qpy").style.visibility = 'visible';
           document.getElementById("qpy").style.height = 'auto';
       }
</script>
</head>
<body>
    <div class="notify_box" style="top:0px!important" id="msgalert">Please select complete detail about your Task and Try Again.</div>
     
    <form id="form1" runat="server">
        <header class="payment-header">
             <a href="https://www.russsh.com"><img src="../BookTask/img/russsh.png" class="center-block" width="115" alt="" /></a>
        </header>
		  <div class="container">
        <div class="row " style="margin-top: 5px">
            <div class="col-md-12 text-center" id="diverror" runat="server" style="color: red"></div>
        </div>
		</div>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-xs-12 payment-container">
                    <div class="payment-tab row payment-scroll">
                        <ul class="col-md-12 col-xs-12 payment-overf" id="paytype">

     <li class="active col-xs-3" id="7"><a href="#dc">DEBIT / CREDIT CARD</a></li>
 <li class="col-xs-2" id="2"><a href="#wallet">WALLET</a></li>

                      <li class=" col-xs-2" id="1"><a href="#cash">CASH</a></li>
   
                       <li class="col-xs-2" id="3"><a href="#nb">NET BANKING</a></li>
                      <li class="col-xs-2" id="5" onclick="OpenQ()" style="display: none;"><a href="#qpy">QUICK PAY</a></li>
                  
                           
                        </ul>
                    </div>
                    <div id="cash" class="payment-content">
                        <div class="col-md-7 col-xs-12" style="padding-top: 45px;">
                            <div class="pickup-check">
                                <span class="pymt-select">
                                    <input type="checkbox" id="test1" name="chkcash" value="1" />
                                    <label for="test1">&nbsp;Pick Up point</label></span>
                            </div>
                            <div class="pickup-check">
                                <span class="pymt-select">
                                    <input type="checkbox" id="test2" name="chkcash" value="0" />
                                    <label for="test2">&nbsp;Delivery Point</label></span>
                            </div>
                            <p class="pymt-terms">By clicking "Make payment" you agree to the terms and conditions</p>
                        </div>
                        <div class="col-md-4 col-md-offset-1 col-xs-5 hidden-xs">
                            <img src="../BookTask/img/payment-icon.svg" alt="" width="150" />
                        </div>
                        <div class="col-md-12 col-xs-12">
                            <div class="pymt_txt">
                                <ul>
                                    <li>Terms and Condition</li>
                                   <li>If the task is not cancelled at least 2 hours prior to the pick up time, a cancellation fee of Rs.100 would be levied.</li>
                                            <li>Please note that our executive is allowed to wait 15 minutes on arrival at the pick-up or the drop location and after 15 minutes, waiting charges will be applicable of Rs.100/- per   30 minutes.</li>
                                            <li>If the parcel exceeds 5kgs an excess baggage fee of Rs.100 will be charged.</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Cash end -->
                    <div id="qpy" class="payment-content"> 
                        <div id="DivPayment" class="owl-carousel owl-payment" runat="server">
                           
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-xs-12">
                                <p class="pymt-terms">By clicking "Make payment" you agree to the terms and conditions</p>
                                <div class="pymt_txt">
                                    <ul>
										<li><b>Terms and Condition</b></li>
                                       <li>If the task is not cancelled at least 2 hours prior to the pick up time, a cancellation fee of Rs.100 would

be levied.</li>
                                            <li>Please note that our executive is allowed to wait 15 minutes on arrival at the pick-up or the drop location and after 15 minutes, waiting charges will be applicable of Rs.100/- per   30 minutes.</li>
                                            <li>If the parcel exceeds 5kgs an excess baggage fee of Rs.100 will be charged.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="dc" class="payment-content">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="cdebit-box">
                                    <div class="col-md-12 cdebit-bdr">
                                        <h5 class="card-no sm">Card Number</h5>
                                        <div class="cdebit-input">
                                            <input placeholder="XXXX" class="form-control" id="ccdcno1" maxlength="4" onkeyup="MoveFromA()" type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' />
                                        </div>
                                        <div class="cdebit-input">
                                            <input placeholder="XXXX" class="form-control" id="ccdcno2" maxlength="4" onkeyup="MoveFromB()" type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' />
                                        </div>
                                        <div class="cdebit-input">
                                            <input placeholder="XXXX" class="form-control" id="ccdcno3" maxlength="4" onkeyup="MoveFromC()" type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' />
                                        </div>
                                        <div class="cdebit-input">
                                            <input placeholder="XXXX" class="form-control" id="ccdcno4" maxlength="4" type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' onblur="CnoD()" />
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-md-12 cdebit-bdr">
                                        <h5 class="card-no sm">Card Name</h5>
                                        <div class="cdebit-input" style="width: 100%;">
                                            <input type="text" placeholder="Card Holder Name" id="ccdname" class="form-control" onblur="CName()" onKeyPress="return ValidateAlpha(event);" />
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-md-12">
                                        <div class="col-md-6 col-xs-6" style="border-right: 1px solid #999; padding-bottom: 10px;">
                                            <h5 class="card-no sm">Expiry Date</h5>
                                            <div style="border:.5px #999;">
                                            <span class="exp-date"><input type="text" id="cm" class="exp-date" placeholder="MM" onblur="fncm()" onkeypress='return event.charCode >= 48 && event.charCode <= 57' onkeyup="fncm1();" style="width:20%;border:0px;" maxlength="2" />|<input type="text" class="exp-date" id="cy" style="width:40%;border:0px" placeholder="YY" onblur="fncy()" onkeypress='return event.charCode >= 48 && event.charCode <= 57'  onkeyup="fncy1();"  maxlength="2"/></span>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xs-6">
                                            <h5 class="card-no sm">CVV</h5>
                                            <span class="exp-date">
                                                <div class="cdebit-input" style="width: 50%;">
                                                    <input type="password" style="box-shadow: none;border: none;" placeholder="CVV" id="cv" class="form-control" maxlength="3" onkeypress='return event.charCode >= 48 && event.charCode <= 57' onblur="fnccv()" />
                                                </div>
												<div class="cdebit-input" style="width: 40%;">
                                                      <img src="../BookTask/img/Visa.png" class="pull-righ cimgcs" id="cimg" alt="" />
                                                  </div>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="quick-pay" style="opacity: .0;">
                                    <h5 class="tc_check">
<input id="chkqpy" type="checkbox" style="opacity: 0;" />
<label for="chkqpy">Quick Pay</label>
</h5>
                                    <p>Save this card info. for faster payment in future.</p>
                                    <p>By clicking "Make Payment" you agree to the Terms & Conditions</p>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div id="nb" class="payment-content">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-4">
                                    <div class="netbank-box">
                                        <span class="quick-select">
                                            <input type="checkbox" name="bank" id="bank" value="CID002" />
                                            <label for="bank">
                                                <img src="../BookTask/img/axis-bank.png" alt="" /></label></span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="netbank-box">
                                        <span class="quick-select">
                                            <input type="checkbox" name="bank" id="bank1" value="CID019" />
                                            <label for="bank1">
                                                <img src="../BookTask/img/bank-of-india.png" alt="" /></label></span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="netbank-box">
                                        <span class="quick-select">
                                            <input type="checkbox" name="bank" id="bank2" value="CID021" />
                                            <label for="bank2">
                                                <img src="../BookTask/img/bank-of-maharashtra.png" alt="" /></label></span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="netbank-box">
                                        <span class="quick-select">
                                            <input type="checkbox" name="bank" id="bank3" value="CID009" />
                                            <label for="bank3">
                                                <img src="../BookTask/img/federal-bank.png" alt="" /></label></span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="netbank-box">
                                        <span class="quick-select">
                                            <input type="checkbox" name="bank" id="bank4" value="CID010" />
                                            <label for="bank4">
                                                <img src="../BookTask/img/hdfc-bank.png" alt="" /></label></span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="netbank-box">
                                        <span class="quick-select">
                                            <input type="checkbox" name="bank" id="bank5" value="CID001" />
                                            <label for="bank5">
                                                <img src="../BookTask/img/icici-bank.png" alt="" /></label></span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="netbank-box">
                                        <span class="quick-select">
                                            <input type="checkbox" name="bank" id="bank6" value="CID028" />
                                            <label for="bank6">
                                                <img src="../BookTask/img/induslnd.png" alt="" /></label></span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="netbank-box">
                                        <span class="quick-select">
                                            <input type="checkbox" name="bank" id="bank7" value="CID004" />
                                            <label for="bank7">
                                                <img src="../BookTask/img/Yes.png" alt="" /></label></span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="netbank-box">
                                        <span class="quick-select">
                                            <input type="checkbox" name="bank" id="bank8" value="CID005" />
                                            <label for="bank8">
                                                <img src="../BookTask/img/sbi.png" alt="" /></label></span>
                                    </div>
                                </div>
                                <div class="col-md-offset-6 col-md-6 col-md-offset-0">
                                    <h5 class="card-no sm">ALL BANK</h5>
                                    <h3 class="all-bank-select"> <div class="bank_select_box"><select id="otherbanks" class="bank_select"> >
<option value="0" >Select Another Bank</option>
<option value="CID005">SBI Bank</option>
<option value="CID010">HDFC Bank</option>
<option value="CID001">ICICI Bank</option>
<option value="CID002">AXIS Bank</option>
<option value="CID027">Indian Overseas Bank</option>
<option value="CID012">State Bank of Hyderabad</option>
<option value="CID011">IDBI Bank</option>
<option value="CID016">Andhra Bank</option>
<option value="CID019">Bank of India</option>
<option value="CID021">Bank of Maharashtra</option>
<option value="CID051">Canara Bank</option>
<option value="CID045">Catholic Syrian Bank</option>
<option value="CID023">Central Bank of India</option>
<option value="CID024">City Union Bank</option>
<option value="CID025">Corporation Bank</option>
<option value="CID053">Cosmos Bank</option>
<option value="CID026">DCB Bank Personal</option>
<option value="CID006">Deutsche Bank</option>
<option value="CID009">Federal Bank</option>
<option value="CID008">Indian Bank</option>
<option value="CID028">IndusInd Bank</option>
<option value="CID031">Karnataka Bank</option>
<option value="CID032">Karur Vysya Bank</option>
<option value="CID036">PNB Corporate</option>
<option value="CID044">PNB Retail</option>
<option value="CID037">South Indian Bank</option>
<option value="CID013">State Bank of Bikaner and Jaipur</option>
<option value="CID014">State Bank of Mysore</option>
<option value="CID043">State Bank of Patiala</option>
<option value="CID015">State Bank of Travancore</option>
<option value="CID070">UCO Bank</option>
<option value="CID041">United Bank of India</option>
<option value="CID042">Vijaya Bank</option>
<option value="CID004">YES Bank</option>
</select>
										<span class="down_arrow"><i class="fa fa-angle-down"></i></span>
</div></h3>
                                </div>
                                <div class="col-md-12">
                                    <div class="quick-pay">
                                        <p>By clicking "Make Payment" you agree to the Terms & Conditions</p>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                    <div id="wallet" class="payment-content">
                        <div class="col-md-7 col-xs-12" style="padding-top: 45px;">
                            <div class="pickup-check mywallet" id="divwall">
                                <div class="row">
                                    <div class="col-md-7 col-xs-7">
                                        <span class="pymt-select">
                                            <input type="checkbox" id="wallet1" name="wal" value="2" />
                                            <label for="wallet1">&nbsp;My Wallet</label></span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 right">
                                        <strong><i class="fa fa-rupee"></i>
                                            <asp:Label ID="wallbal" runat="server" Font-Size="Larger" ForeColor="Black" Text="0"></asp:Label></strong><br />
                                        <span>Your Balance</span>
                                    </div>
                                </div>
                            </div>
                            <div class="wallet">
                                <h5 class="card-no sm">Other External Wallets</h5>
                                <div class="pickup-check">
                                    <span class="pymt-select">
                                        <input type="checkbox" id="wallet2"  name="wal" value="3" />
                                        <label for="wallet2">&nbsp;Mobiwik Wallet</label></span>
                                    <img src="../BookTask/img/MobiKwik.png" />
                                </div>
                                <div class="pickup-check">
                                    <span class="pymt-select">
                                        <input type="checkbox" id="paytm"  name="wal" value="4" />
                                        <label for="paytm">&nbsp;Paytm Wallet</label></span>
                                    <img src="../BookTask/img/Paytm.png" />
                                </div>
                                <div class="pickup-check">
                                    <span class="pymt-select">
                                        <input type="checkbox" id="payu"  name="wal" value="5" />
                                        <label for="payu">&nbsp;PayU Money</label></span>
                                    <img src="../BookTask/img/payu@2x.png"  />
                                </div>
                                <div class="pickup-check" style="display:none">
                                    <span class="pymt-select">
                                        <input type="checkbox" id="cit"  name="wal" value="6" />
                                        <label for="cit">&nbsp;Citrus Money</label></span>
                                    <img src="../BookTask/img/Citrus.png" />
                                </div>
                            </div>
                            <p class="pymt-terms">By clicking "Make Payment" you agree to the Terms & Conditions</p>
                        </div>
                        <div class="col-md-4 col-md-offset-1 col-xs-5 hidden-xs">
                            <img style="padding-top: 100px;" src="../BookTask/img/payment-icon.svg" width="150" alt="" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-xs-12">
                    <h4 class="ord-text">ORDER OVERVIEW</h4>
                    <div class="bt-order-view">
                        <div class="col-md-6 col-xs-6">Service Fee</div>
                        <div class="col-md-6 col-xs-6 text-right" id="divsfee" runat="server"><i class="fa fa-rupee"></i></div>
                        <div class="clearfix"></div>
                        <div class="col-md-6 col-xs-6">Cash Handling</div>
                        <div class="col-md-6 col-xs-6 text-right" id="divCash" runat="server"><i class="fa fa-rupee"></i></div>
                        <div class="clearfix"></div>
                        <div class="col-md-6 col-xs-6">Excess Baggage</div>
                        <div class="col-md-6 col-xs-6 text-right" id="divbag" runat="server"><i class="fa fa-rupee"></i></div>
                        <div class="clearfix"></div>
                        <div class="col-md-6 col-xs-6">Discount</div>
                        <div class="col-md-6 col-xs-6 text-right" id="divdiscount" runat="server"><i class="fa fa-rupee"></i>0 </div>
                        <div class="clearfix"></div>
                        <div class="row bt-order-total">
                            <div class="col-md-6 col-xs-6">Total Amount</div>
                            <div class="col-md-6 col-xs-6 text-right" id="divtotal" runat="server"><i class="fa fa-rupee"></i>0 </div>
                        </div>
                        <p id="coupon-trigger" class="coupon">Have a coupon code?</p>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="coupon-check" id="coupon-body">
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Enter Coupon code" type="text"  id="promo">
                                    </div>
                                    <a class="btn btn-normal" id="cancel" name="button" type="submit">cancel</a>
                                    <a class="btn btn-apply" id="apply" name="button" type="submit" onclick="FnPromo()">Apply</a>
                                </div>
                            </div>
                        </div>
                    </div>
					 <div   data-target="#conf-task" class="make-payment" id="mkpay" onclick="fncheck()">MAKE PAYMENT</div>
                    <div class="bt-order-detail">
                        <h5>PICK UP ADDRESS</h5>
                        <div id="divpadd" runat="server">
                            <p><strong>Home</strong></p>
                        </div>
                    </div>
                    <div class="bt-order-detail">
                        <h5>DROP ADDRESS</h5>
                        <div id="divdadd" runat="server">
                            <p><strong>Home</strong></p>
                        </div>
                    </div>
                    <div class="bt-order-detail">
                        <h5>DATE &amp; TIME</h5>
                        <div id="divtime" runat="server">
                            <p><strong>Today</strong>: 8:00Am - 8:45Am, 20 MAY</p>
                        </div>
                    </div>
                   
                    <%--<asp:Button ID="btn_payment" runat="server" Text="MAKE PAYMENT" Width="100%" Height="100%" BorderStyle="None" CssClass="make-payment" OnClick="btn_payment_Click" />--%>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <p class="payment-copyright">Copyright 2016 &copy; Russsh Corporate Services Pvt.Ltd. All Rights Reserved.</p>
                </div>
            </div>
        </div>
        <div class="modal" id="conf-task" tabindex="-1" role="dialog" aria-hidden="true" data-appear-animation="bounceInUp" data-appear-animation-delay="500">
            <div class="modal-dialog bt_box">
                <div class="modal-content">
                    <div class="modal-body" style="padding: 14px;">
                        <div class="row">
                            <a class="bt-close" data-dismiss="modal">
                                <img src="../BookTask/img/close-icon.svg" height="15" width="14" alt="" /></a>
                            <div class="bt_body conf_box">
                                <div class="row">
                                    <div class="col-md-12">
                                        <img src="../BookTask/img/delivery_confirm.svg" width="120" height="110" alt="" />
                                        <h4>Your Delivery has been confirmed and will be delivered.</h4>
                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard</p>
                                        <span class="pull-right"><a href="#">CANCEL</a> <%--<a href="#">PROCEED</a>--%>
                                            <asp:Button ID="btnPay" runat="server" class="make-payment" Text="PROCEED" OnClick="btnPay_Click" />
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="conf-track">
                                <div id="google_map">
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15084.855870834368!2d72.82961639521486!3d19.054327857304095!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xcf18778d6fc35aae!2sRusssh!5e0!3m2!1sen!2sin!4v1474270145195" width="100%" height="150" frameborder="0" style="border: 0"></iframe>
                                </div>
                                <div class="conf-track-map">
                                    Track your order live
                                    <br />
                                    in few minute
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <a class="notify-trigger" id="aerror" href="#"></a>
            <asp:HiddenField ID="hndptype" runat="server" ClientIDMode="Static" Value="8" />
            <asp:HiddenField ID="hndcashtype" runat="server" ClientIDMode="Static" Value="9" />
            <asp:HiddenField ID="hndrid" runat="server" ClientIDMode="Static" Value="0" />
             <asp:HiddenField ID="hndcid" runat="server" ClientIDMode="Static" Value="0" />
            <asp:HiddenField ID="hndweight" runat="server" ClientIDMode="Static" Value="0" />
            <asp:HiddenField ID="hndbankval" runat="server" ClientIDMode="Static" Value="0" />
            <asp:TextBox ID="txtoutstanding" runat="server" Text="0" Visible="false" ></asp:TextBox>

        </div>
    </form>
    <script src="../code.jquery.com/jquery-latest.min.js"></script>
    <!-- Jquery Library Call -->
    <script src="../js-web/helper-plugins.js"></script>
    <!-- Plugins -->
    <script src="../js-web/bootstrap.js"></script>
    <!-- UI -->
    <script src="../plugin/owl-2016/owl.carousel.js"></script>
    <script type="text/javascript">
        $('#DivPayment').owlCarousel({
            center: true,
            items: 1,
            loop: true,
            margin: 0,
            lazyLoad: false,
            responsiveClass: true,
            nav: false,
            navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
            responsive: {
                0: {
                    items: 1,
                    nav: false,
                    dots: true,
                },
                600: {
                    items: 1,
                    nav: false,
                },
                1000: {
                    nav: true,
                    dots: false,
                    loop: true,
                    items: 2,
                    center: true,
                }
            }
        });
    </script>
    <script src="../BookTask/bt-js/bootstrap-slider.min.js"></script>
    <!-- weight range-->
    <script type="text/javascript">
        $(document).ready(function () {
            $(".payment-tab a").click(function (event) {
                event.preventDefault();
                $(this).parent().addClass("active");
                $(this).parent().siblings().removeClass("active");
                var tab = $(this).attr("href");
                $(".payment-content").not(tab).css("display", "none");
                $(tab).fadeIn('slow');
            });
        });
    </script>
    <script src="../BookTask/bt-js/bt-init.js"></script>
    <!-- bt-init -->
    <script type="text/javascript">
        $("#coupon-trigger").click(function () {
            $("#coupon-body").fadeIn("slow").show();
            $(".coupon").fadeOut("slow").hide();
        });
        $("#cancel").click(function () {
            $(".coupon").toggle();
            $("#coupon-body").fadeOut("slow").hide();
            $(".coupon-check input").val('');
        });
        $(".coupon-check input").keyup(function () {
            var _val = $(this).val();
            if (_val != "") {
                $("#apply").show();
                $("#cancel").hide();
            } else {
                $("#cancel").show();
                $("#apply").hide();
            }
        });
    </script>
    <script type="text/javascript">
        $('.pickup-check input[type="checkbox"]').on('change', function () {
            $('.pickup-check input[type="checkbox"]').not(this).prop('checked', false);
        });
        $('.quick-select input[type="checkbox"]').on('change', function () {
            $('.quick-select input[type="checkbox"]').not(this).prop('checked', false);
        });
        $('input[type="checkbox"]').on('change', function () {
            $('input[type="checkbox"]').not(this).prop('checked', false);
        });
		document.getElementById("qpy").style.display = 'none';
    </script>
</body>
</html>
