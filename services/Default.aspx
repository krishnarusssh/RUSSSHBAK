<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="services_Default" %>

<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/Footer.ascx" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Services</title>
   
    <meta name="title" content="We Deliver Cake, Parcel & More – Visit Russsh.com!" />
    <meta name="description" content="Our services include same day delivery of cake, food, parcel, cash, clothes, electronic items, medicines, utility bills, grocery, invitation cards & more." />



    <meta name="keywords" content="" />
    <meta name="author" content="" />
    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
   
    <!-- CSS -->
    <link href="https://www.russsh.com/css-web/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="https://www.russsh.com/css-web/style.css" rel="stylesheet" type="text/css">
    <link href="https://www.russsh.com/css-web/media-style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="https://www.russsh.com/service-material/css/all-services.css">
    <!-- service page -->
    <link rel="stylesheet" type="text/css" href="https://www.russsh.com/plugin/owl-2016/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="https://www.russsh.com/plugin/owl-2016/owl.theme.default.min.css">
    <link rel="stylesheet" type="text/css" href="https://www.russsh.com/mega-dropdown/css/style.css">
    <link rel="stylesheet" type="text/css" href="https://www.russsh.com/plugin/login-slider/content-slide.css">
    <link href="https://fonts.googleapis.com/css?family=Courgette" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Damion" rel="stylesheet" type="text/css">
    <script src="https://use.fontawesome.com/396bc1486a.js"></script>
    <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <!--[if lt IE 9]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if lte IE 8]><link rel="stylesheet" type="text/css" href="css/ie8.css" media="screen"/><![endif]-->
    <script src="../js-web/modernizr.js"></script>
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
    <form name="form1" runat="server">


        <uc:Header ID="Header" runat="server" MinValue="1" MaxValue="10" />
      <section style="background:#F0F0F0;border-bottom:1px solid #E1E1E1;">
<div class="container">
<div class="row" >
<div class="col-md-4">
<div class="quicksearch">
<input type="text" class="form-control searchservice" placeholder="Search Your Services" />
<i class="search-icon fa fa-search"></i>
</div>
</div>
</div>
</div>
</section>
        <section style="background: #f6f5f7;">
            <div class="container">
                <div class="row help-service">
                    <div class="grid">
                        <!-- parcel  delivery  -->
                        <div class="col-md-3 col-sm-3 element-item">

                            <li class="item">
                                <figure class="wpf-demo-5">
                                    <a href="#">
                                        <img src="https://www.russsh.com/images/parcel-delivery.jpg" alt="Parcel delivery in Mumbai"></a>
                                    <figcaption id="Parcel_delivery_link" class="view-caption">
                                        <h4>Parcel delivery</h4>
                                        <span id="Parcel_delivery_link1" runat="server"><a href="#">Book Now</a></span>
                                        <span><a href="https://www.russsh.com/services/send-a-parcel/">Read More</a></span>
                                    </figcaption>
                                </figure>

                                <a href="https://www.russsh.com/services/send-a-parcel/">
                                    <h4>Parcel Delivery</h4>
                                </a>

                                <p>Immediate parcel delivery with insurance and proof of delivery.</p>
                            </li>
                        </div>
                        <!-- Document  delivery  -->
                        <div class="col-md-3 col-sm-3 element-item">
                            <li class="item">
                                <figure class="wpf-demo-5">
                                    <a href="#">
                                        <img src="https://www.russsh.com/images/documents-delivery.jpg" alt="Same day document delivery service in Mumbai."></a>
                                    <figcaption id="document_delivery_link" class="view-caption">
                                        <h4>Document delivery</h4>
                                        <span id="document_delivery_link1" runat="server"><a href="#">Book Now</a></span>
                                        <span><a href="https://www.russsh.com/services/same-day-document-delivery-in-mumbai/">Read More</a></span></figcaption>
                                </figure>

                                <a href="https://www.russsh.com/services/same-day-document-delivery-in-mumbai/">
                                    <h4>Document Delivery</h4>
                                </a>

                                <p>Door to door same day document pickup and delivery service.</p>
                            </li>
                        </div>
                        <!-- Cake  delivery  -->
                        <div class="col-md-3 col-sm-3 element-item">
                            <li class="item">
                                <figure class="wpf-demo-5">
                                    <a href="#">
                                        <img src="https://www.russsh.com/images/cake-delivery.jpg" alt="Send birthday cake in Mumbai, Thane and Navi Mumbai
"></a>
                                    <figcaption id="cake_delivery_link" class="view-caption">
                                        <h4>Cake Delivery </h4>
                                        <span id="cake_delivery_link1" runat="server"><a href="#">Book Now</a></span>
                                        <span><a href="https://www.russsh.com/services/cake-delivery-mumbai-thane-navi-mumbai/">Read More</a> </span>
                                    </figcaption>
                                </figure>

                                <a href="https://www.russsh.com/services/cake-delivery-mumbai-thane-navi-mumbai/">
                                    <h4>Cake Delivery</h4>
                                </a>

                                <p>We’ll deliver the cake, collect payment and return it within hours.</p>
                            </li>
                        </div>
                        <!-- Cash delivery  -->
                        <div class="col-md-3 col-sm-3 element-item">
                            <li class="item">
                                <figure class="wpf-demo-5">
                                    <a href="#">
                                        <img src="https://www.russsh.com/images/cash-delivery.jpg" alt="Cash and Cheque Delivery Service in Mumbai"></a>
                                    <figcaption id="cash_delivery_link" class="view-caption">
                                        <h4>Cash delivery</h4>
                                        <span id="cash_delivery_link1" runat="server"><a href="#">Book Now</a></span>
                                        <span><a href="https://www.russsh.com/services/cash-pickup-and-delivery-service-in-mumbai/">Read More</a></span>
                                    </figcaption>
                                </figure>

                                <a href="https://www.russsh.com/services/cash-pickup-and-delivery-service-in-mumbai/">
                                    <h4>Cash Delivery</h4>
                                </a>

                                <p>Send a cheque or get payments home delivered from clients</p>
                            </li>
                        </div>
                        <!-- Bulk delivery  -->
                        <div class="col-md-3 col-sm-3 element-item">
                            <li class="item">
                                <figure class="wpf-demo-5">
                                    <a href="#">
                                        <img src="https://www.russsh.com/images/bulk-delivery.jpg" alt="Deliver Parcels in Bulk Mumbai"></a>
                                    <figcaption id="Bulk_delivery_link" class="view-caption">
                                        <h4>Bulk delivery</h4>
                                        <span id="Bulk_delivery_link1" runat="server"><a href="#">Book Now</a></span>
                                        <span><a href="https://www.russsh.com/services/arrange-collection-of-many-parcels-in-one-go/">Read More</a></span>
                                    </figcaption>
                                </figure>

                                <a href="https://www.russsh.com/services/arrange-collection-of-many-parcels-in-one-go/">
                                    <h4>Bulk Delivery</h4>
                                </a>

                                <p>Send hundreds of items to different parts of Mumbai in 1 day. </p>
                            </li>
                        </div>
                        <!-- Food delivery  -->
                        <div class="col-md-3 col-sm-3 element-item">
                            <li class="item">
                                <figure class="wpf-demo-5">
                                    <a href="#">
                                        <img src="https://www.russsh.com/images/food-delivery.jpg" alt="Food delivery service
"></a>
                                    <figcaption id="food_delivery_link" class="view-caption">
                                        <h4>Food Delivery</h4>
                                        <span id="food_delivery_link1" runat="server"><a href="#">Book Now</a></span>
                                        <span><a href="https://www.russsh.com/services/food-delivery-in-mumbai-thane-navi-mumbai/">Read More</a></span>
                                    </figcaption>
                                </figure>

                                <a href="https://www.russsh.com/services/food-delivery-in-mumbai-thane-navi-mumbai/">
                                    <h4>Food Delivery</h4>
                                </a>

                                <p>You’ll find us handy when you crave for street food. </p>
                            </li>
                        </div>
                        <!-- grocery delivery  -->
                        <div class="col-md-3 col-sm-3 element-item">
                            <li class="item">
                                <figure class="wpf-demo-5">
                                    <a href="#">
                                        <img src="https://www.russsh.com/images/grocery-delivery.jpg" alt="Groceries delivered to home
"></a>
                                    <figcaption id="Grocery_delivery_link" class="view-caption">
                                        <h4>Grocery Delivery</h4>
                                        <span id="Grocery_delivery_link1" runat="server"><a href="#">Book Now</a></span>
                                        <span><a href="https://www.russsh.com/services/grocery-delivery-in-mumbai/">Read More</a></span>
                                    </figcaption>
                                </figure>

                                <a href="https://www.russsh.com/services/grocery-delivery-in-mumbai/">
                                    <h4>Grocery Delivery</h4>
                                </a>

                                <p>We’ll fetch items not available in your neighbourhood. Eat healthy! </p>
                            </li>
                        </div>
                        <!-- Flower delivery  -->
                        <div class="col-md-3 col-sm-3 element-item">
                            <li class="item">
                                <figure class="wpf-demo-5">
                                    <a href="#">
                                        <img src="https://www.russsh.com/images/flowers-delivery.jpg" alt="Flower delivery service in Mumbai, Thane and Navi Mumbai
"></a>
                                    <figcaption id="flower_delivery_link" class="view-caption">
                                        <h4>Flower Delivery</h4>
                                        <span id="flower_delivery_link1" runat="server"><a href="#">Book Now</a></span>
                                        <span><a href="https://www.russsh.com/services/flowers-delivery/">Read More</a></span>
                                    </figcaption>
                                </figure>

                                <a href="https://www.russsh.com/services/flowers-delivery/">
                                    <h4>Flower Delivery</h4>
                                </a>

                                <p>Get fresh flowers home delivered from any florist of your choice. </p>
                            </li>
                        </div>
                        <!-- Gift delivery  -->
                        <div class="col-md-3 col-sm-3 element-item">
                            <li class="item">
                                <figure class="wpf-demo-5">
                                    <a href="#">
                                        <img src="https://www.russsh.com/images/gift-delivery.jpg" alt="Send gifts in Mumbai, Thane and Navi Mumbai
"></a>
                                    <figcaption id="gift_delivery_link" class="view-caption">
                                        <h4>Gift Delivery</h4>
                                        <span id="gift_delivery_link1" runat="server"><a href="#">Book Now</a></span>
                                        <span><a href="https://www.russsh.com/services/gift-delivery-in-mumbai-thane-navi-mumbai/">Read More</a></span>
                                    </figcaption>
                                </figure>

                                <a href="https://www.russsh.com/services/gift-delivery-in-mumbai-thane-navi-mumbai/">
                                    <h4>Gift Delivery</h4>
                                </a>

                                <p>Midnight gift deliveries for your dearest is now a reality. </p>
                            </li>
                        </div>
                        <!-- clothes delivery  -->
                        <div class="col-md-3 col-sm-3 element-item">
                            <li class="item">
                                <figure class="wpf-demo-5">
                                    <a href="#">
                                        <img src="https://www.russsh.com/images/clothes-delivery.jpg" alt="Clothes pick up and delivery service in Mumbai, Thane and Navi Mumbai
"></a>
                                    <figcaption id="Clothes_delivery_link" class="view-caption" runat="server">
                                        <h4>Clothes Delivery</h4>
                                        <span id="Clothes_delivery_link1" runat="server"><a href="#">Book Now</a></span>

                                        <span><a href="https://www.russsh.com/services/same-day-delivery-of-dress-shoe-accessory">Read More</a> </span></figcaption>
                                </figure>

                                <a href="https://www.russsh.com/services/same-day-delivery-of-dress-shoe-accessory/">
                                    <h4>Clothes Delivery</h4>
                                </a>

                                <p>Send us to the tailor, laundry or a wholesale garment market. </p>
                            </li>
                        </div>
                        <!-- bakery delivery  -->
                        <div class="col-md-3 col-sm-3 element-item">
                            <li class="item">
                                <figure class="wpf-demo-5">
                                    <a href="#">
                                        <img src="https://www.russsh.com/images/bakery-delivery.jpg" alt="Cookies, Pastry, Cupcakes delivery service in Mumbai"></a>
                                    <figcaption id="bakery_delivery_link" class="view-caption">
                                        <h4>Bakery delivery</h4>
                                        <span id="bakery_delivery_link1" runat="server"><a href="#">Book Now</a></span>
                                        <span><a href="https://www.russsh.com/services/bakery-delivery/">Read More</a></span>
                                    </figcaption>
                                </figure>

                                <a href="https://www.russsh.com/services/bakery-delivery/">
                                    <h4>Bakery Delivery</h4>
                                </a>

                                <p>Freshly baked bread &amp; confectionery home delivered under 90 minutes.</p>
                            </li>
                        </div>                      
                        <!-- Electronic delivery  -->
                        <div class="col-md-3 col-sm-3 element-item">
                            <li class="item">
                                <figure class="wpf-demo-5">
                                    <a href="#">
                                        <img src="https://www.russsh.com/images/laptop-delivery.jpg" alt="Laptop pick up and delivery service in Mumbai, Thane and Navi Mumbai
"></a>
                                    <figcaption id="electronic_delivery_link" class="view-caption">
                                        <h4>Electronic Delivery</h4>
                                        <span id="electronic_delivery_link1" runat="server"><a href="#">Book Now</a></span>
                                        <span><a href="https://www.russsh.com/services/laptop-mobile-usb-charger-delivery-in-mumbai/">Read More</a></span>
                                    </figcaption>
                                </figure>
                                <a href="https://www.russsh.com/services/laptop-mobile-usb-charger-delivery-in-mumbai/">
                                    <h4>Electronic Delivery</h4>
                                </a>
                                <p>Forgotten usb stick, laptop, mobile &amp; more delivered to office or home. </p>
                            </li>
                        </div>  
                        <!-- Chocolate delivery  -->
                        <div class="col-md-3 col-sm-3 element-item">

                            <li class="item">
                                <figure class="wpf-demo-5">
                                    <a href="#">
                                        <img src="https://www.russsh.com/images/chocolate-delivery.jpg" alt="Chocolate basket, chocolate box delivery service for chocolate makers in Mumbai"></a>
                                    <figcaption id="chocolate_delivery_link" class="view-caption">
                                        <h4>Chocolate delivery</h4>
                                        <span id="chocolate_delivery_link1" runat="server"><a href="#">Book Now</a></span>
                                        <span><a href="https://www.russsh.com/services/chocolate-delivery-service-for-chocolatiers/">Read More</a></span>
                                    </figcaption>
                                </figure>

                                <a href="https://www.russsh.com/services/chocolate-delivery-service-for-chocolatiers/">
                                    <h4>Chocolate Delivery</h4>
                                </a>

                                <p>Hassle-free chocolate basket deliveries anywhere in Mumbai.</p>
                            </li>
                        </div>

                    </div>
                </div>
            </div>
        </section>
        <fc:Footer ID="Footer1"
            runat="server"
            MinValue="1"
            MaxValue="10" />

        <script src="https://www.russsh.com/code.jquery.com/jquery-latest.min.js"></script>
        <!-- Jquery Library Call -->
        <script>if (typeof jQuery == 'undefined') { document.write(unescape("%3Cscript src='js/jquery-2.0.0.min.js' type='text/javascript'%3E%3C/script%3E")); }</script>
        <script src="https://www.russsh.com/js-web/helper-plugins.js"></script>
        <!-- Plugins -->
        <script src="https://www.russsh.com/js-web/bootstrap.js"></script>
        <!-- UI -->
        <script src="https://www.russsh.com/mega-dropdown/js/jquery.menu-aim.js"></script>
        <script src="https://www.russsh.com/mega-dropdown/js/main.js"></script>
        <script src="https://www.russsh.com/plugin/owl-2016/owl.carousel.js"></script>
        <script src="https://www.russsh.com/js-web/init.js"></script>
        <script src="https://www.russsh.com/plugin/login-slider/Home.js"></script>
        <script type="text/javascript">
            // quick search regex
            var qsRegex;

            // init Isotope
            var $grid = $('.grid').isotope({
                itemSelector: '.element-item',
                layoutMode: 'fitRows',
                filter: function () {
                    return qsRegex ? $(this).text().match(qsRegex) : true;
                }
            });

            // use value of search field to filter
            var $searchservice = $('.searchservice').keyup(debounce(function () {
                qsRegex = new RegExp($searchservice.val(), 'gi');
                $grid.isotope();
            }, 150));

            // debounce so filtering doesn't happen every millisecond
            function debounce(fn, threshold) {
                var timeout;
                return function debounced() {
                    if (timeout) {
                        clearTimeout(timeout);
                    }
                    function delayed() {
                        fn();
                        timeout = null;
                    }
                    timeout = setTimeout(delayed, threshold || 100);
                }
            }
        </script>
    </form>
</body>
</html>
