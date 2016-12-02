<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="services_chocolate_delivery_Default" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/Footer.ascx" %>

<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chocolate Delivery Anywhere In Mumbai – Visit Russsh.com!</title>
    <meta name="title" content="Same Day Delivery For Chocolatiers| Download App| Russsh.com    " />
    <meta name="description" content="We deliver chocolate box & chocolate baskets. Chocolatiers should ask for monthly packages. Pay Online or COD. Available in Mumbai, Thane & Navi Mumbai." />

    <meta name="keywords" content="" />
    <meta name="author" content="" />
    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <!-- CSS -->
    <link href="../../css-web/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../../css-web/style.css" rel="stylesheet" type="text/css">
    <link href="../../css-web/media-style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="../service-material/css/all-services.css">
    <!-- service page -->
    <link rel="stylesheet" type="text/css" href="../../plugin/owl-2016/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="../../plugin/owl-2016/owl.theme.default.min.css">
    <link rel="stylesheet" type="text/css" href="../../mega-dropdown/css/style.css">
    <link rel="stylesheet" type="text/css" href="../../plugin/login-slider/content-slide.css">
    <link rel="stylesheet" type="text/css" href="../service-material/css/select-style.css">
    <!-- select option -->
    <link href="https://fonts.googleapis.com/css?family=Courgette" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="../service-material/css/bootstrap-slider.css">
    <!-- service page -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <!-- date picker -->
    <script src="https://use.fontawesome.com/396bc1486a.js"></script>
    <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <!--[if lt IE 9]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if lte IE 8]><link rel="stylesheet" type="text/css" href="css/ie8.css" media="screen"/><![endif]-->
    <script src="../../js-web/modernizr.js"></script>
    <!-- Modernizr -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-65976441-1', 'auto');
  ga('send', 'pageview');
</script>
</head>
<body>
    <form id="form1" runat="server">
               <uc:Header ID="Header" runat="server" MinValue="1" MaxValue="10" />

        <!-- Banner Section -->
        <div style="overflow: hidden;">
            <div class="cake-image"></div>
        </div>
        <div class="content">
            <div class="container" style="background: #e9e9eb;">
                <div class="row">
                    <div class="col-md-5">
                        <img src="https://www.russsh.com/services/chocolate-delivery-service-for-chocolatiers/images/chocolate-item.png" style="margin-left: 10px;" class="img-responsive" alt="" title="" />
                    </div>
                    <div class="col-md-6 col-md-offset-1">
                        <div class="service-text">
                            <h1>Chocolate Basket Delivery
                                <br />
                                In Mumbai</h1>
                            <p>Impress your customers with on-demand deliveries.</p>
                        </div>
                    </div>
                </div>
                <div class="row service-bottom">
                    <div class="service-box">
                        <div class="internal">
                            <p>User Rating</p>
                           <%-- <h3>4.0
                                <img src="../service-material/images/rating.jpg" alt="" title="" /></h3>--%>
                             <p>Coming Soon</p>
                        </div>
                        <div class="internal">
                            <p>Total Chocolate Delivered</p>
                            <h3 id="ntotal" runat="server">2860</h3>
                        </div>
                        <div class="internal">
                            <p>Pricing</p>
                            <ul class="list-item">
                               <li><a href="#" data-toggle="modal" data-target="#myModal">Calculator</a> |</li>
                                <li><a href="#" data-toggle="modal" data-target="#view-price">View Price</a></li>
                            </ul>
                        </div>
                        <div class="internal">
                            <p>Delivery Zone Map</p> <p>Coming Soon</p>
                            <%--<ul class="list-item">
                                <li><a href="#">View Map</a></li>
                            </ul>--%>
                        </div>
                        <div class="internal orange-bg hidden-xs hidden-sm" id="lnkBook1" runat="server">
                          <%--  <a href="#" class="book-btn">BOOK NOW</a>--%>
                             
                        </div>
                    </div>
                </div>
                <div class="row hidden-lg book-now-xs">
                    <div class="col-md-12" id="lnkBook2" runat="server">
                         
                    </div>
                </div>
            </div>
        </div>
        <!-- End banner -->
        <div class="container">
            <div class="row">
                <div class="col-md-12 paddingtb-20">
                    <ul class="breadcrumbs">
                        <li><a href="https://www.russsh.com/">Home</a> </li>
                        <li><a href="https://www.russsh.com/services/">Service</a></li>
                        <li>Chocolate Delivery</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row paddingtb-40 service-all">
                <div class="col-md-6">
                    <h2>About our CHOCOLATE DELIVERY service</h2>
                    <p>
                        Chocolates being the sweetest form of gifts give us an immense pleasure delivering them. Be it birthdays, anniversaries or any special occasion, we pickup and deliver all sizes and packages of chocolates, just within few hours of placing your delivery via the <a href="https://play.google.com/store/apps/details?
id=com.russsh.admin.russsh&hl=en">app</a>/<a href="https://russsh.com/">website</a>. To fulfil quick delivery requests, we have a dedicated team of customer support 7 days a week.
                    </p>
                    <p><strong>Note: You will have to take full responsibility of the packaging.</strong></p>
                </div>
                <div class="col-md-6">
                    <img src="../chocolate-delivery-service-for-chocolatiers/images/Chocolate-Delivery.svg" width="120" height="350" class="img-responsive center-block" style="padding-top: 80px;" alt="" />
                </div>
            </div>
            <div class="row paddingtb-40 service-all">
                <div class="col-md-6 col-md-push-6">
					<div class="service-padding">
                        <h2>3 Massive benefits of using Russsh while delivering chocolates</h2>
                        <ul>
                            <li><i class="fa fa-caret-right"></i> Pickup and home delivery at your convenience.</li>
                            <li><i class="fa fa-caret-right"></i> We wait for 15mins at the pickup or delivery point if you’re not around</li>
                            <li><i class="fa fa-caret-right"></i> Yes, we accept home delivery request at 12am. (*conditions applied) </li>
                        </ul>
                    </div>
                   
                </div>
                <div class="col-md-6 col-md-pull-6">
                     <img src="../service-material/images/3-massive-benefits.svg" class="img-responsive center-block pd-t50" alt="" />
                </div>
            </div>
            <div class="row paddingtb-40 service-all">
                <div class="col-md-6">
                    <div class="service-padding">
                        <h2>What others won’t do for you</h2>
                        <p>We can collect cash payments from your clients on delivery and return it back to you on the same day. All you have to do is choose RETURN TASK while filling in the task form. This not only saves you the hassle of placing a request twice but also saves you two way transportation fee.</p>
                        <p>Most importantly our delivery fee is fixed i.e. we don’t charge per km. <a href="https://www.russsh.com/pricing/">(More on Pricing here)</a></p>
                    </div>
                </div>
                <div class="col-md-6">
                    <img src="../service-material/images/what-other-want.svg" class="img-responsive center-block pd-t50" alt="" />
                </div>
            </div>
        </div>

        <section class="paddingtb-30 testimonial">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h3>Testimonials About Russsh</h3>
                         <ul id="owl-test" class="owl-carousel">
                            <!-- Item 1 -->
                            <li class="item">
                                <figure class="testimonial-hover">
                                    <img src="../../images/Test-1.jpg" alt="">
                                    <figcaption class="view-caption">
                                        <span class="quotes-left">
                                            <img src="../../images/russsh-icons/quotation-mark.svg" width="20" height="18" alt="" /></span>
                                        <p>I end up recommending the service to everyone in my trinity, be it my clients, my customers, my students in hope to suffice the service that you guys do. That’s not enough but how else do I thank Bharat for his brilliant idea.</p>
                                        <p><strong>Mulchand Dedhia</strong>
                                            <br />
                                            Founder
                                            <br />
                                            MeterDown.co.in</p>
                                        <span class="quotes-right">
                                            <img src="../../images/russsh-icons/quotation-mark2.svg" width="20" height="18" alt="" /></span>
                                    </figcaption>
                                </figure>
                            </li>
                            <!-- Item 2 -->
                            <li class="item">
                                <figure class="testimonial-hover">
                                    <img src="../../images/Oscar-Varghese.jpg" alt="Oscar Varghese" title="" />
                                    <figcaption class="view-caption">
                                        <span class="quotes-left">
                                            <img src="../../images/russsh-icons/quotation-mark.svg" width="20" height="18" alt="" /></span>
                                        <p>
                                            As a business owner I am in love with the service russsh.com offers because I can book tasks which allow me to free up my day and focus on things that really matter i.e doing more photoshoots and ergo making more money. 
                                        </p>
                                        <p><strong>Oscar Varghese</strong>
                                            <br />
                                            Professional Photographer</p>
                                        <span class="quotes-right">
                                            <img src="../../images/russsh-icons/quotation-mark2.svg" width="20" height="18" alt="" /></span>
                                    </figcaption>
                                </figure>
                            </li>
                            <!-- Item 3 -->
                            <li class="item">
                                <figure class="testimonial-hover">
                                    <img src="../../images/Test-3.jpg" alt="">
                                    <figcaption class="view-caption">
                                        <span class="quotes-left">
                                            <img src="../../images/russsh-icons/quotation-mark.svg" alt="" width="20" height="18" /></span>
                                        <p>I used the service a few times to send documents and catalogues. It's a big boon to have an errand running service like this considering I'm very busy running my business. They've got an ios app now so I don't call the customer service anymore as I book tasks on the go.</p>
                                        <p><strong>Brian Quadros</strong>
                                            <br />
                                            CEO
                                            <br />
                                            Thomas &amp; Brian Mfg. Pvt. Ltd</p>
                                        <span class="quotes-right">
                                            <img src="../../images/russsh-icons/quotation-mark2.svg" alt="" width="20" height="18" /></span>
                                    </figcaption>
                                </figure>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- service -->
        <div class="help hidden-xs">
            <div class="container">
                <h2>Some other services you want to know</h2>
                                       <div class="row">
                        <div class="col-md-12 help-service">
                            <ul id="owl-service" class="owl-carousel owl-alt">
                                <!-- Item 1 -->
                                <li class="item">
                                    <figure class="wpf-demo-5">
                                        <a href="#">
                                            <img src="../../images/cake-delivery.jpg" alt="Send birthday cake in Mumbai, Thane and Navi Mumbai"></a>
                                        <figcaption class="view-caption" id="cake_delivery_link1" runat="server">
                                            <h4>Cake Delivery </h4>
                                          <span id="cake_delivery_link" runat="server"><a href="#">Book Now</a></span>
                                          <span><a href="../cake-delivery-mumbai-thane-navi-mumbai/">Read More</a> </span>
                                        </figcaption>
                                    </figure>
                                    <span class="delivered" id="cake_delivery_count" runat="server">2828 <small>DELIVERED</small></span>
                                    <a href="../cake-delivery-mumbai-thane-navi-mumbai/"> <h4>Cake Delivery</h4></a>
                                    <p>We’ll deliver the cake, collect payment and return it within hours.</p>
                                </li>
                                <!-- Item 2 -->
                                <li class="item">
                                    <figure class="wpf-demo-5">
                                        <a href="#">
                                            <img src="../../images/clothes-delivery.jpg" alt="Clothes pick up and delivery service in Mumbai, Thane and Navi Mumbai"></a>
                                        <figcaption class="view-caption" id="Clothes_delivery_link1" runat="server">
                                            <h4>Clothes Delivery </h4>
                                            <span id="Clothes_delivery_link" runat="server"><a href="#">Book Now</a></span>
                                            <span><a href="../same-day-delivery-of-dress-shoe-accessory/">Read More</a> </span>
                                           
                                        </figcaption>
                                    </figure>
                                    <span class="delivered" id="Clothes_delivery_count" runat="server">3287 <small>DELIVERED</small></span>
                                     <a href="../same-day-delivery-of-dress-shoe-accessory/"><h4>Clothes Delivery</h4></a>
                                    <p>Send us to the tailor, laundry or a wholesale garment market. </p>
                                </li>
                                <!-- Item 3 -->
                                <li class="item">
                                    <figure class="wpf-demo-5">
                                        <a href="#">
                                            <img src="../../images/grocery-delivery.jpg" alt="Groceries delivered to home"></a>
                                        <figcaption class="view-caption" id="Grocery_delivery_link1" runat="server">
                                            <h4>Grocery Delivery </h4>
                                            <span id="Grocery_delivery_link" runat="server"><a href="#">Book Now</a></span>
                                             <span>  <a href="../grocery-delivery-in-mumbai/">Read More</a></span>
                                        </figcaption>
                                    </figure>
                                    <span class="delivered" id="Grocery_delivery_count" runat="server">2638 <small>DELIVERED</small></span>
                                     <a href="../grocery-delivery-in-mumbai/"><h4>Grocery Delivery</h4></a>
                                    <p>We’ll fetch items not available in your neighbourhood. Eat healthy! </p>
                                </li>
                                <!-- Item 4 -->
                                <li class="item">
                                    <figure class="wpf-demo-5">
                                        <a href="#">
                                            <img src="../../images/food-delivery.jpg" alt="Food delivery service"></a>
                                        <figcaption class="view-caption" id="food_delivery_link1" runat="server">
                                            <h4>Food Delivery </h4>
                                            <span id="food_delivery_link" runat="server"><a href="#">Book Now</a></span>
                                           <span> <a href="../food-delivery-in-mumbai-thane-navi-mumbai/">Read More</a></span>
                                        </figcaption>
                                    </figure>
                                    <span class="delivered" id="food_delivery_count" runat="server">2123 <small>DELIVERED</small></span>
                                     <a href="../food-delivery-in-mumbai-thane-navi-mumbai/"><h4>Food Delivery</h4></a>
                                    <p>You’ll find us handy when you crave for street food. </p>
                                </li>
                                <!-- Item 5 -->
                                <li class="item">
                                    <figure class="wpf-demo-5">
                                        <a href="#">
                                            <img src="../../images/gift-delivery.jpg" alt="Send gifts in Mumbai, Thane and Navi Mumbai"></a>
                                        <figcaption class="view-caption" id="gift_delivery_link1" runat="server">
                                            <h4>Gift Delivery </h4>
                                             <span id="gift_delivery_link" runat="server"><a href="#">Book Now</a></span>
                                            <span><a href="../gift-delivery-in-mumbai-thane-navi-mumbai/">Read More</a></span>
                                        </figcaption>
                                    </figure>
                                    <span class="delivered" id="gift_delivery_count" runat="server">188 <small>DELIVERED</small></span>
                                    <a href="../gift-delivery-in-mumbai-thane-navi-mumbai/"><h4>Gift Delivery</h4></a>
                                    <p>Midnight gift deliveries for your dearest is now a reality. </p>
                                </li>
                                <!-- flower delivery-->
                                <li class="item">
                                    <figure class="wpf-demo-5">
                                        <a href="#">
                                            <img src="../../images/flowers-delivery.jpg" alt="Flower delivery service in Mumbai, Thane and Navi Mumbai"></a>
                                        <figcaption class="view-caption" id="flower_delivery_link1" runat="server">
                                            <h4>Flower Delivery </h4>
                                            <span id="flower_delivery_link" runat="server"><a href="#">Book Now</a></span>
                                            <span><a href="../flowers-delivery/">Read More</a></span>
                                        </figcaption>
                                    </figure>
                                    <span class="delivered" id="flower_delivery_count" runat="server">597 <small>DELIVERED</small></span>
                                    <a href="../flowers-delivery/"><h4>Flower Delivery</h4></a>
                                    <p>Get fresh flowers home delivered from any florist of your choice. </p>
                                </li>
                                <!-- Electronic delivery -->
                                <li class="item">
                                    <figure class="wpf-demo-5">
                                        <a href="#">
                                            <img src="../../images/laptop-delivery.jpg" alt="Laptop pick up and delivery service in Mumbai, Thane and Navi Mumbai"></a>
                                        <figcaption class="view-caption" id="electronic_delivery_link1" runat="server">
                                            <h4>Electronic Delivery </h4>
                                            <span id="electronic_delivery_link" runat="server"><a href="#">Book Now</a></span>
                                           <span> <a href="../laptop-mobile-usb-charger-delivery-in-mumbai/">Read More</a></span>
                                        </figcaption>
                                    </figure>

                                    <span class="delivered" id="electronic_delivery_count" runat="server">63 <small>DELIVERED</small></span>
                                    <a href="../laptop-mobile-usb-charger-delivery-in-mumbai/"><h4>Electronic Delivery</h4></a>
                                    <p>Forgotten usb stick, charger, laptop, mobile &amp; more delivered to office or home. </p>
                                </li>

                                <!-- Bakery  -->
                                <li class="item">
                                    <figure class="wpf-demo-5">
                                        <a href="#">
                                            <img src="../../images/bakery-delivery.jpg" alt="Cookies, Pastry, Cupcakes delivery service in Mumbai"></a>
                                        <figcaption class="view-caption" id="bakery_delivery_link1" runat="server">
                                            <h4>Bakery delivery</h4>
                                            <span id="bakery_delivery_link" runat="server"><a href="#">Book Now</a></span>
                                           <span> <a href="../bakery-delivery/">Read More</a></span>
                                        </figcaption>
                                    </figure>
                                    <span class="delivered" id="bakery_delivery_count" runat="server">401 <small>DELIVERED</small></span>
                                    <a href="../bakery-delivery/"><h4>Bakery Delivery</h4></a>
                                    <p>Freshly baked bread &amp; confectionery home delivered under 90 minutes.</p>
                                </li>
                                <!-- Chocolate delivery  -->
                                <li class="item">
                                    <figure class="wpf-demo-5">
                                        <a href="#">
                                            <img src="../../images/chocolate-delivery.jpg" alt="Chocolate basket, chocolate box delivery service for chocolate makers in Mumbai"></a>
                                        <figcaption class="view-caption" id="chocolate_delivery_link1" runat="server">
                                            <h4>Chocolate delivery</h4>
                                             <span id="chocolate_delivery_link" runat="server"><a href="#">Book Now</a></span>
                                            <span><a href="../chocolate-delivery-service-for-chocolatiers/">Read More</a></span>
                                        </figcaption>
                                    </figure>
                                    <span class="delivered" id="chocolate_delivery_count" runat="server">202 <small>DELIVERED</small></span>
                                    <a href="../chocolate-delivery-service-for-chocolatiers/"><h4>Chocolate Delivery</h4></a>
                                    <p>Hassle-free chocolate basket deliveries anywhere in Mumbai.</p>
                                </li>
                                <!-- Cash delivery  -->
                                <li class="item">
                                    <figure class="wpf-demo-5">
                                        <a href="#">
                                            <img src="../../images/cash-delivery.jpg" alt="Cash and Cheque Delivery Service in Mumbai"></a>
                                        <figcaption class="view-caption" id="cash_delivery_link1" runat="server">
                                            <h4>Cash delivery</h4>
                                             <span id="cash_delivery_link" runat="server"><a href="#">Book Now</a></span>
                                            <span><a href="../cash-pickup-and-delivery-service-in-mumbai/">Read More</a></span>
                                        </figcaption>
                                    </figure>
                                    <span class="delivered" id="cash_delivery_count" runat="server">755 <small>DELIVERED</small></span>
                                         <a href="../cash-pickup-and-delivery-service-in-mumbai/"><h4>Cash Delivery</h4></a>
                                    <p>Send a cheque or get payments home delivered from clients</p>
                                </li>
                                <!-- document delivery  -->
                                <li class="item">
                                    <figure class="wpf-demo-5">
                                        <a href="#">
                                            <img src="../../images/documents-delivery.jpg" alt="Same day document delivery service in Mumbai."></a>
                                        <figcaption class="view-caption" id="document_delivery_link1" runat="server">
                                            <h4>Document delivery</h4>
                                            <span id="document_delivery_link" runat="server"><a href="#">Book Now</a></span>
                                            <span><a href="../same-day-document-delivery-in-mumbai/">Read More</a></span>
                                        </figcaption>
                                    </figure>
                                    <span class="delivered" id="document_delivery_count" runat="server">947 <small>DELIVERED</small></span>
                                    <a href="../same-day-document-delivery-in-mumbai/"><h4>Document Delivery</h4></a>
                                        <p>Door to door same day document pickup and delivery service.</p>
                                </li>
                                <!-- Bulk  delivery  -->
                                <li class="item">
                                    <figure class="wpf-demo-5">
                                        <a href="#">
                                            <img src="../../images/bulk-delivery.jpg" alt="Deliver Parcels in Bulk Mumbai"></a>
                                        <figcaption class="view-caption" id="Bulk_delivery_link1" runat="server">
                                            <h4>Bulk delivery</h4>
                                             <span id="Bulk_delivery_link" runat="server"><a href="#">Book Now</a></span>
                                              <span><a href="../arrange-collection-of-many-parcels-in-one-go/">Read More</a> </span>
                                        </figcaption>
                                    </figure>
                                    <span class="delivered" id="Bulk_delivery_count" runat="server">6128 <small>DELIVERED</small></span>
                                     <a href="../arrange-collection-of-many-parcels-in-one-go/"><h4>Bulk Delivery</h4></a>
                                    <p>Send hundreds of items to different parts of Mumbai in 1 day. </p>
                                </li>
                                <!-- parcel  delivery  -->
                                <li class="item">
                                    <figure class="wpf-demo-5">
                                        <a href="#">
                                            <img src="../../images/parcel-delivery.jpg" alt="Parcel delivery in Mumbai"></a>
                                        <figcaption class="view-caption" id="Parcel_delivery_link1" runat="server">
                                            <h4>Parcel delivery</h4>
                                             <span id="Parcel_delivery_link" runat="server"><a href="#">Book Now</a></span>
                                            <span><a href="../send-a-parcel/">Read More</a></span>
                                        </figcaption>
                                    </figure>
                                    <span class="delivered" id="Parcel_delivery_count" runat="server">3087 <small>DELIVERED</small></span>
                                   <a href="../send-a-parcel/"><h4>Parcel Delivery</h4></a>
                                    <p>Immediate parcel delivery with insurance and proof of delivery.</p>
                                </li>
                            </ul>

                        </div>
                    </div>
            </div>
            </div>
        <fc:Footer ID="Footer1"
                        runat="server"
                        MinValue="1"
                        MaxValue="10" />

        <!-- calculator Modals -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog custom-class modal-price">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="row">
                            <a class="close-modal" data-dismiss="modal">
                                <img src="../service-material/images/close-icon.svg" height="15" width="14" alt="" /></a>
                            <div class="col-md-3 hidden-xs hidden-sm">
                                <img src="../service-material/images/modal-image.png" alt="" height="560" width="177" />
                            </div>
                            <div class="col-md-9 col-xs-12" style="height: 560px;">
                                <div class="calculator">
                                    <h4>Calculator</h4>
                                    <div class="checkbox-title">
                                        <div class="row col-xs-12 radio-style">
                                            <ul>
                                                <li class="col-md-2 col-xs-3"><span>Journey</span></li>
                                                <li>
                                                    <div style="padding-left: 15px;">
                                                        <input class="hide" type="radio" id="f-option" name="selector">
                                                        <label for="f-option">Single</label>
                                                        <div class="check"></div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div style="padding-left: 15px;">
                                                        <input class="show" type="radio" id="s-option" name="selector">
                                                        <label for="s-option">Return</label>
                                                        <div class="check">
                                                            <div class="inside"></div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="row col-xs-12 radio-style">
                                            <ul>
                                                <li class="col-md-2 col-xs-2"><span>Delivery</span></li>
                                                <li class="col-md-4 col-xs-5">
                                                    <input type="radio" id="Nor" name="delivery">
                                                    <label for="Nor">Normal
                                                        <br />
                                                        <small>delivery within 24 hours</small></label>
                                                    <div class="check"></div>
                                                </li>
                                                <li class="col-md-4 col-xs-5" style="margin-left: -14px;">
                                                    <input type="radio" id="Ex" name="delivery">
                                                    <label for="Ex">Express
                                                        <br />
                                                        <small>Delivery within 90 minutes</small></label>
                                                    <div class="check">
                                                        <div class="inside"></div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="row col-xs-12" style="padding-top: 20px;">
                                            <div class="col-md-2 col-xs-2"><legend>Product Value</legend></div>
                                            <div class="col-md-8 col-xs-8">
                                                <div class="select-inspire bdr-btm">
                                                    <input type="tel" placeholder="Enter product value" />
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-xs-2">
                                                <div class="checkbox-cash checkbox-cash-danger">
                                                    <input id="cash1" type="checkbox">
                                                    <label for="cash1">Cash?</label>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- second product v -->
                                        <div class="row col-xs-12 product-value">
                                            <div class="col-md-2 col-xs-2"><legend>Product Value</legend></div>
                                            <div class="col-md-8 col-xs-8">
                                                <div class="select-inspire bdr-btm">
                                                    <input type="tel" placeholder="Enter product value" />
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-xs-2">
                                                <div class="checkbox-cash checkbox-cash-danger">
                                                    <input id="cash2" type="checkbox">
                                                    <label for="cash2">Cash?</label>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- weight -->
                                        <div class="row col-xs-12">
                                            <div class="col-md-2 col-xs-2"><legend>Weight</legend></div>
                                            <div class="col-md-10 col-xs-10">
                                                <input id="weight" type="text" data-slider-min="0" data-slider-max="30" data-slider-step="1" data-slider-value="0" />
                                                <span style="margin-top: 10px; position: absolute; color: #565656; right: 5px;"><span id="ex3SliderVal">0</span> KG</span>
                                            </div>
                                        </div>
                                        <!-- date -->
                                        <div class="row col-xs-12">
                                            <div class="col-md-2 col-xs-3"><legend>Date</legend></div>
                                            <div class="col-md-10 col-xs-9">
                                                <div class="select-inspire bdr-btm">
                                                    <input type="text" class="datepicker" placeholder="DD/MM/YYYY" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row col-xs-12">
                                            <div class="col-md-2 col-xs-2"><legend>Area</legend></div>
                                            <div class="col-md-5 col-xs-5">
                                                <img src="../service-material/images/green-i.png" style="position: absolute; color: #CCC; z-index: 50; top: 15px;" alt="" />
                                                <select class="selectpicker show-menu-arrow" data-size="4" data-live-search="true">
                                                    <option disabled>Select Area</option>
                                                    <option>Malad</option>
                                                    <option>Malad</option>
                                                    <option>Malad</option>
                                                    <option>Malad</option>
                                                    <option>Malad</option>
                                                </select>
                                            </div>
                                            <div class="col-md-5 col-xs-5">
                                                <img src="../service-material/images/orange-i.png" style="position: absolute; color: #CCC; z-index: 50; top: 15px;" alt="" />
                                                <select class="selectpicker show-menu-arrow" data-size="4" data-live-search="true">
                                                    <option disabled>Select Area</option>
                                                    <option>Andheri</option>
                                                    <option>Malad</option>
                                                    <option>Goregaon</option>
                                                    <option>Bandra</option>
                                                    <option>kurla</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-12 col-xs-12 calculator-bottom" style="background: #f2f2f2;">
                                            <div class="col-md-4 col-xs-6">
                                                <button class="calculate-btn">CALCULATOR</button>
                                            </div>
                                            <div class="col-md-6 col-md-offset-2 col-xs-6">
                                                <h2>
                                                    <img src="../service-material/images/rupee.png" width="24" height="30" alt="" />
                                                    0.00</h2>
                                                <p>Prices will differ as per the weight.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- row end -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- view price -->
        <div class="modal fade" id="view-price" tabindex="-1" role="dialog" aria-labelledby="pricing" aria-hidden="true">
            <div class="modal-dialog custom-class modal-price">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="row">
                            <a class="close-modal" data-dismiss="modal">
                                <img src="../service-material/images/close-icon.svg" height="15" width="14" alt="" /></a>
                            <div class="col-md-3 hidden-xs hidden-sm">
                                <img src="../service-material/images/modal-image.png" alt="" height="530" width="177" />
                            </div>
                            <div class="col-md-9 col-xs-12" style="height: 530px;overflow-x:auto;">
                                <div class="pricing-box">
                                    <h4>Prices</h4>
                                    <div class="pricing-tabs col-md-12">
                                        <ul>
                                            <li class="current"><a href="#tab-1">Within Mumbai</a></li>
                                            <li><a href="#tab-2">Outside Mumbai</a></li>
                                        </ul>
                                    </div>
                                    <div class="tab-price">
                                        <div id="tab-1" class="tab-content pricing-table">
                                            <div class="table-responsive col-md-12">
                                                  <table class="table table-bordered table-hover">
                                                    <thead class="table-head">
                                                        <tr>
                                                            <th rowspan="2" style="vertical-align: middle;">Product Value</th>
                                                            <th colspan="3">Service Fee</th>
                                                        </tr>
                                                        <tr>
                                                            <td class="table-head">Advance</td>
                                                            <td class="table-head">Same Day</td>
                                                            <td class="table-head">Express</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Upto Rs. 50,000</td>
                                                            <td>200</td>
                                                            <td>250</td>
                                                            <td>350</td>

                                                        </tr>

                                                        <tr>
                                                            <td>&nbsp;50,000 - 1,00,000</td>
                                                            <td>250</td>
                                                            <td>300</td>
                                                            <td>400</td>

                                                        </tr>

                                                        <tr>
                                                            <td>&nbsp;1,00,000 - 1,50,000</td>
                                                            <td>300</td>
                                                            <td>400</td>
                                                            <td>500</td>

                                                        </tr>

                                                        <tr>
                                                            <td>1,50,000 - 2,00,000</td>
                                                            <td>400</td>
                                                            <td>500</td>
                                                            <td>600</td>

                                                        </tr>

                                                        <tr>
                                                            <td>2,00,000 - 5,00,000</td>
                                                            <td>500</td>
                                                            <td>600</td>
                                                            <td>700</td>

                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <table class="table table-bordered">
                                                    <thead class="table-head">
                                                        <tr>
                                                            <th rowspan="2" style="vertical-align: middle;">Product Value</th>
                                                            <th rowspan="2" style="vertical-align: middle;">Cash Delivery</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Upto Rs. 7,500</td>
                                                            <td>150</td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;7,500 - 50,000</td>
                                                            <td>2% </td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;50,000 - 1,00,000</td>
                                                            <td>2% </td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;1,00,000 - 1,50,000</td>
                                                            <td>2% </td>
                                                        </tr>
                                                        <tr>
                                                            <td>1,50,000 - 2,00,000</td>
                                                            <td>2% </td>
                                                        </tr>
                                                        <tr>
                                                            <td>2,00,000 - 5,00,000</td>
                                                            <td>5% </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div id="tab-2" class="tab-content pricing-table">
                                            <div class="table-responsive col-md-12">
                                                <table class="table table-bordered">
                                                    <thead class="table-head">
                                                        <tr>
                                                            <th>Product Value</th>
                                                            <th>Service Fee</th>
                                                        </tr>
                                                    </thead>
                                                  <tbody>
                                                            <tr>
                                                            <td>Rs: 1 - Rs: 50000</td>
                                                            <td>550</td>
                                                       </tr>
                                                        <tr>
                                                            <td>Rs: 50001 - Rs: 100000</td>
                                                            <td>600</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Rs: 100001 - Rs: 150000</td>
                                                            <td>700</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Rs: 150001- Rs: 200000</td>
                                                            <td>800</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Rs: 200001- Rs: 500000</td>
                                                            <td>900</td>
                                                        </tr>   
                                                        </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div id="clientsDropDown">
                                            <p id="clientsOpen">Terms &amp; Condition</p>
                                            <div id="clientsDashboard">
                                                <div id="clientsCTA">
                                                    <ul class="terms">
                                                        <li>General</li>
                                                        <li>We take complete responsibility for all the products handled by our team.</li>
                                                        <li>Our Pricing is inclusive of - Insurance, local transport.</li>
<li>Our pricing is subject to change on Sundays, public holidays and festivals.</li>
                                                    </ul>
                                                    <ul class="terms">
                                                        <li>Areas covered :</li>
                                                        <li>Within Mumbai - (Churchgate - Bhayander) (CST - Thane) (CST- Belapur) </li>
                                                        <li>Outside Mumbai -(Naigaon - Virar) (Kalwa - Kalyan) (Kharghar - Panvel)</li>
                                                    </ul>
                                                    <ul class="terms">
                                                        <li>Cancellation Policy : </li>
                                                        <li>If a task is cancelled 2 hours prior the pickup time, cancellation fees of Rs 100/-  will be applicable.</li>
                                                    </ul>
                                                    <ul class="terms">
                                                        <li>Waiting Policy</li>
                                                        <li>An executive can only wait for 15 minutes at the pickup point.</li>
                                                        <li>Waiting fee of Rs 100/- will be charged for every 30 minutes.</li>
                                                    </ul>
                                                    <ul class="terms">
                                                        <li>Baggage Policy </li>
                                                        <li>Rs.100/- for parcels weighing between 5kg to 10kg.</li>
                                                        <li>Rs.200/- for parcels weighing between 10kg to 15kg.</li>
                                                        <li>Rs.300/- for parcels weighing between 15kg to 20kg.</li>
                                                        <li>Rs 400/- for parcels weighing between 20kg to 25kg.</li>
                                                    </ul>
                                                    <ul class="terms">
                                                        <li>Transport Policy</li>
                                                        <li>Bus and Train are considered as local transport.</li>
                                                        <li>Rickshaw, Taxi, Metro, Monorail are considered as private transport.</li>
                                                    </ul>
                                                    <ul class="terms">
                                                        <li>Private transport will be considered in the following conditions :</li>
                                                        <li>Non-availability of transport at a particular pickup or drop off destination.</li>
                                                        <li>Carrying heavy bags (items weighing more than 5 kg)</li>
                                                        <li>Cakes above 1.5kg to be carried during peak hours.</li>
                                                        <li>Handling Expensive/Fragile items.</li>
                                                    </ul>
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
        </div>

       
        <script src="../service-material/js/bootstrap-slider.min.js"></script>
        <!-- Slider input-->
        <script type="text/javascript">
            $("#weight").slider();
            $("#weight").on("slide", function (slideEvt) {
                $("#ex3SliderVal").text(slideEvt.value);
            });
        </script>
        <!-- select option -->
        <script src="../service-material/js/select-style.js"></script>
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <!-- date picker -->
        <script src="../../js-web/init.js"></script>
        <script src="../../plugin/login-slider/Home.js"></script>
    </form>
</body>
</html>
