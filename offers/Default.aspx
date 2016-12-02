<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="offers_Default" %>
<%@ Register TagPrefix="fc" TagName="Footer"  Src="~/UCNEW/Footer.ascx" %>
<%@ Register TagPrefix="hc" TagName="Header"  Src="~/UCNEW/Header.ascx" %>
<!DOCTYPE html>

<html>
<head runat="server">
<title>Offers</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="" />
<meta name="google-site-verification" content="PCnwPC6sXKg7hAGCOZR4Ctvxj_EFT7bYmtpD7C_OGwE" />	
<!-- Mobile Specific Metas -->
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="format-detection" content="telephone=no">
<!-- CSS -->
<link href="../css-web/bootstrap.css" rel="stylesheet" type="text/css">
<link href="../css-web/style.css" rel="stylesheet" type="text/css">
<link href="../css-web/media-style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="services-media.css">
<link rel="stylesheet" type="text/css" href="../css-web/hover.css">
<link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.theme.default.min.css">
<link rel="stylesheet" type="text/css" href="../mega-dropdown/css/style.css">
<link rel="stylesheet" type="text/css" href="../plugin/login-slider/content-slide.css">
<link href="https://fonts.googleapis.com/css?family=Courgette" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Damion" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-slider.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> <!-- date picker -->
<script src="https://use.fontawesome.com/396bc1486a.js"></script>
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
<!--[if lt IE 9]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" type="text/css" href="css/ie8.css" media="screen"/><![endif]-->
<script src="../js-web/modernizr.js"></script><!-- Modernizr -->

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
    <form name="frmMain" runat="server">
<header>

     <hc:header id="Header" runat="server" MinValue="1" MaxValue="10" />
</header>
<!-- Banner Section -->
        
<div style="overflow:hidden;">
<div class="iftar-image"></div>
</div>
<div class="offers-content">
<div class="container offer-bg">
<div class="row">
<div class="col-md-8">
<img src="images/IftarOffer.jpg" class="img-responsive" alt="" title="" />
</div>
<div class="col-md-4">
<div class="offer-text">
<h1>Get Iftar food <br /> home delivered!</h1>
<p>Home delivery within 2 hours.</p>
<div class="hidden-sm hidden-xs"  id="booktasklink1" runat="server" style="margin-top:20px;"><a  href="#" class="book-offer">Book Now</a></div>
</div>
</div>
</div>
<div class="row hidden-lg book-now-xs">
<div class="col-md-12" id="mobilebooknowbutton" runat="server">
<a href="#">BOOK NOW</a>
</div>
</div>
</div>
</div>
<div class="container">
<div class="row">
<div class="col-md-12 paddingtb-20">
<ul class="breadcrumbs">
<li><a href="../">Home</a> </li>
<li>Offers</li>
</ul>
</div>
</div>
</div>
<!-- End banner -->
<div class="container hidden-xs">
<div class="row paddingtb-40 offers-all">
<div class="col-md-6">
<h2>About Ramadan</h2>
<p>During the whole month, observers of Islam fast from sunrise to sunset. During the fast, no food or drink is consumed, and thoughts must be kept pure. Followers of Islam believe that fasting helps the Muslim learn patience, modesty, and spirituality. Meals are served before sunrise, called suhoor, and after sunset, called iftar, and eaten with family or with the local community.</p>

</div>
<div class="col-md-6">
<img src="images/1.png" style="margin-left:auto; margin-right:auto;margin-top:35px;" height="130" width="110"  class="img-responsive" alt=""  />
</div>
</div>
<div class="row paddingtb-40 offers-all">
<div class="col-md-6">
<img src="images/2.png" style=" margin-left:auto; margin-right:auto; margin-top:60px;" height="140"  width="100" class="img-responsive" alt=""  />
</div>
<div class="col-md-6">
<div class="pd-20 offers-all"> 
<h2>Most popular Ramadan food</h2>
<ul>
<li>Dahi vadey: Lentil dumplings that are soaked in a spicy yogurt sauce.</li>
<li>Haleem: A slow-cooked stew of meat, bulgur wheat, and lentils.</li>
<li>Chicken 65: Spicy, bite-sized pieces of chicken that are marinated and deep-fried.</li>
<li>Phirni: Rice pudding.</li>
<li>Malpua: Deep fried pancake served with rabdi.</li>
</ul>
</div>
</div>
</div>
<div class="row paddingtb-40 offers-all">
<div class="col-md-6">
<div class="service-padding"> 
<h2>Order From Mohammed Ali Road</h2>
<p>Whatever the reason maybe missing out such appetizing food is uncalled for. This is why Russsh is offering to home deliver your favourite dishes. All standard deliveries (Rs. 220) will be made between 3-4 hours depending on the distance and traffic. Express deliveries (Rs. 340) will be made under 2 hours provided our executives don’t have to wait long enough at the food joints. We recommend placing a request by noon. *Additional charges are applicable for food parcels above 5kgs. Waiting charges applicable.</p>
</div>
</div>
<div class="col-md-6">
<img src="images/3.png" style="margin-top:80px; margin-left:auto; margin-right:auto;" width="150" height="150" class="img-responsive" alt=""  />
</div>
</div>
<div class="row paddingtb-40 offers-all">
<div class="col-md-6">
<img src="images/4.png" style="margin-left:auto; margin-right:auto; margin-top:30px;" width="140" height="140" class="img-responsive" alt=""  />
</div>
<div class="col-md-6">
<div class="pd-20"> 
<h2>What you have to do</h2>
<p>Send a list of dishes you want along with your preferred restaurants. Make the payment online (pay Russsh) for the food and we’ll do the rest.</p>
</div>
</div>
</div>
</div>
<div class="container hidden-lg hidden-sm">
<div class="row offers-all">
<div class="col-md-6">
<img src="images/1.png" style="margin-left:auto; margin-right:auto;margin-top:35px;" height="130" width="110"  class="img-responsive" alt=""  />
</div>
<div class="col-md-6">
<h2>About Ramadan</h2>
<p>During the whole month, observers of Islam fast from sunrise to sunset. During the fast, no food or drink is consumed, and thoughts must be kept pure. Followers of Islam believe that fasting helps the Muslim learn patience, modesty, and spirituality. Meals are served before sunrise, called suhoor, and after sunset, called iftar, and eaten with family or with the local community.</p>
</div>
</div>
<div class="row paddingtb-40 offers-all">
<div class="col-md-6">
<img src="images/2.png" style=" margin-left:auto; margin-right:auto; margin-top:60px;" height="140"  width="100" class="img-responsive" alt=""  />
</div>
<div class="col-md-6">
<div class="pd-20 offers-all"> 
<h2>Most popular Ramadan food</h2>
<ul>
<li>Dahi vadey: Lentil dumplings that are soaked in a spicy yogurt sauce.</li>
<li>Haleem: A slow-cooked stew of meat, bulgur wheat, and lentils.</li>
<li>Chicken 65: Spicy, bite-sized pieces of chicken that are marinated and deep-fried.</li>
<li>Phirni: Rice pudding.</li>
<li>Malpua: Deep fried pancake served with rabdi.</li>
</ul>
</div>
</div>
</div>
<div class="row paddingtb-40 offers-all">
<div class="col-md-6">
<img src="images/3.png" style="margin-top:35px; margin-left:auto; margin-right:auto;" width="150" height="150" class="img-responsive" alt=""  />
</div>
<div class="col-md-6">
<div class="service-padding"> 
<h2>Order From Mohammed Ali Road</h2>
<p>Whatever the reason maybe missing out such appetizing food is uncalled for. This is why Russsh is offering to home deliver your favourite dishes. All standard deliveries (Rs. 220) will be made between 3-4 hours depending on the distance and traffic. Express deliveries (Rs. 340) will be made under 2 hours provided our executives don’t have to wait long enough at the food joints. We recommend placing a request by noon. *Additional charges are applicable for food parcels above 5kgs. Waiting charges applicable.</p>
</div>
</div>

</div>
<div class="row paddingtb-40 offers-all">
<div class="col-md-6">
<img src="images/4.png" style="margin-left:auto; margin-right:auto; margin-top:20px;" width="140" height="140" class="img-responsive" alt=""  />
</div>
<div class="col-md-6">
<div class="pd-20"> 
<h2>What you have to do</h2>
<p>Send a list of dishes you want along with your preferred restaurants. Make the payment online (pay Russsh) for the food and we’ll do the rest.</p>
</div>
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
<img src="../images/Test-1.jpg" alt=""/>
<figcaption class="view-caption">
<span class="quotes-left"><img src="../images/russsh-icons/quotation-mark.svg" width="20" height="18" alt="" /></span>
<p> I end up recommending the service to everyone in my trinity, be it my clients, my customers, my students in hope to suffice the service that you guys do. That’s not enough but how else do I thank Bharat for his brilliant idea.</p>
<p><strong>Mulchand Dedhia</strong> <br /> Founder <br /> MeterDown.co.in</p>
<span class="quotes-right"><img src="../images/russsh-icons/quotation-mark2.svg" width="20" height="18" alt="" /></span>
</figcaption>
</figure>
</li>
<!-- Item 2 -->
<li class="item">
<figure class="testimonial-hover">
<img src="../images/Oscar-Varghese.jpg" alt="Oscar Varghese" title="" />
<figcaption class="view-caption">
<span class="quotes-left"><img src="../images/russsh-icons/quotation-mark.svg" width="20" height="18" alt="" /></span>
<p>As a business owner I am in love with the service russsh.com offers because I can book tasks which allow me to free up my day and focus on things that really matter i.e doing more photoshoots and ergo making more money. 
</p>
<p><strong>Oscar Varghese</strong> <br /> Professional Photographer</p>
<span class="quotes-right"><img src="../images/russsh-icons/quotation-mark2.svg" width="20" height="18" alt="" /></span>
</figcaption>
</figure>
</li>
<!-- Item 3 -->
<li class="item">
<figure class="testimonial-hover">
<img src="../images/Test-3.jpg" alt=""/>
<figcaption class="view-caption">
<span class="quotes-left"><img src="../images/russsh-icons/quotation-mark.svg" alt="" width="20" height="18" /></span>
<p>I used the service a few times to send documents and catalogues. It's a big boon to have an errand running service like this considering I'm very busy running my business. They've got an ios app now so I don't call the customer service anymore as I book tasks on the go.</p>
<p><strong>Brian Quadros</strong> <br /> CEO <br /> Thomas &amp; Brian Mfg. Pvt. Ltd</p>
<span class="quotes-right"><img src="../images/russsh-icons/quotation-mark2.svg" alt="" width="20" height="18" /></span>
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
<a href="#"><img src="../images/cake-delivery.jpg" alt="Send birthday cake in Mumbai, Thane and Navi Mumbai"></a>
<figcaption class="view-caption" id="cake_delivery_link1" runat="server">
<h4>Cake Delivery </h4>            
<span id="cake_delivery_link" runat="server"><a href="#">Book Now</a></span>
  <span><a href="../services/cake-delivery-mumbai-thane-navi-mumbai/">Read More</a> </span>   
</figcaption>
</figure>
<span class="delivered" id="cake_delivery_count" runat="server">2828 <small>DELIVERED</small></span>
<a href="../services/cake-delivery-mumbai-thane-navi-mumbai/"><h4>Cake Delivery</h4></a>
<p>We’ll deliver the cake, collect payment and return it within hours.</p>
</li>
<!-- Item 2 -->
<li class="item">
<figure class="wpf-demo-5">
<a href="#"><img src="../images/clothes-delivery.jpg" alt="Clothes pick up and delivery service in Mumbai, Thane and Navi Mumbai"></a>
<figcaption class="view-caption" id="Clothes_delivery_link1" runat="server">
<h4>Clothes Delivery </h4>            
 <span id="Clothes_delivery_link" runat="server"><a href="#">Book Now</a></span>
  <span><a href="../services/same-day-delivery-of-dress-shoe-accessory/">Read More</a> </span>                
</figcaption>
</figure>
<span class="delivered" id="Clothes_delivery_count" runat="server">3287 <small>DELIVERED</small></span>
<a href="../services/same-day-delivery-of-dress-shoe-accessory/"><h4>Clothes Delivery</h4></a>
<p>Send us to the tailor, laundry or a wholesale garment market. </p>
</li>
<!-- Item 3 -->
<li class="item">
<figure class="wpf-demo-5">
<a href="#"><img src="../images/grocery-delivery.jpg" alt="Groceries delivered to home
"></a>
<figcaption class="view-caption" id="Grocery_delivery_link1" runat="server">
<h4>Grocery Delivery </h4>            
<span id="Grocery_delivery_link" runat="server"><a href="#">Book Now</a></span>
<span><a href="../services/grocery-delivery-in-mumbai/">Read More</a> </span>                
</figcaption>
</figure>
<span class="delivered" id="Grocery_delivery_count" runat="server">2638 <small>DELIVERED</small></span>
<a href="../services/grocery-delivery-in-mumbai/"><h4>Grocery Delivery</h4></a>
<p>We’ll fetch items not available in your neighbourhood. Eat healthy! </p>
</li>
<!-- Item 4 -->
<li class="item">
<figure class="wpf-demo-5">
<a href="#"><img src="../images/food-delivery.jpg" alt="Food delivery service"></a>
<figcaption class="view-caption" id="food_delivery_link1" runat="server">
<h4>Food Delivery </h4>            
<span id="food_delivery_link" runat="server"><a href="#">Book Now</a></span>
  <span><a href="../services/food-delivery-in-mumbai-thane-navi-mumbai/">Read More</a> </span>    
           
</figcaption>
</figure>
<span class="delivered" id="food_delivery_count" runat="server">2123 <small>DELIVERED</small></span>
<a href="../services/food-delivery-in-mumbai-thane-navi-mumbai/"><h4>Food Delivery</h4></a>
<p>You’ll find us handy when you crave for street food. </p>
</li>
<!-- Item 5 -->
<li class="item">
<figure class="wpf-demo-5">
<a href="#"><img src="../images/gift-delivery.jpg" alt="Send gifts in Mumbai, Thane and Navi Mumbai"></a>
<figcaption class="view-caption"  id="gift_delivery_link1" runat="server">
<h4>Gift Delivery </h4>            
<span id="gift_delivery_link" runat="server"><a href="#">Book Now</a></span>
  <span><a href="../services/gift-delivery-in-mumbai-thane-navi-mumbai/">Read More</a> </span>  

</figcaption>
</figure>
<span class="delivered" id="gift_delivery_count" runat="server">188 <small>DELIVERED</small></span>
<a href="../services/gift-delivery-in-mumbai-thane-navi-mumbai/"><h4>Gift Delivery</h4></a>
<p>Midnight gift deliveries for your dearest is now a reality. </p>
</li>
<!-- flower delivery-->
<li class="item">
<figure class="wpf-demo-5">
<a href="#"><img src="../images/flowers-delivery.jpg" alt="Flower delivery service in Mumbai, Thane and Navi Mumbai"></a>
<figcaption class="view-caption" id="flower_delivery_link1" runat="server">
<h4>Flower Delivery </h4>            
<span id="flower_delivery_link" runat="server"><a href="#">Book Now</a></span>
  <span><a href="../services/">Read More</a> </span>                
</figcaption>
</figure>
<span class="delivered" id="flower_delivery_count" runat="server">597 <small>DELIVERED</small></span>
<a href="../services/"><h4>Flower Delivery</h4></a>
<p>Get fresh flowers home delivered from any florist of your choice. </p>
</li>
<!-- Electronic delivery -->
<li class="item">
<figure class="wpf-demo-5">
<a href="#"><img src="../images/laptop-delivery.jpg" alt="Laptop pick up and delivery service in Mumbai, Thane and Navi Mumbai"></a>
<figcaption class="view-caption" id="electronic_delivery_link1" runat="server">
<h4>Electronic Delivery </h4>            
<span id="electronic_delivery_link" runat="server"><a href="#">Book Now</a></span>
  <span><a href="../services/laptop-mobile-usb-charger-delivery-in-mumbai/">Read More</a> </span>                 
</figcaption>
</figure>

<span class="delivered" id="electronic_delivery_count" runat="server">63 <small>DELIVERED</small></span>
<a href="../services/laptop-mobile-usb-charger-delivery-in-mumbai/"><h4>Electronic Delivery</h4></a>
<p> Forgotten usb stick, charger, laptop, mobile &amp; more delivered to office or home. </p>
</li>

<!-- Bakery  -->
<li class="item">
<figure class="wpf-demo-5">
<a href="#"><img src="../images/bakery-delivery.jpg" alt="Cookies, Pastry, Cupcakes delivery service in Mumbai"></a>
<figcaption class="view-caption" id="bakery_delivery_link1" runat="server">
<h4>Bakery delivery</h4>            
<span id="bakery_delivery_link" runat="server"><a href="#">Book Now</a></span>
  <span><a href="../services/">Read More</a> </span>              
</figcaption>
</figure>
<span class="delivered" id="bakery_delivery_count" runat="server">401 <small>DELIVERED</small></span>
<a href="../services/"><h4>Bakery Delivery</h4></a>
<p>Freshly baked bread &amp; confectionery home delivered under 90 minutes.</p>
</li>
<!-- Chocolate delivery  -->
<li class="item">
<figure class="wpf-demo-5">
<a href="#"><img src="../images/chocolate-delivery.jpg" alt="Chocolate basket, chocolate box delivery service for chocolate makers in Mumbai"></a>
<figcaption class="view-caption" id="chocolate_delivery_link1" runat="server">
<h4>Chocolate delivery</h4>            
<span id="chocolate_delivery_link" runat="server"><a href="#">Book Now</a></span>
  <span><a href="../services/chocolate-delivery-service-for-chocolatiers/">Read More</a> </span>                
</figcaption>
</figure>
<span class="delivered" id="chocolate_delivery_count" runat="server">202 <small>DELIVERED</small></span>
<a href="../services/chocolate-delivery-service-for-chocolatiers/"><h4>Chocolate Delivery</h4></a>
<p>Hassle-free chocolate basket deliveries anywhere in Mumbai.</p>
</li>
<!-- Cash delivery  -->
<li class="item">
<figure class="wpf-demo-5">
<a href="#"><img src="../images/cash-delivery.jpg" alt="Cash and Cheque Delivery Service in Mumbai"></a>
<figcaption class="view-caption" id="cash_delivery_link1" runat="server">
<h4>Cash delivery</h4>            
<span id="cash_delivery_link" runat="server"><a href="#">Book Now</a></span>
  <span><a href="../services/cash-pickup-and-delivery-service-in-mumbai/">Read More</a> </span>                  
</figcaption>
</figure>
<span class="delivered" id="cash_delivery_count" runat="server">755 <small>DELIVERED</small></span>
<a href="../services/cash-pickup-and-delivery-service-in-mumbai/"><h4>Cash Delivery</h4></a>
<p>Send a cheque or get payments home delivered from clients</p>
</li>
<!-- document delivery  -->
<li class="item">
<figure class="wpf-demo-5">
<a href="#"><img src="../images/documents-delivery.jpg" alt="Same day document delivery service in Mumbai."></a>
<figcaption class="view-caption" id="document_delivery_link1" runat="server">
<h4>Document delivery</h4>            
<span id="document_delivery_link" runat="server"><a href="#">Book Now</a></span>
  <span><a href="../services/same-day-document-delivery-in-mumbai/">Read More</a> </span> </figcaption>
</figure>
<span class="delivered" id="document_delivery_count" runat="server">947 <small>DELIVERED</small></span>
<a href="../services/same-day-document-delivery-in-mumbai/"><h4>Document Delivery</h4></a>
<p>Door to door same day document pickup and delivery service.</p>
</li>
<!-- Bulk  delivery  -->
<li class="item">
<figure class="wpf-demo-5">
<a href="#"><img src="../images/bulk-delivery.jpg" alt="Deliver Parcels in Bulk Mumbai"></a>
<figcaption class="view-caption" id="Bulk_delivery_link1" runat="server">
<h4>Bulk delivery</h4>            
<span id="Bulk_delivery_link" runat="server"><a href="#">Book Now</a></span>
  <span><a href="../services/arrange-collection-of-many-parcels-in-one-go/">Read More</a> </span>  
              
</figcaption>
</figure>
<span class="delivered" id="Bulk_delivery_count" runat="server">6128 <small>DELIVERED</small></span>
<a href="../services/arrange-collection-of-many-parcels-in-one-go/"><h4>Bulk Delivery</h4></a>
<p>Send hundreds of items to different parts of Mumbai in 1 day. </p>
</li>
<!-- parcel  delivery  -->
<li class="item">
<figure class="wpf-demo-5">
<a href="#"><img src="../images/parcel-delivery.jpg" alt="Parcel delivery in Mumbai"></a>
<figcaption class="view-caption" id="Parcel_delivery_link1" runat="server">
<h4>Parcel delivery</h4>            
<span id="Parcel_delivery_link" runat="server"><a href="#">Book Now</a></span>
  <span><a href="../services/send-a-parcel/">Read More</a> </span>  
               
</figcaption>
</figure>
<span class="delivered" id="Parcel_delivery_count" runat="server">3087 <small>DELIVERED</small></span>
<a href="../services/send-a-parcel/"><h4>Parcel Delivery</h4></a>
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

        </form>
</body>
</html>