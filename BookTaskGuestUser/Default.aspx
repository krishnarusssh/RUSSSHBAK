<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="BookTaskNew_Default" %>

<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/Footer.ascx" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Russsh-Book a Task
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="keywords" content="" />
	<meta name="google-site-verification" content="PCnwPC6sXKg7hAGCOZR4Ctvxj_EFT7bYmtpD7C_OGwE" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="https://www.russsh.com/css1/bootstrap.css" rel='stylesheet' type='text/css' />




    <!--From Zubair-->
    <link rel="stylesheet" href="../fonts/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/main.css" />
    <link href="css/button-switcher.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="https://www.russsh.com/css/font-awesome.css" />
    <link href="https://www.russsh.com/css1/menutopdwop.css" rel="stylesheet type='text/css'">
    <%--  <link href="https://www.russsh.com/css1/custom.css" rel="stylesheet type='text/css'">--%>

    <script src="https://www.russsh.com/js1/jquery.min.js"> </script>

    <%-- <link href="https://www.russsh.com/css-web/bootstrap.css" rel="stylesheet" type="text/css">--%>
    <link href="https://www.russsh.com/css-web/style.css" rel="stylesheet" type="text/css">
    <link href="../css-web/media-style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="../css-web/hover.css">
    <link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.theme.default.min.css">
    <link rel="stylesheet" type="text/css" href="../plugin/flex-slider/flexslider.css">
    <link rel="stylesheet" type="text/css" href="../mega-dropdown/css/style.css">
    <link rel="stylesheet" type="text/css" href="../plugin/tabbed/css/style.css">
    <link rel="stylesheet" type="text/css" href="../plugin/login-slider/content-slide.css">
    <link href="https://fonts.googleapis.com/css?family=Courgette" rel="stylesheet" type="text/css">
    <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <!--[if lt IE 9]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if lte IE 8]><link rel="stylesheet" type="text/css" href="css/ie8.css" media="screen"/><![endif]-->
    <script src="../js-web/modernizr.js"></script>
    <!-- Modernizr -->
    <script type="javascript">
function bringtofront()
{
$(".cd-dropdown-content").show();
}
    </script>




    <script type="text/javascript">
        //Filling Service Category
        function CallRequestQuote(ServiceCategory, ProductValue, ProductWeight, ReturnServiceCategory, ReturnProductValue, ReturnProductWeight, PickupAreaID, PickUpCityID, DropAreaID, DropCityID, PaymentMode, ApplyInsurance, PromoCode, TaskDate, IsExpress, TaskMode) {

            $.ajax({
                url: "Test.ashx",
                contentType: "application/text; charset=utf-8",
                data: {
                    'SERVICECATEGORY': ServiceCategory,
                    'PRODUCTVALUE': ProductValue,
                    'PRODUCTWEIGHT': ProductWeight,
                    'RETURNSERVICECATEGORY': ReturnServiceCategory,
                    'RETURNPRODUCTVALUE': ReturnProductValue,
                    'RETURNPRODUCTWEIGHT': ReturnProductWeight,
                    'PICKUPAREAID': PickupAreaID,
                    'PICKUPCITYID': PickUpCityID,
                    'DROPOFFAREAID': DropAreaID,
                    'DROPOFFCITYID': DropCityID,
                    'PAYMENTMODE': PaymentMode,
                    'APPLYINSURANCE': ApplyInsurance,
                    'PROMOCODE': PromoCode,
                    'TASKDATE': TaskDate,
                    'ISEXPRESS': IsExpress,
                    'TASKMODE': TaskMode

                },
                success: function OnComplete(result) {

                    var values = result.split(',');
                    var taskfee = values[0];
                    var excessbaggage = values[1];
                    var insurancef = values[2];
                    var promoc = values[3];
                    var total = values[4];
                    try {
                        if (document.getElementById("txtoutstanding").value != "0") {
                            total = (parseInt(total) + parseInt(document.getElementById("txtoutstanding").value));
                        }
                    }
                    catch (err) {
                        total = values[4];
                    }
                    var cashh = values[5];   //return charges
                    var discount = values[6];


                    document.getElementById("maintotalFee").innerHTML = total;
                    if (document.getElementById("ReturnServiceCategory").value == '19') {
                        document.getElementById("cash_data").value = cashh;
                        document.getElementById("taskfee_data").value = taskfee - cashh;
                        document.getElementById("txttaskfee").value = taskfee - cashh;
                        document.getElementById('<%=txttaskfee.ClientID %>').value = taskfee - cashh;
                    }
                    else {
                        document.getElementById("cash_data").value = '0';
                        document.getElementById("taskfee_data").value = taskfee;
                        document.getElementById("txttaskfee").value = taskfee;
                        document.getElementById('<%=txttaskfee.ClientID %>').value = taskfee;
            }
                    if (document.getElementById("Service_Category").value == '19') {
                        document.getElementById("cash_data").value = taskfee;
                        document.getElementById("taskfee_data").value = '0';
                    }

                    //document.getElementById("subtotalFee").value = total;
                    document.getElementById("subtotalFeeval").value = parseInt(total);
                    document.getElementById("txtbag").value = excessbaggage;
                    document.getElementById("txtttl").value = total;
                    document.getElementById("access_baggage_data").value = excessbaggage;
                    document.getElementById("insure_data").value = insurancef;
                    document.getElementById('<%=txtttl.ClientID %>').value = total;
                    document.getElementById('<%=txtbag.ClientID %>').value = excessbaggage;
document.getElementById("taskfee_data").value=parseInt(document.getElementById("taskfee_data").value)+parseInt(discount);

                    document.getElementById("txtinsid").value = insurancef;
                    document.getElementById('<%=txtinsid.ClientID %>').value = insurancef;

                    document.getElementById("discountFee").innerHTML = discount;
                    document.getElementById("txtFinalTotal").value = total;

                    if (parseInt(taskfee) > parseInt(document.getElementById("txtwall").value)) {
                        document.getElementById("chkwall").disabled = "true";
                        document.getElementById("chkPickUp").checked = "true";
                    }
                    else {
                        if (parseInt(document.getElementById("txtwall").value) > parseInt(taskfee)) {
                            document.getElementById("chkPickUp").disabled = "true";
                            document.getElementById("chkDrop").disabled = "true";
                        }


                        document.getElementById("chkwall").checked = "true";
                    }
                    document.getElementById("btnSubmit").style.display = "block";
                },
                error: OnFail
            });
            return false;
        }
        function hideaddress() {
            document.getElementById("addressbook").style.display = 'none';
            initiatesource = document.getElementById("AddressInitiateFlag").value;
            if (initiatesource == "P") {
                document.getElementById("step3").style.display = 'block';
            }
            if (initiatesource == "D") {
                document.getElementById("step4").style.display = 'block';
            }
            document.getElementById("AddressInitiateFlag").value = '';
        }
        function OnFail(result) {
            alert('Request Failed');
        }
        var unavailableDates = ["24-3-2016"];
        function unavailable(date) {
            dmy = date.getDate() + "-" + (date.getMonth() + 1) + "-" + date.getFullYear();
            if ($.inArray(dmy, unavailableDates) < 0) {
                return [true, "", "Book Now"];
            } else {
                return [false, "", "Booked Out"];
            }
        }

        $(document).ready(function () {

            $('#taskdate').datepicker({ minDate: 0, beforeShowDay: unavailable });

            $("#dvContent").append("<ul></ul>");
            $.ajax({
                type: "GET",
                url: "Services.xml",
                dataType: "xml",
                success: function (xml) {
                    var select = document.getElementById("Service_Category");


                    var i = 0;
                    var option = document.createElement('option');
                    option.text = "Select what you want to send?";
                    option.value = "0";
                    select.add(option, i);


                    $(xml).find('Category').each(function () {

                        var sValue = $(this).find('TaskNameDescriptionId').text();
                        var sText = $(this).find('Name').text();
                        i = i + 1;
                        var option1 = document.createElement('option');
                        option1.text = sText;
                        option1.value = sValue;

                        select.add(option1, i);


                        //$("<li></li>").html(sTitle + ", " + sPublisher).appendTo("#dvContent ul");

                    });
                },
                error: function () {
                    alert("An error occurred while processing XML file.");
                }
            });

            //Return Service Category


            $("#dvContent").append("<ul></ul>");
            $.ajax({
                type: "GET",
                url: "Services.xml",
                dataType: "xml",
                success: function (xml) {
                    var select = document.getElementById("ReturnServiceCategory");


                    var i = 0;
                    var option = document.createElement('option');
                    option.text = "Select what you want to send?";
                    option.value = "0";
                    select.add(option, i);


                    $(xml).find('Category').each(function () {

                        var sValue = $(this).find('TaskNameDescriptionId').text();
                        var sText = $(this).find('Name').text();
                        i = i + 1;
                        var option1 = document.createElement('option');
                        option1.text = sText;
                        option1.value = sValue;
                        select.add(option1, i);
                        //$("<li></li>").html(sTitle + ", " + sPublisher).appendTo("#dvContent ul");

                    });
                },
                error: function () {
                    alert("An error occurred while processing XML file.");
                }
            });

            //Filling Weight

            $("#dvContent").append("<ul></ul>");
            $.ajax({
                type: "GET",
                url: "Weight.xml",
                dataType: "xml",
                success: function (xml) {
                    var select = document.getElementById("weight1");


                    var i = 0;
                    var option = document.createElement('option');
                    $(xml).find('Weight').each(function () {

                        var sValue = $(this).find('WeightID').text();
                        var sText = $(this).find('WeightText').text();
                        i = i + 1;
                        var option1 = document.createElement('option');
                        option1.text = sText;
                        option1.value = sValue;
                        select.add(option1, i);


                        //$("<li></li>").html(sTitle + ", " + sPublisher).appendTo("#dvContent ul");

                    });
                },
                error: function () {
                    alert("An error occurred while processing XML file.");
                }
            });


            $("#dvContent").append("<ul></ul>");
            $.ajax({
                type: "GET",
                url: "Weight.xml",
                dataType: "xml",
                success: function (xml) {
                    var select = document.getElementById("weight2");


                    var i = 0;
                    var option = document.createElement('option');
                    $(xml).find('Weight').each(function () {

                        var sValue = $(this).find('WeightID').text();
                        var sText = $(this).find('WeightText').text();
                        i = i + 1;
                        var option1 = document.createElement('option');
                        option1.text = sText;
                        option1.value = sValue;
                        select.add(option1, i);
                        select.selectedIndex = 0;

                        //$("<li></li>").html(sTitle + ", " + sPublisher).appendTo("#dvContent ul");

                    });
                },
                error: function () {
                    alert("An error occurred while processing XML file.");
                }
            });

            //Filling Time Slot


            //$("#dvContent").append("<ul></ul>");
            //$.ajax({
            //    type: "GET",
            //    url: "TimeSlot.xml",
            //    dataType: "xml",
            //    success: function (xml) {
            //        var select = document.getElementById("pickuptime");
            //        var i = 0;
            //        var option = document.createElement('option');
            //        $(xml).find('TIMESLOT').each(function () {

            //            var sValue = $(this).find('TimeSlotId').text();
            //            var sText = $(this).find('FromToTimeSlot').text();
            //            i = i + 1;
            //            var option1 = document.createElement('option');
            //            option1.text = sText;
            //            option1.value = sValue;
            //            select.add(option1, i);
            //        });
            //    },
            //    error: function () {
            //        alert("An error occurred while processing XML file.");
            //    }
            //});


            $("#dvContent").append("<ul></ul>");
            $.ajax({
                type: "GET",
                url: "TimeSlot.xml",
                dataType: "xml",
                success: function (xml) {
                    var select = document.getElementById("dropuptime");


                    var i = 0;
                    var option = document.createElement('option');
                    $(xml).find('TIMESLOT').each(function () {

                        var sValue = $(this).find('TimeSlotId').text();
                        var sText = $(this).find('FromToTimeSlot').text();
                        i = i + 1;
                        var option1 = document.createElement('option');
                        option1.text = sText;
                        option1.value = sValue;
                        select.add(option1, i);


                        //$("<li></li>").html(sTitle + ", " + sPublisher).appendTo("#dvContent ul");

                    });
                },
                error: function () {
                    alert("An error occurred while processing XML file.");
                }
            });

            //Filling Areas
            // old code
            //$("#dvContent").append("<ul></ul>");
            //$.ajax({
            //    type: "GET",
            //    url: "Areas.xml",
            //    dataType: "xml",
            //    success: function (xml) {
            //        var select = document.getElementById("pickuparea");


            //        var i = 0;
            //        var option = document.createElement('option');
            //        $(xml).find('AREAS').each(function () {

            //            var sValue = $(this).find('Area_ID').text();
            //            var sText = $(this).find('Area_Name').text();
            //            i = i + 1;
            //            var option1 = document.createElement('option');
            //            option1.text = sText;
            //            option1.value = sValue;
            //            select.add(option1, i);


            //            //$("<li></li>").html(sTitle + ", " + sPublisher).appendTo("#dvContent ul");

            //        });
            //    },
            //    error: function () {
            //        alert("An error occurred while processing XML file.");
            //    }
            //});


            //$("#dvContent").append("<ul></ul>");
            //$.ajax({
            //    type: "GET",
            //    url: "Areas.xml",
            //    dataType: "xml",
            //    success: function (xml) {
            //        var select = document.getElementById("dropuparea");


            //        var i = 0;
            //        var option = document.createElement('option');
            //        $(xml).find('AREAS').each(function () {

            //            var sValue = $(this).find('Area_ID').text();
            //            var sText = $(this).find('Area_Name').text();
            //            i = i + 1;
            //            var option1 = document.createElement('option');
            //            option1.text = sText;
            //            option1.value = sValue;
            //            select.add(option1, i);


            //            //$("<li></li>").html(sTitle + ", " + sPublisher).appendTo("#dvContent ul");

            //        });
            //    },
            //    error: function () {
            //        alert("An error occurred while processing XML file.");
            //    }
            //});

            /// New for haptick area
            $("#dvContent").append("<ul></ul>");
            var clientid = $('#txtcid').val();

            if (clientid == 15532) {
                $.ajax({
                    type: "GET",
                    url: "AreasHaptick.xml",
                    dataType: "xml",
                    success: function (xml) {
                        var select = document.getElementById("pickuparea");
                        //var clientid = $('#txtcid').val();
                        //alert(clientid);
                        var i = 0;

                        var option = document.createElement('option');
                        $(xml).find('AREAS').each(function () {

                            var sValue = $(this).find('Area_ID').text();
                            var sText = $(this).find('Area_Name').text();
                            i = i + 1;
                            var option1 = document.createElement('option');
                            option1.text = sText;
                            option1.value = sValue;
                            select.add(option1, i);
                            //$("<li></li>").html(sTitle + ", " + sPublisher).appendTo("#dvContent ul");
                        });
                    },
                    error: function () {
                        alert("An error occurred while processing XML file.");
                    }
                });
            }
            else {
                $.ajax({
                    type: "GET",
                    url: "Areas.xml",
                    dataType: "xml",
                    success: function (xml) {
                        var select = document.getElementById("pickuparea");
                        //var clientid = $('#txtcid').val();
                        //alert(clientid);
                        var i = 0;
                        var option = document.createElement('option');
                        $(xml).find('AREAS').each(function () {

                            var sValue = $(this).find('Area_ID').text();
                            var sText = $(this).find('Area_Name').text();
                            i = i + 1;
                            var option1 = document.createElement('option');
                            option1.text = sText;
                            option1.value = sValue;
                            select.add(option1, i);
                            //$("<li></li>").html(sTitle + ", " + sPublisher).appendTo("#dvContent ul");
                        });
                    },
                    error: function () {
                        alert("An error occurred while processing XML file.");
                    }
                });
            }



            $("#dvContent").append("<ul></ul>");
            var clientid = $('#txtcid').val();

            if (clientid == 15532) {
                $.ajax({
                    type: "GET",
                    url: "AreasHaptick.xml",
                    dataType: "xml",
                    success: function (xml) {
                        var select = document.getElementById("dropuparea");
                        var i = 0;
                        var option = document.createElement('option');
                        $(xml).find('AREAS').each(function () {

                            var sValue = $(this).find('Area_ID').text();
                            var sText = $(this).find('Area_Name').text();
                            i = i + 1;
                            var option1 = document.createElement('option');
                            option1.text = sText;
                            option1.value = sValue;
                            select.add(option1, i);


                            //$("<li></li>").html(sTitle + ", " + sPublisher).appendTo("#dvContent ul");

                        });
                    },
                    error: function () {
                        alert("An error occurred while processing XML file.");
                    }
                });

            }
            else {
                $.ajax({
                    type: "GET",
                    url: "Areas.xml",
                    dataType: "xml",
                    success: function (xml) {
                        var select = document.getElementById("dropuparea");
                        var i = 0;
                        var option = document.createElement('option');
                        $(xml).find('AREAS').each(function () {

                            var sValue = $(this).find('Area_ID').text();
                            var sText = $(this).find('Area_Name').text();
                            i = i + 1;
                            var option1 = document.createElement('option');
                            option1.text = sText;
                            option1.value = sValue;
                            select.add(option1, i);


                            //$("<li></li>").html(sTitle + ", " + sPublisher).appendTo("#dvContent ul");

                        });
                    },
                    error: function () {
                        alert("An error occurred while processing XML file.");
                    }
                });

            }



            //ENd
        });



    </script>



    <script type="text/javascript">
        function checkform() {
            if (document.getElementById("email").value == "") {
                alert("Enter Email ID to subscribe!");
                document.getElementById("email").focus();
                return false;
            }
            else {
                var email = document.getElementById("email").value;
                var regex = /^([0-9a-zA-Z]([-_\\.]*[0-9a-zA-Z]+)*)@([0-9a-zA-Z]([-_\\.]*[0-9a-zA-Z]+)*)[\\.]([a-zA-Z]{2,9})$/;
                if (!regex.test(email)) {
                    alert("Enter a valid email");
                    return false;
                }
            }
        }
    </script>
    <style type="text/css" style="border: 1px solid #999999">
        .ddl {
            padding: 9px;
            width: 49%;
            font-size: 15px;
            margin: 10px 0px;
            border: 1px solid #bbbbbb;
            color: #555;
            background: none;
            background: #fff;
            -webkit-appearance: none;
            outline: none;
            font-weight: 400;
            -webkit-border-radius: 0.3em;
            -moz-border-radius: 0.3em;
            -o-border-radius: 0.3em;
            text-align: left;
            -webkit-transition: all 0.3s ease-out;
            -moz-transition: all 0.3s ease-out;
            -ms-transition: all 0.3s ease-out;
            -o-transition: all 0.3s ease-out;
            transition: all 0.3s ease-out;
        }

        .accordionContent {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 10px;
            width: 98%;
        }

        .accordionHeaderSelected {
            background-color: #fcaf17;
            border: 1px solid #fcaf17;
            color: white;
            cursor: pointer;
            font-size: 20px;
            font-weight: bold;
            margin-top: 5px;
            padding: 10px;
            width: 98%;
        }

            .accordionHeaderSelected a:link {
                color: white;
                text-decoration: none;
            }

        .accordionHeader {
            background-color: #F5F5DC;
            border: 1px solid #fcaf17;
            color: black;
            cursor: pointer;
            font-size: 20px;
            font-weight: bold;
            margin-top: 5px;
            padding: 10px;
            width: 98%;
            text-decoration: none;
        }

            .accordionHeader:hover {
                background-color: #fcaf17;
                border: 1px solid #fcaf17;
                color: white;
            }

        .t {
            padding: 5px;
        }

        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=60);
            opacity: 0.6;
        }

        .modalPopup {
            background-color: #FFFFFF;
            width: 300px;
            border: 3px solid #0DA9D0;
            border-radius: 12px;
            padding: 0;
        }

            .modalPopup .header {
                background-color: #2FBDF1;
                height: 30px;
                color: White;
                line-height: 30px;
                text-align: center;
                font-weight: bold;
                border-top-left-radius: 6px;
                border-top-right-radius: 6px;
            }

            .modalPopup .body {
                min-height: 50px;
                line-height: 30px;
                text-align: center;
                font-weight: bold;
            }

            .modalPopup .footer {
                padding: 6px;
            }

            .modalPopup .yes, .modalPopup .no {
                height: 23px;
                color: White;
                line-height: 23px;
                text-align: center;
                font-weight: bold;
                cursor: pointer;
                border-radius: 4px;
            }

            .modalPopup .yes {
                background-color: #2FBDF1;
                border: 1px solid #0DA9D0;
            }

            .modalPopup .no {
                background-color: #9F9F9F;
                border: 1px solid #5C5C5C;
            }

        .modaal {
            position: fixed;
            z-index: 999;
            height: 100%;
            width: 100%;
            top: 0;
            filter: alpha(opacity=60);
            opacity: 0.6;
            -moz-opacity: 0.8;
        }

        .center {
            z-index: 1000;
            margin: 300px auto;
            padding: 10px;
            width: 400px;
            background-color: white;
            border-radius: 10px;
            filter: alpha(opacity=100);
            opacity: 1;
            -moz-opacity: 1;
        }

            .center img {
                height: 128px;
                width: 128px;
            }


        .mo {
        }

            .mo ul {
                list-style: inside none;
                padding: 0;
                margin: 0;
            }

                .mo ul li {
                    list-style: inside none;
                    display: block;
                    position: relative;
                    margin-top: -25px;
                }

                    .mo ul li ul {
                        display: none;
                        z-index: 999;
                        position: absolute;
                        top: 15px;
                        left: 2px;
                        background-color: #FFFFFF;
                        width: 300px;
                    }


                    .mo ul li:hover ul {
                        display: block;
                    }

        .ajax__calendar_years {
            top: 0px;
            left: 180px !important;
            height: 139px !important;
            width: 200px;
            position: absolute;
            text-align: center;
        }

        .ajax__calendar_day {
            height: 25px !important;
            width: 25px !important;
            text-align: right;
            padding: 5px !important;
            cursor: pointer;
            font-size: 13px !important;
        }

        .ajax__calendar_container {
            padding: 4px !important;
            cursor: default;
            width: 200px !important;
            height: 190px !important;
            font-size: 15px !important;
            text-align: center;
            font-family: tahoma,verdana,helvetica;
            background-color: white !important;
            border: 1px solid #999999;
        }

            .ajax__calendar_container TD {
                padding: 0 !important;
                margin: 0 !important;
            }

        .addressbookbtn {
            border-radius: 5px;
            fa-book;
        }



        .spinner div {
            width: 20px;
            height: 20px;
            position: absolute;
            left: -20px;
            top: 40px;
            background-color: #333;
            border-radius: 50%;
            animation: move 4s infinite cubic-bezier(.2,.64,.81,.23);
        }

            .spinner div:nth-child(2) {
                animation-delay: 150ms;
            }

            .spinner div:nth-child(3) {
                animation-delay: 300ms;
            }

            .spinner div:nth-child(4) {
                animation-delay: 450ms;
            }

        @keyframes move {
            0% {
                left: 0%;
            }

            75% {
                left: 100%;
            }

            100% {
                left: 100%;
            }
        }
    </style>
   <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-65976441-1', 'auto');
  ga('send', 'pageview');

</script>

    <script>


        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }
        function ChangeExpressFlag() {
            //if (document.getElementById("expressflag").value == 0) {
            //    document.getElementById("expressflag").value = "1";
            //    document.getElementById("btnExpress").style.backgroundColor = '#FFA500';
            //    document.getElementById("btnNormal").style.backgroundColor = '#FFF';
            //}
            //else if (document.getElementById("expressflag").value == 1) {
            //    document.getElementById("btnExpress").style.backgroundColor = '#FFFFFF';
            //    document.getElementById("expressflag").value = "0";
            //    document.getElementById("btnNormal").style.backgroundColor = '#FFA500';
            //}

            document.getElementById("expressflag").value = "1";
            document.getElementById("btnExpress").style.backgroundColor = '#ee846a';
            document.getElementById("btnNormal").style.backgroundColor = '#FFFFFF';
            document.getElementById("btnNormal").style.color = 'black';
            document.getElementById("btnExpress").style.color = '#FFF';



        }
        function ChangeNormalFlag() {
            document.getElementById("expressflag").value = "0";
            document.getElementById("btnExpress").style.backgroundColor = '#FFFFFF';
            document.getElementById("btnNormal").style.backgroundColor = '#ee846a';
            document.getElementById("btnExpress").style.color = 'black';
            document.getElementById("btnNormal").style.color = '#FFF';
        }
        function ChangeinsureYes() {
            document.getElementById("insuranceflag").value = "1";

            document.getElementById("btninsureYes").style.backgroundColor = '#ee846a';
            document.getElementById("btninsureNo").style.backgroundColor = '#FFFFFF';
            RequestQuoteFunction()
        }
        function ChangeinsureNo() {
            document.getElementById("insuranceflag").value = "0";

            document.getElementById("btninsureYes").style.backgroundColor = '#FFFFFF';
            document.getElementById("btninsureNo").style.backgroundColor = '#ee846a';
            RequestQuoteFunction()
        }

        function check() {
            alert('hii');
        }

        function ShowReturn() {
            document.getElementById("returndiv").style.display = 'block';
            document.getElementById("returnflag").value = "1";
            document.getElementById("btnSingle").style.backgroundColor = '#FFFFFF';
            document.getElementById("btnReturn").style.backgroundColor = '#ee846a';
            document.getElementById("btnSingle").style.color = 'black';
            document.getElementById("btnReturn").style.color = '#FFF';
        }
        function HideReturn() {
            document.getElementById("returndiv").style.display = 'none';
            document.getElementById("returnflag").value = "0";
            document.getElementById("btnReturn").style.backgroundColor = '#FFFFFF';
            document.getElementById("btnSingle").style.backgroundColor = '#ee846a';
            document.getElementById("btnReturn").style.color = 'black';
            document.getElementById("btnSingle").style.color = '#FFF';
        }

        function CleanPickUpSection() {
            document.getElementById("pfirstname").value = '';
            document.getElementById("plastname").value = '';
            document.getElementById("pmobileno").value = '';
            document.getElementById("paddress").value = '';
            document.getElementById("plandmark").value = '';

            document.getElementById("pfirstname").focus();

        }

        function CleanDropUpSection() {
            document.getElementById("dfirstname").value = '';
            document.getElementById("dlastname").value = '';
            document.getElementById("dmobileno").value = '';
            document.getElementById("daddress").value = '';
            document.getElementById("dlandmark").value = '';

            document.getElementById("dfirstname").focus();
        }


        function ShowStep1() {
            document.getElementById("step1").style.display = 'block';
            document.getElementById("step2").style.display = 'none';
            document.getElementById("step3").style.display = 'none';
            document.getElementById("step4").style.display = 'none';
            document.getElementById("step5").style.display = 'none';
            document.getElementById("step6").style.display = 'none';
            document.getElementById("addressbook").style.display = 'none';
        }
        function ShowStep2() {

            var eno = 0;

            if (document.getElementById("Service_Category").value == "0" || document.getElementById("Service_Category").value == null) {

                // errorface
                document.getElementById("Service_Category").setAttribute("class", "form-control sp1 errorface");

                eno = eno + 1;
            }
            if (document.getElementById("description").value == "") {
                document.getElementById("description").setAttribute("class", "form-control sp1 errorface");

                eno = eno + 1;
            }
            if (document.getElementById("productvalue").value == "") {
                document.getElementById("productvalue").setAttribute("class", "form-control errorface");

                eno = eno + 1;
            }
            if (document.getElementById("weight1").value == "-1") {
                document.getElementById("weight1").setAttribute("class", "form-control errorface");

                eno = eno + 1;
            }
            if (document.getElementById("taskdate").value == "") {
                document.getElementById("taskdate").setAttribute("class", "datepicker form-control hasDatepicker errorface");

                eno = eno + 1;
            }
            if (document.getElementById("pickuptime").value == "0") {
                document.getElementById("pickuptime").setAttribute("class", "form-control errorface");

                eno = eno + 1;
            }

            if (eno > 0) {

                return false;
            }


            document.getElementById("step1").style.display = 'none';
            document.getElementById("step2").style.display = 'block';
            document.getElementById("step3").style.display = 'none';
            document.getElementById("step4").style.display = 'none';
            document.getElementById("step5").style.display = 'none';
            document.getElementById("step6").style.display = 'none';
            document.getElementById("addressbook").style.display = 'none';
            document.getElementById("header_step1").setAttribute("class", "light-gray");


        }

        function ShowStep3() {

            if (document.getElementById("returnflag").value == "1") {
                var eno = 0;

                if (document.getElementById("ReturnServiceCategory").value == "0" || document.getElementById("ReturnServiceCategory").value == null) {

                    // errorface
                    document.getElementById("ReturnServiceCategory").setAttribute("class", "form-control errorface");

                    eno = eno + 1;
                }
                if (document.getElementById("returndescription").value == "") {
                    document.getElementById("returndescription").setAttribute("class", "form-control errorface");

                    eno = eno + 1;
                }
                if (document.getElementById("returnproductvalue").value == "") {
                    document.getElementById("returnproductvalue").setAttribute("class", "form-control errorface");

                    eno = eno + 1;
                }
                if (document.getElementById("weight2").value == "-1") {
                    document.getElementById("weight2").setAttribute("class", "form-control errorface");

                    eno = eno + 1;
                }

                if (eno > 0) {

                    return false;
                }

            }



            document.getElementById("step1").style.display = 'none';
            document.getElementById("step2").style.display = 'none';
            document.getElementById("step3").style.display = 'block';
            document.getElementById("step4").style.display = 'none';
            document.getElementById("step5").style.display = 'none';
            document.getElementById("step6").style.display = 'none';
            document.getElementById("addressbook").style.display = 'none';
            document.getElementById("header_step2").setAttribute("class", "light-gray");
        }

        function SavePickUpAddress() {
            if (document.getElementById("AddressInitiateFlag").value == 'U') {
                var AddressId = 0;
                var ClientId = '<%= Session["CLIENT_ID"] %>';
                var AddressName = document.getElementById("pfirstname").value;
                var Address = document.getElementById("paddress").value;
                var Area = document.getElementById("pickuparea").innerText;
                var city = document.getElementById("pcity").innerText;
                var Landmark = document.getElementById("plandmark").value;
                var Pincode = document.getElementById("ppincode").value;
                var MobileNo = document.getElementById("pmobileno").value;
                var cityid = document.getElementById("pcity").value;
                var areaid = document.getElementById("pickuparea").value;
                CallSavepaddress(0, ClientId, AddressName, Address, "Sample", "Sample", Landmark, Pincode, MobileNo, cityid, areaid);

            }
            else {
                ShowStep4();
            }
        }

        function CallSavepaddress(aid, cid, aname, address, areaname, cityname, landmark, pincode, mobileno, city, area) {

            $.ajax({
                url: "SaveAddress.ashx",
                contentType: "application/text; charset=utf-8",
                data: {
                    'AddressID': aid,
                    'ClientID': cid,
                    'AddressName': aname,
                    'Address': address,
                    'AreaName': areaname,
                    'CityName': cityname,
                    'Landmark': landmark,
                    'PinCode': pincode,
                    'MobileNo': mobileno,
                    'CityID': city,
                    'AreaID': area
                },
                success: Saved,
                error: Failed
            });
            return false;
        }
        function Saved() {
            ShowStep4();
        }

        function Failed() {

        }

        function CallSavedaddress(aid, cid, aname, address, areaname, cityname, landmark, pincode, mobileno, city, area) {

            $.ajax({
                url: "SaveAddress.ashx",
                contentType: "application/text; charset=utf-8",
                data: {
                    'AddressID': aid,
                    'ClientID': cid,
                    'AddressName': aname,
                    'Address': address,
                    'AreaName': areaname,
                    'CityName': cityname,
                    'Landmark': landmark,
                    'PinCode': pincode,
                    'MobileNo': mobileno,
                    'CityID': city,
                    'AreaID': area
                },
                success: saved1,
                error: failed1
            });
            return false;
        }
        function saved1() {
            ShowStep5();
        }

        function failed1() {

        }

        function SaveDropOffAddress() {

            if (document.getElementById("AddressInitiateFlag").value == 'U') {
                var AddressId = 0;
                var ClientId = '<%= Session["CLIENT_ID"] %>';
                var AddressName = document.getElementById("dfirstname").value;
                var Address = document.getElementById("daddress").value;
                var Area = document.getElementById("dropuparea").innerText;
                var city = document.getElementById("dcity").innerText;
                var Landmark = document.getElementById("dlandmark").value;
                var Pincode = document.getElementById("dpincode").value;
                var MobileNo = document.getElementById("dmobileno").value;
                var cityid = document.getElementById("dcity").value;
                var areaid = document.getElementById("dropuparea").value;
                CallSavedaddress(0, ClientId, AddressName, Address, "Sample", "Sample", Landmark, Pincode, MobileNo, cityid, areaid);

            }
            else {
                ShowStep5();
            }

        }

        function ShowStep4() {

            var eno = 0;

            if (document.getElementById("pfirstname").value == "") {
                document.getElementById("pfirstname").setAttribute("class", "form-control errorface");

                eno = eno + 1;
            }

            if (document.getElementById("pmobileno").value == "") {
                document.getElementById("pmobileno").setAttribute("class", "form-control errorface");

                eno = eno + 1;
            }
            if (document.getElementById("paddress").value == "") {
                document.getElementById("paddress").setAttribute("class", "form-control errorface");

                eno = eno + 1;
            }
            if (document.getElementById("pickuparea").value == "0") {
                document.getElementById("pickuparea").setAttribute("class", "form-control errorface");

                eno = eno + 1;
            }
            if (document.getElementById("ppincode").value == "") {
                document.getElementById("ppincode").setAttribute("class", "form-control errorface");

                eno = eno + 1;
            }

            if (eno > 0) {

                return false;
            }

            document.getElementById("step1").style.display = 'none';
            document.getElementById("step2").style.display = 'none';
            document.getElementById("step3").style.display = 'none';
            document.getElementById("step4").style.display = 'block';
            document.getElementById("step5").style.display = 'none';
            document.getElementById("step6").style.display = 'none';
            document.getElementById("addressbook").style.display = 'none';
            document.getElementById("header_step3").setAttribute("class", "light-gray");
        }

        function RequestQuoteFunction() {
            document.getElementById("btnSubmit").style.display = "none";
            var ServiceCategory = document.getElementById("Service_Category").value;
            var ProductValue = document.getElementById("productvalue").value;
            var ProductWeight = document.getElementById("weight1").value;
            var ReturnServiceCategory = document.getElementById("ReturnServiceCategory").value;
            var ReturnProductValue = document.getElementById("returnproductvalue").value;
            var ReturnProductWeight = document.getElementById("weight2").value;
            var PickupAreaID = document.getElementById("pickuparea").value;
            var PickUpCityID = document.getElementById("pcity").value;
            var DropAreaID = document.getElementById("dropuparea").value;
            var DropCityID = document.getElementById("dcity").value;
            var PaymentMode = "0";


            var PromoCode = document.getElementById("promocode").value
            var TaskDate = document.getElementById("taskdate").value;


            var ApplyInsurance = "N";

            if (document.getElementById("insuranceflag").value == "1") {
                ApplyInsurance = "Y";
            }
            else if (document.getElementById("insuranceflag").value == "0") {
                ApplyInsurance = "N";
            }

            var TaskMode = "SINGLE";
            if (document.getElementById("returnflag").value == "0") {
                TaskMode = "SINGLE";
            }
            else if (document.getElementById("returnflag").value == "1") {
                TaskMode = "RETURN";
            }

            var IsExpress = "N";

            if (document.getElementById("expressflag").value == "0") {
                IsExpress = "N";
            }
            else if (document.getElementById("expressflag").value == "1") {
                IsExpress = "Y";
            }



            CallRequestQuote(ServiceCategory, ProductValue, ProductWeight, ReturnServiceCategory, ReturnProductValue,
                ReturnProductWeight, PickupAreaID, PickUpCityID, DropAreaID, DropCityID, PaymentMode,
                ApplyInsurance, PromoCode, TaskDate, IsExpress, TaskMode);

        }


        function ShowStep5() {

            var eno = 0;

            if (document.getElementById("dfirstname").value == "") {
                document.getElementById("dfirstname").setAttribute("class", "form-control errorface");

                eno = eno + 1;
            }

            if (document.getElementById("dmobileno").value == "") {
                document.getElementById("dmobileno").setAttribute("class", "form-control errorface");

                eno = eno + 1;
            }
            if (document.getElementById("daddress").value == "") {
                document.getElementById("daddress").setAttribute("class", "form-control errorface");

                eno = eno + 1;
            }
            if (document.getElementById("dropuparea").value == "0") {
                document.getElementById("dropuparea").setAttribute("class", "form-control errorface");

                eno = eno + 1;
            }
            if (document.getElementById("dpincode").value == "0") {
                document.getElementById("dpincode").setAttribute("class", "form-control errorface");

                eno = eno + 1;
            }
            if (eno > 0) {

                return false;
            }

            document.getElementById("btnSubmit").style.display = "none";
            //Request Quote Web Service Calling
            RequestQuoteFunction();
            document.getElementById("btnSubmit").style.display = "block";
            document.getElementById("step1").style.display = 'none';
            document.getElementById("step2").style.display = 'none';
            document.getElementById("step3").style.display = 'none';
            document.getElementById("step4").style.display = 'none';
            document.getElementById("step5").style.display = 'block';
            document.getElementById("step6").style.display = 'none';
            document.getElementById("addressbook").style.display = 'none';
            document.getElementById("header_step4").setAttribute("class", "light-gray");
        }
        function ShowStep6() {
            document.getElementById("step1").style.display = 'none';
            document.getElementById("step2").style.display = 'none';
            document.getElementById("step3").style.display = 'none';
            document.getElementById("step4").style.display = 'none';
            document.getElementById("step5").style.display = 'none';
            document.getElementById("step6").style.display = 'block';
            document.getElementById("addressbook").style.display = 'none';
            document.getElementById("header_step5").setAttribute("class", "light-gray");
        }
        function ShowAddressBook(srcu) {

            document.getElementById("AddressInitiateFlag").value = srcu;

            document.getElementById("step1").style.display = 'none';
            document.getElementById("step2").style.display = 'none';
            document.getElementById("step3").style.display = 'none';
            document.getElementById("step4").style.display = 'none';
            document.getElementById("step5").style.display = 'none';
            document.getElementById("step6").style.display = 'none';
            document.getElementById("addressbook").style.display = 'block';


        }
        function BackToAddressPlace(addressline) {

            var values = addressline.split('@');
            var name = values[0].replace("~", " ");
            var mobile = values[1].replace("~", " ");
            var a = values[2];

            var address = a.replace("~", " ");
            var area = values[3].replace("~", " ");
            var pincode = values[4].replace("~", " ");
            var landmark = values[5].replace("~", " ");


            initiatesource = document.getElementById("AddressInitiateFlag").value;
            if (initiatesource == "P") {

                document.getElementById("pfirstname").value = name;
                document.getElementById("plastname").value = '';
                document.getElementById("pmobileno").value = mobile;
                document.getElementById("ppincode").value = pincode;
                document.getElementById("plandmark").value = landmark;


                var vals = address.split('~');

                var s = '';
                if (vals[0] != undefined) {
                    s = s + vals[0] + ' ';
                }
                if (vals[1] != undefined) {
                    s = s + vals[1] + ' ';
                }
                if (vals[2] != undefined) {
                    s = s + vals[2] + ' ';
                }
                if (vals[3] != undefined) {
                    s = s + vals[3] + ' ';
                }
                if (vals[4] != undefined) {
                    s = s + vals[4] + ' ';
                }
                if (vals[5] != undefined) {
                    s = s + vals[5] + ' ';
                }
                if (vals[6] != undefined) {
                    s = s + vals[6] + ' ';
                }
                if (vals[7] != undefined) {
                    s = s + vals[7] + ' ';
                }
                if (vals[8] != undefined) {
                    s = s + vals[8] + ' ';
                }
                if (vals[9] != undefined) {
                    s = s + vals[9] + ' ';
                }
                document.getElementById("paddress").value = s;
                // document.getElementById("paddress").value = vals[0] + ' ' + vals[1] + ' ' + vals[2] + ' ' + vals[3] + ' ' + vals[4] + ' ' + vals[5] + ' ' + vals[6] + ' ' + vals[7] + ' ' + vals[8] + ' ' + vals[9];

                document.getElementById("pickuparea").value = area;


                document.getElementById("step1").style.display = 'none';
                document.getElementById("step2").style.display = 'none';
                document.getElementById("step3").style.display = 'block';
                document.getElementById("step4").style.display = 'none';
                document.getElementById("step5").style.display = 'none';
                document.getElementById("step6").style.display = 'none';
                document.getElementById("addressbook").style.display = 'none';
                return false;
            }
            else if (initiatesource == "D") {
                document.getElementById("dfirstname").value = name;
                document.getElementById("dlastname").value = '';
                document.getElementById("dmobileno").value = mobile;
                document.getElementById("dpincode").value = pincode;
                document.getElementById("dlandmark").value = landmark;

                var vals = address.split('~');

                var s = '';
                if (vals[0] != undefined) {
                    s = s + vals[0] + ' ';
                }
                if (vals[1] != undefined) {
                    s = s + vals[1] + ' ';
                }
                if (vals[2] != undefined) {
                    s = s + vals[2] + ' ';
                }
                if (vals[3] != undefined) {
                    s = s + vals[3] + ' ';
                }
                if (vals[4] != undefined) {
                    s = s + vals[4] + ' ';
                }
                if (vals[5] != undefined) {
                    s = s + vals[5] + ' ';
                }
                if (vals[6] != undefined) {
                    s = s + vals[6] + ' ';
                }
                if (vals[7] != undefined) {
                    s = s + vals[7] + ' ';
                }
                if (vals[8] != undefined) {
                    s = s + vals[8] + ' ';
                }
                if (vals[9] != undefined) {
                    s = s + vals[9] + ' ';
                }
                document.getElementById("daddress").value = s;


                //document.getElementById("daddress").value = vals[0] + ' ' + vals[1] + ' ' + vals[2] + ' ' + vals[3] + ' ' + vals[4] + ' ' + vals[5] + ' ' + vals[6] + ' ' + vals[7] + ' ' + vals[8] + ' ' + vals[9];

                document.getElementById("dropuparea").value = area;
                document.getElementById("step1").style.display = 'none';
                document.getElementById("step2").style.display = 'none';
                document.getElementById("step3").style.display = 'none';
                document.getElementById("step4").style.display = 'block';
                document.getElementById("step5").style.display = 'none';
                document.getElementById("step6").style.display = 'none';
                document.getElementById("addressbook").style.display = 'none';
                return false;
            }

        }


    </script>

    <script type="text/javascript">
        function ValidateCheckBox(sender, args) {
            if (document.getElementById("CheckBox1").checked == true) {
                args.IsValid = true;
            } else {
                args.IsValid = false;
            }
        }
        function fnchange() {
            var aid = document.getElementById("pickuparea").value;
            $.ajax({
                url: "GetPincode.ashx",
                contentType: "application/text; charset=utf-8",
                data: {
                    'AreaId': aid
                },
                success: ppcode,
                error: pfail
            });
            return false;
        }
        function ppcode(result) {
            var pincode = result;
            document.getElementById("ppincode").value = pincode;
        }
        function pfail() {

        }
        function fndchange() {

            var aid = document.getElementById("dropuparea").value;
            $.ajax({
                url: "GetPincode.ashx",
                contentType: "application/text; charset=utf-8",
                data: {
                    'AreaId': aid
                },
                success: dpcode,
                error: dfail
            });
            return false;
        }
        function dpcode(result) {
            var pincode = result;
            document.getElementById("dpincode").value = pincode;
        }
        function dfail() {

        }
        function fncat() {
            var scat = document.getElementById("Service_Category").value;
            if (scat == 19) {
                document.getElementById("weight1").value = 0;
            }
            if (scat == 20) {
                document.getElementById("productvalue").value = "4500";
                document.getElementById("productvalue").disabled = true;
                document.getElementById("weight1").value = 0;
            }
            else {
                document.getElementById("productvalue").value = "";
                document.getElementById("productvalue").disabled = false;
            }
        }
        function fnrechange() {
            var scat = document.getElementById("ReturnServiceCategory").value;
            if (scat == 19) {

                document.getElementById("weight2").value = 0;
            }
            if (scat == 20) {
                document.getElementById("returnproductvalue").value = 4500;
                document.getElementById("returnproductvalue").disabled = true;
                document.getElementById("weight2").value = 0;
            }
            else {
                document.getElementById("returnproductvalue").value = "";
                document.getElementById("returnproductvalue").disabled = false;
            }


        }

        function fntime() {
            var i;
            for (i = pickuptime.options.length - 1; i >= 0; i--) {
                pickuptime.remove(i);
            }

            if (document.getElementById("taskdate").value == '') {
                alert('Please select Pickupdate 1st..');
            }
            else {

                var i;
                for (i = pickuptime.options.length - 1; i >= 0; i--) {
                    pickuptime.remove(i);
                }
                var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth() + 1; //January is 0!

                var yyyy = today.getFullYear();
                if (dd < 10) {
                    dd = '0' + dd
                }
                if (mm < 10) {
                    mm = '0' + mm
                }
                var today = dd + '/' + mm + '/' + yyyy;
                //alert(document.getElementById("taskdate").value);
                //alert(today);
                if (document.getElementById("taskdate").value == today) {
                    var today1 = new Date();
                    var hours = today1.getHours();

                    var ampm = hours >= 12 ? 'pm' : 'am';
                    //alert(hours + ampm);
                    $("#dvContent").append("<ul></ul>");
                    $.ajax({
                        type: "GET",
                        url: "TimeSlot.xml",
                        dataType: "xml",
                        success: function (xml) {
                            var select = document.getElementById("pickuptime");
                            var i = 0;
                            var option = document.createElement('option');
                            var i1;
                            for (i1 = pickuptime.options.length - 1; i1 >= 0; i1--) {
                                pickuptime.remove(i1);
                            }
                            $(xml).find('TIMESLOT').each(function () {
                                if (ampm == 'am') {
                                    var tim1 = $(this).find('FromToTimeSlot').text().split('.');
                                    //alert(tim[0]);
                                    var today2 = new Date();
                                    var hours1 = today2.getHours();
                                    //alert(hours1);
                                    if (tim1[0] > hours1) {

                                        var sValue = $(this).find('TimeSlotId').text();
                                        var sText = $(this).find('FromToTimeSlot').text();
                                        i = i + 1;
                                        var option1 = document.createElement('option');
                                        option1.text = sText;
                                        option1.value = sValue;
                                        select.add(option1, i);
                                    }
                                    if (parseInt($(this).find('TimeSlotId').text()) >= 21) {
                                        var sValue = $(this).find('TimeSlotId').text();
                                        var sText = $(this).find('FromToTimeSlot').text();
                                        i = i + 1;
                                        var option1 = document.createElement('option');
                                        option1.text = sText;
                                        option1.value = sValue;
                                        select.add(option1, i);
                                    }

                                }
                                if (ampm == 'pm') {
                                    var tim = $(this).find('FromToTimeSlot').text().split('.');
                                    //alert(tim[0]);
                                    var today1 = new Date();
                                    var hours = today1.getHours() - 12;
                                    if (parseInt($(this).find('TimeSlotId').text()) >= 21) {
                                        if (tim[0] > hours) {
                                            if (hours == 0) {
                                                var sValue = $(this).find('TimeSlotId').text();
                                                var sText = $(this).find('FromToTimeSlot').text();
                                                i = i + 1;
                                                var option1 = document.createElement('option');
                                                option1.text = sText;
                                                option1.value = sValue;
                                                select.add(option1, i);
                                            }
                                            else {
                                                if (parseInt($(this).find('TimeSlotId').text()) >= 25) {
                                                    var sValue = $(this).find('TimeSlotId').text();
                                                    var sText = $(this).find('FromToTimeSlot').text();
                                                    i = i + 1;
                                                    var option1 = document.createElement('option');
                                                    option1.text = sText;
                                                    option1.value = sValue;
                                                    select.add(option1, i);
                                                }
                                            }

                                        }
                                    }
                                }

                            });
                        },
                        error: function () {
                            alert("An error occurred while processing XML file.");
                        }
                    });
                }
                else {
                    //alert('Pre booked');
                    var i;
                    for (i = pickuptime.options.length - 1; i >= 0; i--) {
                        pickuptime.remove(i);
                    }
                    $("#dvContent").append("<ul></ul>");
                    $.ajax({
                        type: "GET",
                        url: "TimeSlot.xml",
                        dataType: "xml",
                        success: function (xml) {
                            var select = document.getElementById("pickuptime");
                            var i = 0;
                            var option = document.createElement('option');
                            $(xml).find('TIMESLOT').each(function () {

                                var sValue = $(this).find('TimeSlotId').text();
                                var sText = $(this).find('FromToTimeSlot').text();
                                i = i + 1;
                                var option1 = document.createElement('option');
                                option1.text = sText;
                                option1.value = sValue;
                                select.add(option1, i);
                            });
                        },
                        error: function () {
                            alert("An error occurred while processing XML file.");
                        }
                    });
                }
            }
        }
        function fnclear() {
            var i3;
            for (i3 = pickuptime.options.length - 1; i3 >= 0; i3--) {
                pickuptime.remove(i3);
            }
        }
    </script>



</head>

<body class="bg-img">
    <form id="Form1" name="form1" runat="server">
        <div id="home" class="bookaervice_banner">
            <div class="top-header">
                 <asp:HiddenField ID="hdnVcode" runat="server" />
                <div class="container">
                   <%-- <uc:Header ID="Header"
                        runat="server"
                        MinValue="1"
                        MaxValue="10" />--%>
                </div>
            </div>
            <div id="responsive_menu"></div>
            <div class="banner">
                <div class="container">
                </div>
            </div>
        </div>
        <div class="about"></div>

            <div class="container" style="height: auto;">
                <div class="row ">
                    <div class="col-md-12 text-center" id="diverror" runat="server" style="color: red"></div>
                </div>

                <div class="form-wrap">
                    <!-- Step 1 -->
                    <div class="float">
                        <div class="ribbon">
                            <h2>Step 1 of 6<span class="arrow"></span></h2>
                            <h1 class="orangebg" id="header_step1">TASK DETAIL <span class="pull-right"><i class="fa fa-pencil" onclick="ShowStep1()" style="cursor: pointer;"></i><i class="fa fa-check"></i></span></h1>

                            <%--<div class="loader"></div>--%>
                        </div>
                        <div class="float bodybg" id="step1">
                            <div class="fields">
                                <div class="screen1 mt20">
                                    <div id="dvContent" style="color: red; font-size: 10pt;">
                                    </div>
                                    <div class="float">
                                        <span class="left grey">What do you want us to deliver ?</span>
                                        <select name="Service_Category" id="Service_Category" class="form-control sp1" onchange="fncat()">
                                        </select>

                                    </div>

                                    <div class="float mt20">
                                        <span class="left grey">Give exact instructions.</span>
                                        <input type="text" class="form-control sp1" placeholder="" id="description" name="description" />

                                    </div>

                                    <div class="float mt20">
                                        <div class="left grid50 pr10 relative">
                                            <i class="fa fa-inr ico"></i>
                                            <input type="text" class="form-control relative" placeholder="7500000" onfocus="this.placeholder = ''" onblur="this.placeholder = '7500000'" id="productvalue" name="productvalue" onkeypress="return isNumber(event)" />
                                            <span class="left grey">Value of the parcel ?</span>
                                        </div>

                                        <div class="left grid50 pl10 relative">
                                            <i class="fa fa-balance-scale icon2"></i>
                                            <select class="form-control" id="weight1" name="weight1" style="padding-left: 35px;">
                                            </select>
                                            <span class="left grey">Weight</span>
                                        </div>
                                    </div>

                                    <div class="float mt20">
                                        <div class="left grid50 pr10 relative">
                                            <i class="fa fa-calendar ico"></i>
                                            <input readonly type="text" class="datepicker form-control" placeholder="dd/mm/yyyy" id="taskdate" name="taskdate" onchange="fntime()" />
                                            <span class="left grey">Pickup Date</span>
                                        </div>

                                        <div class="left grid50 pl10 relative">
                                            <i class="fa fa-clock-o icon2"></i>
                                            <select class="form-control" id="pickuptime" name="pickuptime">
                                            </select>
                                            <span class="left grey">Pickup time</span>
                                        </div>
                                    </div>

                                    <div class="float mt20">
                                        <div class="relative">
                                            <div class="count"></div>

                                            <button type="button" class="submit center-block" onclick="ShowStep2();">
                                                CONTINUE <i class="fa fa-angle-double-right"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!--fields-->
                        </div>
                        <!--panel body-->
                    </div>

                    <!-- Step 2 -->
                    <div class="float mt5">
                        <div class="float ribbon">
                            <h2>Step 2 of 6<span class="arrow"></span></h2>
                            <h1 class="greybg" id="header_step2">DELIVERY TYPE <span class="pull-right"><i class="fa fa-pencil" onclick="ShowStep2()" style="cursor: pointer;"></i><i class="fa fa-check"></i></span></h1>
                            <%--<div class="loader-2"></div>--%>
                        </div>
                        <div class="float bodybg" id="step2" style="display: none;">
                            <div class="fields text-center">
                                <div class="screen2 mt20">
                                    <div class="float text-center">
                                        <span class="text-center lightblack">What kind of a Delivery is this ?</span>
                                        <div style="margin-left: -10px;">
                                            <div class="left grid50 mt20">
                                                <button id="btnNormal" class="btn btn-default paddinglr9-60" onclick="ChangeNormalFlag()" style="background-color: #ee846a; color: #FFF;" type="button">NORMAL</button><p class="small text-center" style="margin-left: 2px; font-size: 8pt;">Delivery Within 2-4 Hours</p>
                                            </div>
                                            <div class="left grid50 mt20">
                                                <button id="btnExpress" class="btn btn-default paddinglr9-60" type="button" onclick="ChangeExpressFlag()">EXPRESS</button><p class="small text-center" style="margin-left: 2px; font-size: 8pt;">Delivered within 90 Minutes</p>
                                            </div>
                                        </div>
                                        <div class="left grid100 mt20" style="border-top: 1px solid #ccc; padding-top: 15px;">
                                            <button id="btnSingle" class="btn btn-default paddinglr9-60" type="button" onclick="HideReturn()">SINGLE</button><br />
                                            <button id="btnReturn" class="btn btn-default mt20 paddinglr9-60" type="button" onclick="ShowReturn()">RETURN</button>
                                        </div>
                                    </div>
                                    <!-- return -->
                                    <div class="float paddingtb-10 mt10" id="returndiv" style="display: none;">
                                        <div class="fields">
                                            <div class="screen1 mt20">
                                                <div class="float">
                                                    <span class="left grey">What are we suppose to bring back ?</span>
                                                    <select class="form-control sp1" name="ReturnServiceCategory" id="ReturnServiceCategory" onchange="fnrechange()">
                                                    </select>

                                                </div>
                                                <div class="float mt20">
                                                    <span class="left grey">Give exact instructions.</span>
                                                    <input type="text" class="form-control sp1" placeholder="" id="returndescription" name="returndescription" />

                                                </div>

                                                <div class="float mt20">
                                                    <div class="left grid50 pr10 relative">
                                                        <i class="fa fa-inr ico"></i>
                                                        <input type="text" class="form-control relative" value="0" placeholder="7500000" onfocus="this.placeholder = ''" onblur="this.placeholder = '7500000'" id="returnproductvalue" name="returnproductvalue" />
                                                        <span class="left grey">Value of the parcel</span>
                                                    </div>

                                                    <div class="left grid50 pl10 relative">
                                                        <i class="fa fa-balance-scale icon2"></i>
                                                        <select class="form-control" id="weight2" name="weight2">
                                                        </select>
                                                        <span class="left grey">Weight</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- return End -->

                                    <div class="float mt20">

                                        <input id="insuranceflag" type="hidden" runat="server" value="0" />
                                        <input id="returnflag" type="hidden" runat="server" value="0" />
                                        <input id="expressflag" type="hidden" runat="server" value="0" />
                                        <asp:HiddenField ID="hndcid" runat="server" Value="0" />
                                    </div>

                                    <div class="float mt20">
                                        <div class="relative">
                                            <div class="count"></div>
                                            <button type="button" class="submit center-block" onclick="ShowStep3()">
                                                CONTINUE <i class="fa fa-angle-double-right"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!--fields-->
                        </div>
                        <!--panel body-->
                    </div>
                    <!--panel-->

                    <!-- Step 3 -->
                    <div class="float mt5">
                        <div class="float ribbon">
                            <h2>Step 3 of 6<span class="arrow"></span></h2>
                            <h1 class="greybg" id="header_step3">PICKUP ADDRESS <span class="pull-right"><i class="fa fa-pencil" onclick="ShowStep3()" style="cursor: pointer;"></i><i class="fa fa-check"></i></span></h1>
                            <%--<div class="loader-4"></div>--%>
                        </div>

                        <div class="float bodybg" id="step3" style="display: none;">
                            <div class="fields">
                                <div class="screen3 mt20">
                                    <div class="float mt20 paddingb-5">
                                        <div class="left grid50 pr10 relative">
                                            <i class="fa fa-user ico"></i>
                                            <input type="text" class="form-control relative" id="pfirstname" name="pfirstname" placeholder="First Name.." onfocus="this.placeholder = ''" onblur="this.placeholder = 'First Name..'" />
                                        </div>

                                        <div class="left grid50 pr10 relative">
                                            <i class="fa fa-user ico"></i>
                                            <input type="text" class="form-control relative" id="plastname" name="plastname" placeholder="Last Name.." onfocus="this.placeholder = ''" onblur="this.placeholder = 'Last Name..'" />
                                        </div>
                                    </div>

                                    <div class="float paddingb-5">
                                        <div class="left grid50 pr10 relative">
                                            <i class="fa fa-phone ico"></i>
                                            <input type="text" class="form-control relative" placeholder="Phone No" id="pmobileno" maxlength="10" name="pmobileno" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone No'" onkeypress="return isNumber(event)" />
                                        </div>

                                        <div class="left grid50 pl10 relative">
                                            &nbsp;
                                        </div>
                                    </div>

                                    <div class="float">
                                        <div class="left grid100 relative">
                                            <i class="fa fa-home ico"></i>
                                            <input type="text" class="form-control relative" placeholder="Address" id="paddress" name="paddress" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Address'" />
                                        </div>
                                    </div>

                                    <div class="float mt20">
                                        <div class="left grid50 pr10 relative">
                                            <i class="fa fa-map-marker ico"></i>
                                            <input type="text" class="form-control relative" placeholder="Landmark" id="plandmark" name="plandmark" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Landmark'" />
                                        </div>

                                        <div class="left grid50 pl10 relative">
                                            <i class="fa fa-map-marker icon2"></i>
                                            <select class="form-control" id="pcity" name="pcity">
                                                <option value="1">Mumbai</option>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="float mt20">
                                        <div class="left grid50 pr10 relative">
                                            <i class="fa fa-map-marker ico"></i>
                                            <select class="form-control" id="pickuparea" name="pickuparea" onchange="fnchange();">
                                                <option value="0">Select Area</option>
                                            </select>
                                        </div>
                                        <div class="left grid50 pr10 relative">
                                            <i class="fa fa-map-marker icon2"></i>
                                            <input type="text" class="form-control" style="margin-left: 10px;" placeholder="Pincode" readonly="true" id="ppincode" maxlength="6" name="ppincode" onkeypress="return isNumber(event)" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Pincode'" />
                                        </div>

                                    </div>
                                    <div class="float mt20">
                                    </div>
                                    <div class="float mt20 paddingb-5">
                                        <div class="left grid50 pr10 relative">
                                            <button class="light-btn" type="button" onclick="ShowAddressBook('P')">Select Existing Address</button>
                                        </div>

                                        <div class="left grid50 pl10 relative">
                                            <button class="light-btn" style="padding-left: 53px; padding-right: 53px;" type="button" onclick="CleanPickUpSection()">New Address</button>
                                        </div>
                                    </div>

                                    <div class="float mt20">
                                        <div class="relative">
                                            <div class="count"></div>
                                            <button type="button" class="submit center-block" onclick="SavePickUpAddress()">CONTINUE <i class="fa fa-angle-double-right"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--fields-->
                        </div>
                        <!--panel body-->
                    </div>
                    <!-- Step 3 -->
                    <div class="float mt5" id="addressbook" style="display: none;">
                        <div class="float ribbon">
                            <h2>Step 3 of 6<span class="arrow"></span></h2>
                            <h1 class="greybg">ADDRESS BOOK<input id="AddressInitiateFlag" type="hidden" value="U" />
                                <span class="pull-right"><i class="fa fa-pencil" style="cursor: pointer;"></i><i class="fa fa-check"></i></span></h1>
                            <%--<div class="loader-5"></div>--%>
                        </div>
                        <div class="float bodybg sidebar">
                            <div class="float" id="addressplace" runat="server">

                                <%--<div class="row">
                                    <div class="col-md-7 col-md-offset-1 mt20 address">
                                        <h2 class="bold"><i class="fa fa-check"></i>Hari Parasad Mittal | Mob No : +91 123457891</h2>
                                        <h3>502 / Lorem Lipsum Dolor Is Dummy Text , Lorem Lipsum Dolor Is Dummy Text.</h3>
                                        <h3>Mumbai - 400050.</h3>
                                        <div class="col-md-12">
                                            <button class="btn-gray mt10" type="button">Use This Address</button>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <span><i class="fa fa-trash-o"></i>Remove</span>
                                        <span><i class="fa fa-pencil"></i>Edit</span>
                                    </div>
                                </div>--%>
                            </div>
                            <!--fields-->
                        </div>
                        <!--panel body-->
                    </div>

                    <!-- Step 4 -->
                    <div class="float mt5">
                        <div class="float ribbon">
                            <h2>Step 4 of 6<span class="arrow"></span></h2>
                            <h1 class="greybg" id="header_step4">DROP ADDRESS <span class="pull-right"><i class="fa fa-pencil" onclick="ShowStep4()" style="cursor: pointer;"></i><i class="fa fa-check"></i></span></h1>
                            <%--<div class="loader-4"></div>--%>
                        </div>

                        <div class="float bodybg sidebar" id="step4" style="display: none;">
                            <div class="fields">
                                <div class="screen3 mt20">
                                    <div class="float mt20 paddingb-5">
                                        <div class="left grid50 pr10 relative">
                                            <i class="fa fa-user ico"></i>
                                            <input type="text" class="form-control relative" id="dfirstname" name="dfirstname" placeholder="First Name.." onfocus="this.placeholder = ''" onblur="this.placeholder = 'First Name..'" />
                                        </div>

                                        <div class="left grid50 pr10 relative">
                                            <i class="fa fa-user ico"></i>
                                            <input type="text" class="form-control relative" id="dlastname" name="dlastname" placeholder="Last Name.." onfocus="this.placeholder = ''" onblur="this.placeholder = 'Last Name..'" />
                                        </div>
                                    </div>

                                    <div class="float paddingb-5">
                                        <div class="left grid50 pr10 relative">
                                            <i class="fa fa-phone ico"></i>
                                            <input type="text" class="form-control relative" id="dmobileno" name="dmobileno" placeholder="Phone No" maxlength="10" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone No'" onkeypress="return isNumber(event)" />
                                        </div>

                                        <div class="left grid50 pl10 relative">
                                            &nbsp;
                                        </div>
                                    </div>

                                    <div class="float">
                                        <div class="left grid100 relative">
                                            <i class="fa fa-home ico"></i>
                                            <input type="text" class="form-control relative" id="daddress" name="daddress" placeholder="Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Address'" />
                                        </div>
                                    </div>

                                    <div class="float mt20">
                                        <div class="left grid50 pr10 relative">
                                            <i class="fa fa-map-marker ico"></i>
                                            <input type="text" class="form-control relative" id="dlandmark" name="dlandmark" placeholder="Landmark" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Landmark'" />
                                        </div>

                                        <div class="left grid50 pl10 relative">
                                            <i class="fa fa-map-marker icon2"></i>
                                            <select class="form-control" id="dcity" name="dcity">
                                                <option value="1">Mumbai</option>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="float mt20">
                                        <div class="left grid50 pr10 relative">
                                            <i class="fa fa-map-marker ico"></i>
                                            <select class="form-control" id="dropuparea" name="dropuparea" onchange="fndchange()">
                                                <option value="0">Select Area</option>

                                            </select>
                                        </div>
                                        <div class="left grid50 pr10 relative">
                                            <i class="fa fa-map-marker ico"></i>
                                            <input type="text" class="form-control" placeholder="Pincode" id="dpincode" readonly="true" name="dpincode" maxlength="6" onkeypress="return isNumber(event)" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Pincode'" />
                                        </div>

                                    </div>

                                    <div class="float mt20">

                                        <div class="left grid50 pl10 relative">
                                            <i class="fa fa-clock-o icon2" style="display: none"></i>
                                            <select class="form-control" id="dropuptime" name="dropuptime" style="display: none">
                                            </select>
                                        </div>

                                    </div>
                                    <div class="float mt20 paddingb-5">
                                        <div class="left grid50 pr10 relative">
                                            <button class="light-btn" type="button" onclick="ShowAddressBook('D')">Select Existing Address</button>
                                        </div>

                                        <div class="left grid50 pl10 relative">
                                            <button class="light-btn" type="button" onclick="CleanDropUpSection()">New Address</button>
                                        </div>
                                    </div>

                                    <div class="float mt20">
                                        <div class="relative">
                                            <div class="count"></div>
                                            <button type="button" class="submit center-block" onclick="SaveDropOffAddress()">CONTINUE <i class="fa fa-angle-double-right"></i></button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!--fields-->
                        </div>
                        <!--panel body-->
                    </div>


                    <!-- Payment -->

                    <!-- Step 5 -->
                    <div class="float mt5">
                        <div class="float ribbon">
                            <h2>Step 5 of 6<span class="arrow"></span></h2>
                            <h1 class="greybg" id="header_step5">PAYMENT SUMMARY  <span class="pull-right"><i class="fa fa-pencil" onclick="ShowStep5()" style="cursor: pointer;"></i><i class="fa fa-check"></i></span></h1>
                            <%--<div class="loader-6"></div>--%>
                        </div>
                        <div class="float bodybg sidebar" id="step5" style="display: none;">
                            <div class="total">

                                <div class="float address text-center mt10 border-b">
                                    <%--<div class="left grid50 pr10 relative">
<h2>Invoice No : <strong>5498055</strong></h2>
</div> 
<div class="left grid50 pr10 relative">
<h2>Date : 09 Jan 2016</h2>
</div> --%>
                                    <div class="col-md-12">
                                        <h4>Total Amount : <strong><span class="fa fa-rupee"></span>&nbsp; <span id="maintotalFee" runat="server">0.00</span></strong></h4>
                                    </div>
                                </div>

                                <div class="float address border-b">
                                    <div class="col-md-4 col-md-offset-3 col-xs-7">
                                        <div>
                                            <h2 class="width60">Service fee </h2>
                                            <h2 class="width60" id="insurance_head" style="display: none;">Insurance </h2>
                                            <%--<h2 class="bold" id="additional_transport_head" style="display:none;">Additional Transport Fee* </h2>--%>
                                            <h2 class="width60" id="cash_handling_head">Cash Handling </h2>
                                            <h2 class="width60" id="access_baggage_head">Excess Baggage</h2>
                                        </div>
                                    </div>
                                    <div class="col-md-5 col-xs-5">
                                        <div>
                                            <h2>: <span class="fa fa-rupee"></span><span id="taskFee">
                                                <input class="width40" type="text" id="taskfee_data" value="0" readonly="true" runat="server" style="border: none;" /></span></h2>
                                            <h2 id="insurance_value" style="display: none;">: <span class="fa fa-rupee"></span><span id="inusranceFee">
                                                <input class="width40" type="text" id="insure_data" value="0" readonly="true" runat="server" style="border: none;" /></span></h2>
                                            <%--<h2  id="additional_transport_value" style="display:none;">: <span class="fa fa-rupee" ></span> 250.00</h2>--%>
                                            <h2 id="cash_handling_value">: <span class="fa fa-rupee"></span><span id="cashhandlingFee">
                                                <input class="width40" type="text" id="cash_data" value="0" readonly="true" runat="server" style="border: none;" /></span></h2>
                                            <h2 id="access_baggage_value">: <span class="fa fa-rupee"></span><span id="accessbaggageFee">
                                                <input class="width40" type="text" id="access_baggage_data" value="0" readonly="true" runat="server" style="border: none;" /></span></h2>
                                        </div>
                                    </div>
                                </div>
                                <div class="float address border-b">
                                    <div class="col-md-4 col-md-offset-3 col-xs-7">
                                        <div class="width60">
                                            <h2>Sub Total </h2>
                                            <h2>Discount </h2>
                                        </div>
                                    </div>
                                    <div class="col-md-5 col-xs-5">
                                        <div>
                                            <h2>: <span class="fa fa-rupee"></span>
                                                <input class="width40" type="text" id="subtotalFeeval" value="0" readonly="true" runat="server" style="border: none;" />
                                            </h2>
                                            <h2 id="discountvalue">: <span class="fa fa-rupee"></span><span id="discountFee">0.00</span></h2>
                                        </div>
                                    </div>
                                </div>
                                <!-- promo code-->
                                <div class="float address border-b" style="display: none;">
                                    <div class="col-md-4 col-md-offset-2">
                                        <div style="float: left;">
                                            <h2 class="left" style="margin-left: 13px;">Insurance 
                                                <div id="popup">
                                                    <i class="fa fa-info-circle"></i>
                                                    <div id="popup-body">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</div>
                                                </div>
                                            </h2>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div style="float: right;">
                                            <button id="btninsureYes" type="button" onclick="ChangeinsureYes()" class="btn btn-default" style="padding-left: 20px; padding-right: 20px;">Yes</button>
                                            <button id="btninsureNo" type="button" onclick="ChangeinsureNo()" class="btn btn-default" style="padding-left: 20px; padding-right: 20px;">No</button>
                                        </div>
                                        <!-- <div class="switch">
                                                <input id="chkInsurance" class="cmn-toggle cmn-toggle-yes-no" type="checkbox" onchange="RequestQuoteFunction()">
                                                <label for="chkInsurance" data-on="Yes" data-off="No"></label>
                                            </div>-->

                                    </div>
                                </div>
                                <div class="float address border-b">
                                    <div class="col-md-4 col-md-offset-3 col-xs-4">
                                        <div class="promohead">
                                            <h2 class="left">Promo Code </h2>
                                        </div>
                                    </div>
                                    <div class="col-md-5 col-xs-8">
                                        <div>
                                            <div class="input-group input-group-sm stylish-input-group">
                                                <input type="text" class="form-control" id="promocode" name="promocode" runat="server"><a class="input-group-addon" onclick="RequestQuoteFunction()" style="cursor: pointer;">
Apply</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">

                                        <button type="button" class="submit center-block" onclick="ShowStep6()">CONTINUE <i class="fa fa-angle-double-right"></i></button>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <!--fields-->
                    </div>

                    <!--panel body-->

                    <!-- Step 6 -->
                    <div class="float mt5 mb10">
                        <div class="float ribbon">
                            <h2>Step 6 of 6<span class="arrow"></span></h2>
                            <h1 class="greybg" id="header_step6">Payment <span class="pull-right"><i class="fa fa-pencil" onclick="ShowStep6()" style="cursor: pointer;"></i><i class="fa fa-check"></i></span></h1>

                        </div>
                        <div class="float bodybg sidebar" id="step6" style="display: none;">
                            <div>
                                <div class="row">
                                    <div class="col-md-12 text-right">
                                        <h5 style="text-align: right; display: inline-grid; white-space: nowrap;">HOW WOULD YOU LIKE TO PAY : <span class="lightblack"><span class="fa fa-rupee"></span>
                                            <input id="txtFinalTotal" type="text" value="0" readonly="true" style="border: none; padding-top: 5px;" /></span></h5>

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="row">
                                        <div class="col-md-12 radio-style text-left mb20" style="margin-top: 15px;">
                                            <div class="col-md-2 col-md-offset-2 col-xs-3">
                                                <span class="lightblack">CASH</span>
                                            </div>
                                            <div class="col-md-3 col-xs-5">
                                                <h5 style="margin-left: 15px;">
                                                    <input class="hide-radio" name="check" type="radio" id="chkPickUp" value="Pickup Point" runat="server" />
                                                    <label for="chkPickUp">Pickup</label></h5>
                                            </div>
                                            <div class="col-md-3 col-xs-4">
                                                <h5 class="mb10">
                                                    <input name="check" class="hide-radio" type="radio" id="chkDrop" value="Drop of  Point" runat="server" />
                                                    <label for="chkDrop">Drop</label></h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 radio-style text-left mb20">
                                            <div class="col-md-2 col-md-offset-2 col-xs-3">
                                                <span class="lightblack mb10">CARD</span>
                                            </div>
                                            <div class="col-md-3 col-xs-5">
                                                <h5 style="margin-left: 15px;">
                                                    <input class="hide-radio" name="check" type="radio" id="chkDebit" value="Debite Card" runat="server" />
                                                    <label for="chkDebit">Debit</label>
                                                </h5>
                                            </div>
                                            <div class="col-md-3 col-xs-4">
                                                <h5>
                                                    <input class="hide-radio" name="check" type="radio" id="chkCredit" value="Credit Card" runat="server" />
                                                    <label for="chkCredit">Credit</label></h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 radio-style text-left m20">
                                            <div class="col-md-2 col-md-offset-2 col-xs-3">
                                                <span class="lightblack mb10">WALLET</span>
                                            </div>
                                            <div class="col-md-3 col-xs-4">
                                                <h5 style="margin-left: 15px;">
                                                    <input class="hide-radio" name="check" type="radio" id="chkwall" value="From E-wallet" runat="server" />
                                                    <label for="chkwall">Rs: <b id="walletbalance" runat="server">270.00</b></label>
                                                </h5>
                                                <input runat="server" id="wallbal" visible="false" value="0" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="float paddingtb-15">
                                <h4 class="bdr-text">Terms &amp; Condition</h4>
                                <div class="terms-block">
                                    <div class="block-1">
                                        <ul class="text-left list-text paddingtb-10">
                                            <li>If the task is cancelled 2 hours prior the pickup time. Cancellation fee of RS 100 would be applicable.</li>
                                            <li>Please note that our executive is allowed to wait 15 minutes on arrival at the pick-up or the drop location and after 15 minutes, waiting charges will be applicable of Rs.100/- per   30 minutes.</li>
                                            <li>If the parcel exceeds 5kgs an excess baggage fee of Rs.100 will be charged.</li>

                                            <%-- <li>Lorem Lipsum Dolor Is Dummy Text Lorem Lipsum Dolor Is Dummy Text Text Lorem Lipsum Dolor Is.</li>
                                            <li>Lorem Lipsum Dolor Is Dummy Text Lorem Lipsum Dolor Is Dummy Text Text Lorem Lipsum Dolor Is.</li>
                                            <li>Lorem Lipsum Dolor Is Dummy Text Lorem Lipsum Dolor Is Dummy Text Text Lorem Lipsum Dolor Is.</li>
                                            <li>Lorem Lipsum Dolor Is Dummy Text Lorem Lipsum Dolor Is Dummy Text Text Lorem Lipsum Dolor Is.</li>
                                            <li>Lorem Lipsum Dolor Is Dummy Text Lorem Lipsum Dolor Is Dummy Text Text Lorem Lipsum Dolor Is.</li>
                                            <li>Lorem Lipsum Dolor Is Dummy Text Lorem Lipsum Dolor Is Dummy Text Text Lorem Lipsum Dolor Is.</li>
                                            <li>Lorem Lipsum Dolor Is Dummy Text Lorem Lipsum Dolor Is Dummy Text Text Lorem Lipsum Dolor Is.</li>
                                            <li>Lorem Lipsum Dolor Is Dummy Text Lorem Lipsum Dolor Is Dummy Text Text Lorem Lipsum Dolor Is.</li>
                                            <li>Lorem Lipsum Dolor Is Dummy Text Lorem Lipsum Dolor Is Dummy Text Text Lorem Lipsum Dolor Is.</li>--%>
                                        </ul>
                                    </div>
                                </div>
                                <div class="left mt5">
                                    &nbsp;&nbsp;<asp:CheckBox ID="CheckBox1" runat="server" Checked="true" />
                                    <div class="right" style="margin-left: 5px;">Yes, I Agree With  <a href="#">Terms &amp; Conditions</a></div>
                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" class="text-right" ForeColor="Red" Font-Bold="true" ErrorMessage="* Required" ClientValidationFunction="ValidateCheckBox"></asp:CustomValidator><br />
                                </div>

                            </div>
                            <div class="float mb10">
                                <hr />
                                <%--<button class="btn-blue center-block" type="button" runat="server" id="btnSubmit">MAKE PAYMENT &amp; PLACE ORDER</button>--%>
                                <asp:Button class="btn-blue center-block" type="button" runat="server" ID="btnSubmit" Text="BOOK TASK" OnClick="btnSubmit_Click"  />
                            </div>

                        </div>
                        <!--fields-->
                    </div>
                    <div style="width: 1px; height: 1px; overflow: auto;">
                        <asp:TextBox ID="txtinsid" runat="server" ClientIDMode="Static"></asp:TextBox>
                        <asp:TextBox ID="txttaskfee" runat="server" ClientIDMode="Static"></asp:TextBox>
                        <asp:TextBox ID="txtbag" runat="server" ClientIDMode="Static"></asp:TextBox>
                        <asp:TextBox ID="txtttl" runat="server" ClientIDMode="Static"></asp:TextBox>
                        <asp:TextBox ID="txtwall" runat="server" ClientIDMode="Static"></asp:TextBox>
                        <asp:TextBox ID="txtcid" runat="server"></asp:TextBox>
                        <asp:TextBox ID="txtoutstanding" runat="server" value="0"></asp:TextBox>
                    </div>



                </div>
            </div>
            <div id="includedContent2">
                <%--<fc:Footer ID="Footer1"
                    runat="server"
                    MinValue="1"
                    MaxValue="10" />--%>

            </div>
            

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

            <script type="text/javascript">
                $('#popoverData').popover();
                $('#popoverOption').popover({ trigger: "hover" });
            </script>

            <!-- datepicker -->
            <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
            <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
            <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
            <script>
                $(function () {
                    $(".datepicker").datepicker();
                    $(".datepicker").datepicker({
                        dateFormat: "dd-mm-yy"
                    });

                    var dateFormat = $(".datepicker").datepicker("option", "dateFormat");
                    $(".datepicker").datepicker("option", "dateFormat", "dd/mm/yy");
                });
            </script>
            <script>
                [].forEach.call(document.querySelectorAll('.hide-radio'), function (element) {
                    element.style.display = 'none';
                });</script>
    </form>

</body>

</html>
