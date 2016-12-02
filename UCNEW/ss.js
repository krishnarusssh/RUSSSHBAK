    $("#calcweight").slider();
    $("#calcweight").on("slide", function (slideEvt) {
        $("#ex3SliderVal").text(slideEvt.value);
    });
    $("#calc1weight1").slider();
    $("#calc1weight1").on("slide", function (slideEvt1) {
        $("#ex3SliderVal1").text(slideEvt1.value);
    });

    function fnCalculate() {
        $("#error").text("");
        var ttype = '';
        var dtype = '';
        var taskcat = '';
        var pval = '';
        var rpval = '';
        var tdate = '';
        var weight = '';
        var weight1 = '';
        var rtaskcat = '';
        var pareaid = '';
        var dareaid = '';

        if (!$("input[name='selector']:checked").val()) {
            // alert('Select Task Type.');
            $("#error").text("Select Task Type.");
            return false;
        }
        else {
            ttype = $("input[name='selector']:checked").val();
        }
        if (!$("input[name='delivery']:checked").val()) {
            // alert('Select Delivery.');
            $("#error").text("Select Delivery.");
            return false;
        }
        else {
            dtype = $("input[name='delivery']:checked").val();
        }

        if ($('#cash1').prop('checked')) {
            taskcat = 19;
        }
        else {

            taskcat = 1;
        }
        if ($('#cash2').prop('checked')) {
            rtaskcat = 19;
        }
        else {
            rtaskcat = 1;
        }
        pval = $("#pval").val();
        if (pval == '') {
            $("#error").text("Enter Product Value.");
            return false;
        }

        weight = $('#ex3SliderVal').text();

        if (weight == '') {
            $("#error").text("Enter Product Weight.");
            return false;
        }
        if (ttype == 'Return') {
            rpval = $("#rpval").val();
            if (rpval == '') {
                $("#error").text("Enter Return Product Value.");
                return false;
            }

            weight1 = $("#ex3SliderVal1").text();

            if (weight1 == '') {
                $("#error").text("Enter Return Product Weight.");
                return false;
            }
        }
        //alert($("#tdate").val());
        tdate = $("#tdate").val();
        if (tdate == '') {
            $("#error").text("Please Select Date .");
            return false;
        }
        pareaid = $('#parea').val();
        dareaid = $('#darea').val();
        if (pareaid == 0) {
            $("#error").text("Please Select PickupArea .");
            return false;
        }
        if (dareaid == 0) {
            $("#error").text("Please Select DropArea .");
            return false;
        }
        var wprice = 0;
        if (weight > 0 && weight <= 5) {
            wprice = 0;
        }
        if (weight > 5 && weight <= 10) {
            wprice = 100;
        }
        if (weight > 10 && weight <= 15) {
            wprice = 200;
        }
        if (weight > 15 && weight <= 20) {
            wprice = 300;
        }
        if (weight > 20 && weight <= 25) {
            wprice = 400;
        }

        if (weight > 25 && weight <= 30) {
            wprice = 500;
        }

        var rwprice = 0;
        if (weight1 > 0 && weight1 <= 5) {
            rwprice = 0;
        }
        if (weight1 > 5 && weight1 <= 10) {
            rwprice = 100;
        }
        if (weight1 > 10 && weight1 <= 15) {
            rwprice = 200;
        }
        if (weight1 > 15 && weight1 <= 20) {
            rwprice = 300;
        }
        if (weight1 > 20 && weight1 <= 25) {
            rwprice = 400;
        }

        if (weight1 > 25 && weight1 <= 30) {
            rwprice = 500;
        }
        /// Call Api

        $.ajax({
            url: "../../BookTask/Test.ashx",
            contentType: "application/text; charset=utf-8",
            data: {
                'SERVICECATEGORY': taskcat,
                'PRODUCTVALUE': pval,
                'PRODUCTWEIGHT': wprice,
                'RETURNSERVICECATEGORY': rtaskcat,
                'RETURNPRODUCTVALUE': rpval,
                'RETURNPRODUCTWEIGHT': rwprice,
                'PICKUPAREAID': pareaid,
                'PICKUPCITYID': 1,
                'DROPOFFAREAID': dareaid,
                'DROPOFFCITYID': 1,
                'PAYMENTMODE': 0,
                'APPLYINSURANCE': 0,
                'PROMOCODE': 0,
                'TASKDATE': tdate,
                'ISEXPRESS': dtype,
                'TASKMODE': ttype
            },
            success: function OnComplete(result) {

                var values = result.split(',');
                var taskfee = values[0];
                var excessbaggage = values[1];
                var insurancef = values[2];
                var promoc = values[3];
                var total = values[4];


                // document.getElemntById("tasktotal").text = total;
                //$("#tasktotal").text(total);
                $("#tasktotal").html(total);
            },
            error: OnFail
        });
        return false;
    }
    //$('#cash1').click(function () {
    //    if ($('#cash1').attr('checked')) {
    //        alert('19');
    //    } else { alert('1'); }
    //});
    function OnFail(result) {
        alert('Request Failed');
    }


    function isNumber(evt) {
        evt = (evt) ? evt : window.event;
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
        return true;
    }
    $(document).ready(function () {

        $("#tdate").datepicker("option", "minDate", 0);
        $("#dvContent").append("<ul></ul>");
        $.ajax({
            type: "GET",
            url: "../../BookTask/Areas.xml",
            dataType: "xml",
            success: function (xml) {
                var select = document.getElementById("darea");
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


        $("#dvContent").append("<ul></ul>");

        $.ajax({
            type: "GET",
            url: "../../BookTask/Areas.xml",
            dataType: "xml",
            success: function (xml) {
                var select = document.getElementById("parea");
                var innerstr = '';
                //var clientid = $('#txtcid').val();
                //alert(clientid);
                var i = 0;
                var option = document.createElement('option');
                $(xml).find('AREAS').each(function () {

                    var sValue = $(this).find('Area_ID').text();
                    var sText = $(this).find('Area_Name').text();
                    i = i + 1;
                    var option = document.createElement('option');
                    option.text = sText;
                    option.value = sValue;
                    select.add(option, i);
                 // innerstr = innerstr + '<option value=' + sValue + '>' + sText + '</option>';
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
            url: "../../BookTask/Areas.xml",
            dataType: "xml",
            success: function (xml) {
                var select = document.getElementById("darea");
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

    });

