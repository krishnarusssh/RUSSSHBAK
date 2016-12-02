<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="BookTask_Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Book Task - Payment</title>
    <link rel="stylesheet" type="text/css" href="../css-web/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="bt-css/book-task.css" />
   <%--<link rel="stylesheet" type="text/css" href="bt-css/component.css" />--%>
    <link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.carousel.min.css" />
    <link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.theme.default.min.css" />
    <script src="bt-js/filter.js"></script>
    <script src="../lib1/js/jquery-1.10.1.min.js"></script>
    <script src="bt-js/payment.js"></script>
    <script src="../js-web/modernizr.js"></script>
    <!-- Modernizr -->
</head>
<body>
    <div class="notify_box">Look likes you have taken too long to make a payment.Please try again after changing the delivery time.</div>
    <form id="form1" runat="server">
        <header class="payment-header">
            <img src="img/russsh.png" class="center-block" width="115" alt="" />
        </header>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-xs-12 payment-container">
                    <div class="payment-tab row payment-scroll">
                        <ul class="col-md-12 col-xs-12 payment-overf" id="paytype">
                            <li class="col-xs-2" id="licash"><a href="#cash">CASH</a></li>
                            <li class="active col-xs-2" id="liqpy"><a href="#qpy">QUICK PAY</a></li>
                            <li class="col-xs-3" id="lidc"><a href="#dc">DEBIT / CREDIT CARD</a></li>
                            <li class="col-xs-2" id="linb"><a href="#nb">NET BANKING</a></li>
                            <li class="col-xs-2" id="liwallet"><a href="#wallet">WALLET</a></li>
                        </ul>
                    </div>
                    <div id="cash" class="payment-content">
                        <div class="col-md-7 col-xs-10" style="padding-top: 45px;">
                            <div class="pickup-check">
                                <span class="pymt-select">
                                    <input type="checkbox" id="test1" name="chkcash" />
                                    <label for="test1">&nbsp;Pick Up Cash</label></span>
                            </div>
                            <div class="pickup-check">
                                <span class="pymt-select">
                                    <input type="checkbox" id="test2" name="chkcash" />
                                    <label for="test2">&nbsp;Drop Cash</label></span>
                            </div>
                            <p class="pymt-terms">By clicking "Make payment" you agree to the terms and conditions</p>
                        </div>
                        <div class="col-md-4 col-md-offset-1 col-xs-5 hidden-xs">
                            <img src="img/payment-icon.svg" alt="" width="150" />
                        </div>
                        <div class="col-md-12 col-xs-12">
                            <div class="pymt_txt">
                                <ul>
                                    <li>Terms and Condition</li>
                                    <li>If the task is cancelled within 2 hours prior the pickup time.Cancellation fee 
of RS 100 would be applicable.</li>
                                    <li>Please note that our executive is allowed to wait 15 minutes on arrival at the pick-up or the drop location and after 15 minutes, waiting charges will be 
applicable of Rs.100/- per 30 Minutes.</li>
                                    <li>If the parcel exceeds an excess baggage fee of Rs.100 will be charged.</li>
                                    <li>We charge Rs.100 for cash on delivery Return (COD Return).</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Cash end -->
                    <div id="qpy" class="payment-content">
                        <div id="owl-payment" class="owl-carousel owl-payment">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="quick-card">
                                        <div class="quick-check">
                                            <span class="quick-select">
                                                <input type="checkbox" id="zubair" />
                                                <label for="zubair">&nbsp;Zubair Shaikh</label></span>
                                        </div>
                                        <div class="card-style">
                                            <h5 class="card-no">Card Number</h5>
                                            <div class="card-input">
                                                <input type="text" placeholder="XXXX" class="form-control" disabled="disabled" />
                                            </div>
                                            <div class="card-input">
                                                <input type="text" placeholder="XXXX" class="form-control"  disabled="disabled"  />
                                            </div>
                                            <div class="card-input">
                                                <input type="text" placeholder="XXXX" class="form-control"  disabled="disabled"  />
                                            </div>
                                            <div class="card-input">
                                                <input type="text" placeholder="XXXX" class="form-control"  disabled="disabled"  />
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="row">
                                                <div class="col-md-5 col-xs-5" style="padding-bottom: 10px;">
                                                    <h5 class="card-no sm">Expiry Date</h5>
                                                    <span class="exp-date">07 </span><span style="border-left: 1px solid #999; padding-left: 15px;">21</span>
                                                </div>
                                                <div class="col-md-5 col-xs-5">
                                                    <h5 class="card-no sm">CVV</h5>
                                                    <span class="exp-date">
                                                        <div class="cdebit-input" style="width: 100%;">
                                                            <input type="text" placeholder="CVV" class="form-control" />
                                                        </div>
                                                    </span>
                                                </div>
                                                <div class="col-md-2 col-xs-2">
                                                    <img src="img/visa.png" class="pull-right" alt="" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="quick-card">
                                        <div class="quick-check">
                                            <span class="quick-select">
                                                <input type="checkbox" id="sagar" />
                                                <label for="sagar">&nbsp;Sagar Jadhav</label></span>
                                        </div>
                                        <div class="card-style">
                                            <h5 class="card-no">Card Number</h5>
                                            <div class="card-input">
                                                <input type="text" placeholder="XXXX" class="form-control" />
                                            </div>
                                            <div class="card-input">
                                                <input type="text" placeholder="XXXX" class="form-control" />
                                            </div>
                                            <div class="card-input">
                                                <input type="text" placeholder="XXXX" class="form-control" />
                                            </div>
                                            <div class="card-input">
                                                <input type="text" placeholder="XXXX" class="form-control" />
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="row">
                                                <div class="col-md-5 col-xs-5" style="padding-bottom: 10px;">
                                                    <h5 class="card-no sm">Expiry Date</h5>
                                                    <span class="exp-date">07 <span style="border-left: 1px solid #999; padding-left: 15px;">21</span></span>
                                                </div>
                                                <div class="col-md-5 col-xs-5">
                                                    <h5 class="card-no sm">CVV</h5>
                                                    <span class="exp-date">
                                                        <div class="cdebit-input" style="width: 100%;">
                                                            <input type="text" placeholder="CVV" class="form-control" />
                                                        </div>
                                                    </span>
                                                </div>
                                                <div class="col-md-2 col-xs-2">
                                                    <img src="img/visa.png" class="pull-right" alt="" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="quick-card">
                                        <div class="quick-check">
                                            <span class="quick-select">
                                                <input type="checkbox" id="wasim" />
                                                <label for="wasim">&nbsp;Wasim Mansuri</label></span>
                                        </div>
                                        <div class="card-style">
                                            <h5 class="card-no">Card Number</h5>
                                            <div class="card-input">
                                                <input type="text" placeholder="XXXX" class="form-control" />
                                            </div>
                                            <div class="card-input">
                                                <input type="text" placeholder="XXXX" class="form-control" />
                                            </div>
                                            <div class="card-input">
                                                <input type="text" placeholder="XXXX" class="form-control" />
                                            </div>
                                            <div class="card-input">
                                                <input type="text" placeholder="XXXX" class="form-control" />
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="row">
                                                <div class="col-md-5 col-xs-5" style="padding-bottom: 10px;">
                                                    <h5 class="card-no sm">Expiry Date</h5>
                                                    <span class="exp-date">07 <span style="border-left: 1px solid #999; padding-left: 15px;">21</span></span>
                                                </div>
                                                <div class="col-md-5 col-xs-5">
                                                    <h5 class="card-no sm">CVV</h5>
                                                    <span class="exp-date">
                                                        <div class="cdebit-input" style="width: 100%;">
                                                            <input type="text" placeholder="CVV" class="form-control" />
                                                        </div>
                                                    </span>
                                                </div>
                                                <div class="col-md-2 col-xs-2">
                                                    <img src="img/visa.png" class="pull-right" alt="" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-xs-12">
                                <p class="pymt-terms">By clicking "Make payment" you agree to the terms and conditions</p>
                                <div class="pymt_txt">
                                    <ul>
                                        <li>Terms and Condition</li>
                                        <li>If the task is cancelled within 2 hours prior the pickup time.Cancellation fee 
of RS 100 would be applicable.</li>
                                        <li>Please note that our executive is allowed to wait 15 minutes on arrival at the pick-up or the drop location and after 15 minutes, waiting charges will be 
applicable of Rs.100/- per 30 Minutes.</li>
                                        <li>If the parcel exceeds an excess baggage fee of Rs.100 will be charged.</li>
                                        <li>We charge Rs.100 for cash on delivery Return (COD Return).</li>
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
                                            <input type="text" placeholder="XXXX" class="form-control" />
                                        </div>
                                        <div class="cdebit-input">
                                            <input type="text" placeholder="XXXX" class="form-control" />
                                        </div>
                                        <div class="cdebit-input">
                                            <input type="text" placeholder="XXXX" class="form-control" />
                                        </div>
                                        <div class="cdebit-input">
                                            <input type="text" placeholder="XXXX" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-md-12 cdebit-bdr">
                                        <h5 class="card-no sm">Card Name</h5>
                                        <div class="cdebit-input" style="width: 100%;">
                                            <input type="text" placeholder="Zubair Shaikh" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-md-12">
                                        <div class="col-md-6 col-xs-6" style="border-right: 1px solid #999; padding-bottom: 10px;">
                                            <h5 class="card-no sm">Expiry Date</h5>
                                            <span class="exp-date">07 <span style="border-left: 1px solid #999; padding-left: 15px;">21</span></span>
                                        </div>
                                        <div class="col-md-6 col-xs-6">
                                            <h5 class="card-no sm">CVV</h5>
                                            <span class="exp-date">
                                                <div class="cdebit-input" style="width: 100%;">
                                                    <input type="text" placeholder="CVV" class="form-control" />
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="col-md-11 col-md-offset-1">
                                <div class="quick-pay">
                                    <h5>
                                        <input type="checkbox" />&nbsp; Quick Pay</h5>
                                    <p>Save this card information to my Russsh account and make faster payments.</p>
                                    <p>By clicking "Make payment" you agree to the terms and conditions</p>
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
                                            <input type="checkbox" name="bank" id="bank" />
                                            <label for="bank">
                                                <img src="img/axis-bank.png" alt="" /></label></span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="netbank-box">
                                        <span class="quick-select">
                                            <input type="checkbox" name="bank1" id="bank1" />
                                            <label for="bank1">
                                                <img src="img/bank-of-india.png" alt="" /></label></span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="netbank-box">
                                        <span class="quick-select">
                                            <input type="checkbox" name="bank2" id="bank2" />
                                            <label for="bank2">
                                                <img src="img/bank-of-maharashtra.png" alt="" /></label></span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="netbank-box">
                                        <span class="quick-select">
                                            <input type="checkbox" name="bank3" id="bank3" />
                                            <label for="bank3">
                                                <img src="img/federal-bank.png" alt="" /></label></span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="netbank-box">
                                        <span class="quick-select">
                                            <input type="checkbox" name="bank4" id="bank4" />
                                            <label for="bank4">
                                                <img src="img/hdfc-bank.png" alt="" /></label></span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="netbank-box">
                                        <span class="quick-select">
                                            <input type="checkbox" name="bank5" id="bank5" />
                                            <label for="bank5">
                                                <img src="img/icici-bank.png" alt="" /></label></span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="netbank-box">
                                        <span class="quick-select">
                                            <input type="checkbox" name="bank6" id="bank6" />
                                            <label for="bank6">
                                                <img src="img/induslnd.png" alt="" /></label></span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="netbank-box">
                                        <span class="quick-select">
                                            <input type="checkbox" name="bank7" id="bank7" />
                                            <label for="bank7">
                                                <img src="img/kotak.png" alt="" /></label></span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="netbank-box">
                                        <span class="quick-select">
                                            <input type="checkbox" name="bank8" id="bank8" />
                                            <label for="bank8">
                                                <img src="img/sbi.png" alt="" /></label></span>
                                    </div>
                                </div>
                                <div class="col-md-offset-6 col-md-6 col-md-offset-0">
                                    <h5 class="card-no sm">ALL BANK</h5>
                                    <h3 class="all-bank-select">HDFC BANK</h3>
                                </div>
                                <div class="col-md-12">
                                    <div class="quick-pay">
                                        <h5>
                                            <input type="checkbox" />&nbsp; Quick Pay</h5>
                                        <p>Save this card information to my Russsh account and make faster payments.</p>
                                        <p>By clicking "Make payment" you agree to the terms and conditions</p>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                    <div id="wallet" class="payment-content">
                        <div class="col-md-7 col-xs-12" style="padding-top: 45px;">
                            <div class="pickup-check mywallet">
                                <div class="row">
                                    <div class="col-md-7 col-xs-7">
                                        <span class="pymt-select">
                                            <input type="checkbox" id="wallet1" />
                                            <label for="wallet1">&nbsp;My Wallet</label></span>
                                    </div>
                                    <div class="col-md-5 col-xs-5 right">
                                        <strong><i class="fa fa-rupee"></i>3000</strong><br />
                                        <span>Your Balance</span>
                                    </div>
                                </div>
                            </div>
                            <div class="wallet">
                                <h5 class="card-no sm">ALL BANK</h5>
                                <div class="pickup-check">
                                    <span class="pymt-select">
                                        <input type="checkbox" id="wallet2" />
                                        <label for="wallet2">&nbsp;Mobiwik Wallet</label></span>
                                    <img src="img/MobiKwik.png" />
                                </div>
                                <div class="pickup-check">
                                    <span class="pymt-select">
                                        <input type="checkbox" id="paytm" />
                                        <label for="paytm">&nbsp;Paytm Wallet</label></span>
                                    <img src="img/Paytm.png" />
                                </div>
                                <div class="pickup-check">
                                    <span class="pymt-select">
                                        <input type="checkbox" id="payu" />
                                        <label for="payu">&nbsp;PayU Money</label></span>
                                    <img src="img/payu.png" />
                                </div>
                                <div class="pickup-check">
                                    <span class="pymt-select">
                                        <input type="checkbox" id="cit" />
                                        <label for="cit">&nbsp;Citrus Money</label></span>
                                    <img src="img/Citrus.png" />
                                </div>
                            </div>
                            <p class="pymt-terms">By clicking "Make payment" you agree to the terms and conditions</p>
                        </div>
                        <div class="col-md-4 col-md-offset-1 col-xs-5 hidden-xs">
                            <img style="padding-top: 100px;" src="img/payment-icon.svg" width="150" alt="" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-xs-12">
                    <h4 class="ord-text">ORDER OVERVIEW</h4>
                    <div class="bt-order-view">
                        <div class="col-md-6 col-xs-6">Service Fee</div>
                        <div class="col-md-6 col-xs-6 text-right"><i class="fa fa-rupee"></i>900</div>
                        <div class="clearfix"></div>
                        <div class="col-md-6 col-xs-6">Cash Handling</div>
                        <div class="col-md-6 col-xs-6 text-right"><i class="fa fa-rupee"></i>900</div>
                        <div class="clearfix"></div>
                        <div class="col-md-6 col-xs-6">Excess Baggage</div>
                        <div class="col-md-6 col-xs-6 text-right"><i class="fa fa-rupee"></i>900</div>
                        <div class="clearfix"></div>
                        <div class="col-md-6 col-xs-6">Discount</div>
                        <div class="col-md-6 col-xs-6 text-right"><i class="fa fa-rupee"></i>900</div>
                        <div class="clearfix"></div>
                        <div class="row bt-order-total">
                            <div class="col-md-6 col-xs-6">Total Amount</div>
                            <div class="col-md-6 col-xs-6 text-right"><i class="fa fa-rupee"></i>1000.00</div>
                        </div>
                        <p id="coupon-trigger" class="coupon">Have a coupon code?</p>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="coupon-check" id="coupon-body">
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Enter Coupon code" type="text">
                                    </div>
                                    <button class="btn btn-normal" id="cancel" name="button" type="submit">cancel</button>
                                    <button class="btn btn-apply" id="apply" name="button" type="submit">Apply</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bt-order-detail">
                        <h5>PICK UP ADDRESS</h5>
                        <p><strong>Home</strong>: 9th Floor, Dheeraj Arma, Station Road, Anant Marg Palace.. </p>
                    </div>
                    <div class="bt-order-detail">
                        <h5>DROP ADDRESS</h5>
                        <p><strong>Office</strong>: 9th Floor, Dheeraj Arma, Station Road, Anant Marg Palace.. </p>
                    </div>
                    <div class="bt-order-detail">
                        <h5>DATE &amp; TIME</h5>
                        <p><strong>Today</strong>: 8:00Am - 8:45Am, 20 MAY</p>
                    </div>
                    <div data-toggle="modal" data-target="#conf-task" class="make-payment">MAKE PAYMENT</div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <p class="payment-copyright">Copyright 2016 &copy; Russsh Pvt.Ltd. All Rights Reserved.</p>
                </div>
            </div>
        </div>
        <div class="modal" id="conf-task" tabindex="-1" role="dialog" aria-hidden="true" data-appear-animation="bounceInUp" data-appear-animation-delay="500">
            <div class="modal-dialog bt_box">
                <div class="modal-content">
                    <div class="modal-body" style="padding: 14px;">
                        <div class="row">
                            <a class="bt-close" data-dismiss="modal">
                                <img src="img/close-icon.svg" height="15" width="14" alt="" /></a>
                            <div class="bt_body conf_box">
                                <div class="row">
                                    <div class="col-md-12">
                                        <img src="img/delivery_confirm.svg" width="120" height="110" alt="" />
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
        <div >
            <a class="notify-trigger" id="aerror" href="#"> </a>
            <asp:HiddenField ID="hndptype" runat="server" ClientIDMode="Static" Value="" />

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
        $('#owl-payment').owlCarousel({
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
    <script src="bt-js/bootstrap-slider.min.js"></script>
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
    <script src="bt-js/bt-init.js"></script>
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
    </script>
</body>
</html>