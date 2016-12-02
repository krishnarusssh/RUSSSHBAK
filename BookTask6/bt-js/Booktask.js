
var unavailableDates = ["24-10-2016"];
function unavailable(date) {
    dmy = date.getDate() + "-" + (date.getMonth() + 1) + "-" + date.getFullYear();
    if ($.inArray(dmy, unavailableDates) < 0) {
        return [true, "", "Book Now"];
    } else {
        return [false, "", "Booked Out"];
    }
}
$(function () {
    $('.image-editor').cropit();
    $('form').submit(function () {
        var imageData = $('.image-editor').cropit('export');
        $('.hidden-image-data').val(imageData);
        var formValue = $(this).serialize();
        $('#result-data').text(formValue);
        return false;
    });
    $(".datepicker1").datepicker({
        dateFormat: "MM dd yyyy",
        language: "en",
        // dateFormat: "dd/mm/yy",
        minDate: new Date(),
        onSelect: function (date) {
            if (date !== "") {
                //alert('chk date'+date);
                var dateObject = new Date(date);
                var daydate = dateObject.getDate();
                if (daydate < 10)
                {
                    daydate = '0' + daydate;
                }
                ObjBook.tdate = daydate + '/' + (dateObject.getMonth() + 1) + '/' + dateObject.getFullYear();
               
                $('#tdate').addClass("date-selected").removeClass("form-control").css("margin-bottom", "22px");
                $(".time-container").fadeIn("slow").css({ "display": "block" }).addClass("time-container-relative");
                $(".datepickers-container").css("display", "none");
                $(".close-icon").css("display", "block");
                fntime();
            }
        }
    });

    $.ajax({

        type: "GET",
        url: "XML/Areas.xml",
        dataType: "xml",
        success: function (xml) {
            //alert('fill area');
            var select = document.getElementById("ddlarea");
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

});

function fntime() {

    if (document.getElementById("tdate").value == '') {
       //  alert('Please select Pickupdate 1st..');
    }
    else {
        var today = new Date();
        var tdate = today.toDateString().substring(4, 15);
        if (document.getElementById("tdate").value == tdate) {
            var today1 = new Date();
            var hours = today1.getHours();
            var ampm = hours >= 12 ? 'pm' : 'am';
            //alert(hours + ampm);
            $("#dvContent").append("<ul></ul>");
            $.ajax({
                type: "GET",
                url: "XML/TimeSlot.xml",
                dataType: "xml",
                success: function (xml) {
                    var DivData = "";
                    var i = 0;

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
                                DivData = DivData + "<div class='col-md-6 col-xs-6'><p class='timetxt time' id='" + sValue + "'>" + sText + "</p></div>";
                            }
                            if (parseInt($(this).find('TimeSlotId').text()) >= 21) {
                                var sValue = $(this).find('TimeSlotId').text();
                                var sText = $(this).find('FromToTimeSlot').text();
                                i = i + 1;
                                DivData = DivData + "<div class='col-md-6 col-xs-6'><p class='timetxt time' id='" + sValue + "'>" + sText + "</p></div>";
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
                                        DivData = DivData + "<div class='col-md-6 col-xs-6'><p class='timetxt time' id='" + sValue + "'>" + sText + "</p></div>";
                                    }
                                    else {
                                        if (parseInt($(this).find('TimeSlotId').text()) >= 25) {
                                            var sValue = $(this).find('TimeSlotId').text();
                                            var sText = $(this).find('FromToTimeSlot').text();
                                            i = i + 1;
                                            DivData = DivData + "<div class='col-md-6 col-xs-6'><p class='timetxt time' id='" + sValue + "'>" + sText + "</p></div>";
                                        }
                                    }

                                }
                            }
                        }

                    });
                    document.getElementById("DivTime").innerHTML = DivData;
                },
                error: function () {
                    alert("An error occurred while processing XML file.");
                }
            });
        }
        else {
            //alert('Pre booked');
            var i;
            var DivData = "";
            $("#dvContent").append("<ul></ul>");
            $.ajax({
                type: "GET",
                url: "XML/TimeSlot.xml",
                dataType: "xml",
                success: function (xml) {
                    $(xml).find('TIMESLOT').each(function () {
                        var sValue = $(this).find('TimeSlotId').text();
                        var sText = $(this).find('FromToTimeSlot').text();
                        i = i + 1;
                        DivData = DivData + "<div class='col-md-6 col-xs-6'><p class='timetxt time' id='" + sValue + "'>" + sText + "</p></div>";
                    });
                    document.getElementById("DivTime").innerHTML = DivData;
                },
                error: function () {
                    alert("An error occurred while processing XML file.");
                }
            });
        }
    }
}

///var ObjBook = { tdate: "", ptime: "", cat: "", pval: "", weight: "", padd: "", dadd: "", rcat: "", rval: "", rweight: "", isexpress: "", ttype: "Single", des: "", rdes: "" };
function validatedetail() {
    if (ObjBook.ttype == 'Single') {
        if (ObjBook.tdate == '') {

            $('#msgalert').text("Please Select Task Date.");
            document.querySelector('.notify-trigger').click();
            return false;
        }
        if (ObjBook.ptime == '') {
            $('#msgalert').text("Please Select Pickup Time.");
            document.querySelector('.notify-trigger').click();
            return false;
        }
        if (ObjBook.cat == '') {
            $('#msgalert').text("Please Select Category.");
            document.querySelector('.notify-trigger').click();
            return false;
        }
        if (ObjBook.pval == '') {
            $('#msgalert').text("Please Enter Product Value.");
            document.querySelector('.notify-trigger').click();
            return false;
        }
        if (ObjBook.weight == '') {
            $('#msgalert').text("Please Select Weight of Product .");
            document.querySelector('.notify-trigger').click();
            return false;
        }
        if (ObjBook.padd == '') {
            $('#msgalert').text("Please Select Pickup Address.");
            document.querySelector('.notify-trigger').click();
            return false;
        }
        if (ObjBook.dadd == '') {
            $('#msgalert').text("Please Select Drop Address.");
            document.querySelector('.notify-trigger').click();
            return false;
        }
        if (ObjBook.des == '') {
            $('#msgalert').text("Please Enter Product Description.");
            document.querySelector('.notify-trigger').click();
            return false;
        }
    }
    else if (ObjBook.ttype == 'Return') {
        if (ObjBook.tdate == '') {
            $('#msgalert').text("Please Select Task Date.");
            document.querySelector('.notify-trigger').click();
            return false;
        }
        if (ObjBook.ptime == '') {
            $('#msgalert').text("Please Select Pickup Time.");
            document.querySelector('.notify-trigger').click();
            return false;
        }
        if (ObjBook.cat == '') {
            $('#msgalert').text("Please Select Category.");
            document.querySelector('.notify-trigger').click();
            return false;
        }
        if (ObjBook.pval == '') {
            $('#msgalert').text("Please Enter Product Value.");
            document.querySelector('.notify-trigger').click();
            return false;
        }
        if (ObjBook.weight == '') {
            $('#msgalert').text("Please Select Weight of Product .");
            document.querySelector('.notify-trigger').click();
            return false;
        }
        if (ObjBook.padd == '') {
            $('#msgalert').text("Please Select Pickup Address.");
            document.querySelector('.notify-trigger').click();
            return false;
        }
        if (ObjBook.dadd == '') {
            $('#msgalert').text("Please Select Drop Address.");
            document.querySelector('.notify-trigger').click();
            return false;
        }
        if (ObjBook.des == '') {
            $('#msgalert').text("Please Enter Product Description.");
            document.querySelector('.notify-trigger').click();
            return false;
        }
        if (ObjBook.rcat == '0') {
            $('#msgalert').text("Please Return Category.");
            document.querySelector('.notify-trigger').click();
            return false;
        }
        if (ObjBook.rval == '0') {
            $('#msgalert').text("Please Enter Return Product Value.");
            document.querySelector('.notify-trigger').click();
            return false;
        }
        if (ObjBook.rweight == '0') {
            $('#msgalert').text("Please Enter Return Product Weight.");
            document.querySelector('.notify-trigger').click();
            return false;
        }
        if (ObjBook.rdes == '0') {
            $('#msgalert').text("Please Enter Return Product Description.");
            document.querySelector('.notify-trigger').click();
            return false;
        }
    }
    return true;
}
function FillAdd(elm) {
    var addressline = $(elm).attr('data-id');
    var alldata = $(elm).attr('data-id')
    var values = addressline.split('^');
    var addid = values[0];
    var Name = values[1];
    var mobile = values[2];
    var aline = values[3];
    var landmark = values[4];
    var area = values[5];
    var pincode = values[6];
    var aid = values[7];
    var fname = Name;
    var lname = values[8];
    var _cat = values[9];
    var _lable = values[10];
    $("#t" + _cat).click();
    var ddlareaelm = document.getElementById('ddlarea');
    ddlareaelm.value = aid;
    $('#fname').val(fname);
    $('#lname').val(lname);
    $('#mno').val(mobile);
    $('#aaddress').val(aline);
    $('#landmark').val(landmark);
    $('#addid').val(addid);
    $('#lbladd').val(_lable);
}
function fnclearadd() {
    var ddlareaelm = document.getElementById('ddlarea');
    ddlareaelm.value = 0;
    $('#fname').val('');
    $('#lname').val('');
    $('#mno').val('');
    $('#aaddress').val('');
    $('#landmark').val('');
    $('#addid').val('');
    $('#lbladd').val('');
    $("#address").modal('show');
}
function fnsaveadd() {
    var aid = $('#addid').val();
    var ClientId = '<%= Session["CLIENT_ID"] %>';
    var fname = $('#fname').val();
    var lastname = $('#lname').val();
    var mobileno = $('#mno').val();
    var Address = $('#aaddress').val();
    var landmark = $('#landmark').val();
    var cityname = $('#ddlcity').innerText;
    var areaname = $("#ddlarea option:selected").text();;

    var pcode = 0;
    var IsFlagFav = 'N';
    var cat = $('#addtype').val();
   // alert(cat);
    var own = $('#lbladd').val();
    var city = $('#ddlcity').val();
    var area = $('#ddlarea').val();
    if (chkadd()) {
        DataSave(aid, ClientId, fname, ' ' + lastname, mobileno, Address, landmark, "Mumbai", areaname, pcode, IsFlagFav, cat, own, city, area);
    }
}
function chkadd() {
    if ($('#fname').val() == '') {
        $('#msgalert').text("Please Enter First Name.");
        document.querySelector('.notify-trigger').click();
        return false;
    }
    if ($('#lname').val() == '') {
        $('#msgalert').text("Please Enter Last Name.");
        document.querySelector('.notify-trigger').click();
        return false;
    }
    if ($('#mno').val() == '') {
        $('#msgalert').text("Please Enter Number.");
        document.querySelector('.notify-trigger').click();
        return false;
    }
    if ($('#aaddress').val() == '') {
        $('#msgalert').text("Please Enter Address.");
        document.querySelector('.notify-trigger').click();
        return false;
    }
    if ($('#landmark').val() == '') {
        $('#msgalert').text("Please Enter Landmark.");
        document.querySelector('.notify-trigger').click();
        return false;
    }
    if ($('#ddlarea').val() == '0') {
        $('#msgalert').text("Please Select Area.");
        document.querySelector('.notify-trigger').click();
        return false;
    }
    return true;

}
function DataSave(aid, ClientId, fname, lastname, mobileno, Address, landmark, cityname, areaname, pcode, IsFlagFav, cat, own, city, area) {

    $.ajax({
        url: "../BookTask6/Handler/SaveMyAddress.ashx",
        contentType: "application/text; charset=utf-8",
        data: {
            'AddressID': aid,
            'ClientID': ClientId,
            'AddressName': fname,
            'LastName': lastname,
            'MobileNo': mobileno,
            'Address': Address,
            'Landmark': landmark,
            'AreaName': areaname,
            'CityName': cityname,
            'PinCode': pcode,
            'IsFlagFav': IsFlagFav,
            'cat': cat,
            'AddressLabel': own,
            'CityID': city,
            'AreaID': area
        },
        success: function OnComplete(result) {

            var values = result.split(',');
            var status = values[0];
            var aid = values[1];
            if (status == 'Y') {
                $("div[data-aid='" + aid + "']").remove();
                $('#address').modal('hide');
                var instr = aid + "^" + fname + lastname + "^" + mobileno + "^" + Address + "^" + landmark + "^" + areaname + "^" + pcode + "^" + area;
                straddress = '<div class="addr-body" data-aid="' + aid + '" data-areaid=" ' + area + '"><h3 class="addr_h3">' + fname + ' ' + lastname + ' ' + mobileno + '<a data-toggle="modal" data-target="#address" onclick="FillAdd(this);" data-id="' + instr + '" class="edit"><i class="fa fa-pencil" aria-hidden="true"></i></a></h3><p class="addr_p">' + Address.replace("~", " ") + ' ' + landmark + ' ' + areaname + ' ' + pcode + '</p></div>';
                $('#DivPadd').prepend(straddress);
                $('#Divdadd').prepend(straddress);
fnaddbind();
                $('#inputpadd').click();
            }
            else {
                if (status == 'I') {
$('#address').modal('hide');
                    var instr = aid + "^" + fname + lastname + "^" + mobileno + "^" + Address + "^" + landmark + "^" + areaname + "^" + pcode + "^" + area;
                    straddress = '<div class="addr-body" data-aid="' + aid + '" data-areaid=" ' + area + '"><h3 class="addr_h3">' + fname + ' ' + lastname + ' ' + mobileno + '<a data-toggle="modal" data-target="#address" onclick="FillAdd(this);" data-id="' + instr + '" class="edit"><i class="fa fa-pencil" aria-hidden="true"></i></a></h3><p class="addr_p">' + Address.replace("~", " ") + ' ' + landmark + ' ' + areaname + ' ' + pcode + '</p></div>';
                    $('#DivPadd').prepend(straddress);
                    $('#Divdadd').prepend(straddress);
fnaddbind();
                    $('#inputpadd').click();
                }
            }

        },
        error: OnFail
    });
    return false;
}
function OnFail(result) {
    alert('Request Failed');
}

function fnproceed() {
    if (validatedetail()) {
        CallRequestQuoteN(ObjBook.cat, ObjBook.pval, ObjBook.weight, ObjBook.rcat, ObjBook.rpval,
               ObjBook.rweight, ObjBook.padd, 1, ObjBook.dadd, 1, 0,
               'N', 0, ObjBook.tdate, 'N', ObjBook.ttype);
        CallRequestQuoteE(ObjBook.cat, ObjBook.pval, ObjBook.weight, ObjBook.rcat, ObjBook.rpval,
              ObjBook.rweight, ObjBook.padd, 1, ObjBook.dadd, 1, 0,
              'N', 0, ObjBook.tdate, 'Y', ObjBook.ttype);
       //  alert('last');
       
    }
    else {
        //// $(".notify-trigger").click(function () { });
        //$('#msgalert').text("Please select complete detail about your Task and Try Again.");
        ////$('#msgalert').text("Edit text again");
        //document.querySelector('.notify-trigger').click();
    }
}
var expresscharge = 0;
var normalcharge = 0;
function CallRequestQuoteN(ServiceCategory, ProductValue, ProductWeight, ReturnServiceCategory, ReturnProductValue, ReturnProductWeight, PickupAreaID, PickUpCityID, DropAreaID, DropCityID, PaymentMode, ApplyInsurance, PromoCode, TaskDate, IsExpress, TaskMode, idata, iname) {

    $.ajax({
        url: "../BookTask6/Handler/RequestQuote.ashx",
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
            //alert(result);
            var values = result.split(',');
            var taskfee = values[0];
            var excessbaggage = values[1];
            var insurancef = values[2];
            var promoc = values[3];
            var total = values[4];
            var cashh = values[5];   //return charges
            var discount = values[6];
            var Isexp = values[7];
           
                $('#Ndelibery').text(values[4]);
                ////alert('Normal' + '<i class="fa fa-rupee"></i>' + values[4]);
                //normalcharge = values[4];
                ObjBook.ncharge = values[4];
                ObjBook.nrcost = values[5];
                ObjBook.service = taskfee;
            
            if ($('#Edelibery').text() != '0' && $('#Ndelibery').text() != '0')
            {
                $("#delivery-mode").modal('show');
            }
            
        },
        error: OnFail
    });
    return false;
}
function OnFail(result) {
    alert('Request Failed');
}

function CallRequestQuoteE(ServiceCategory, ProductValue, ProductWeight, ReturnServiceCategory, ReturnProductValue, ReturnProductWeight, PickupAreaID, PickUpCityID, DropAreaID, DropCityID, PaymentMode, ApplyInsurance, PromoCode, TaskDate, IsExpress, TaskMode, idata, iname) {

    $.ajax({
        url: "../BookTask6/Handler/RequestQuote.ashx",
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
           // alert(result);
            var values = result.split(',');
            var taskfee = values[0];
            var excessbaggage = values[1];
            var insurancef = values[2];
            var promoc = values[3];
            var total = values[4];
            var cashh = values[5];   //return charges
            var discount = values[6];
            var Isexp = values[7];
           
                $('#Edelibery').text(values[4]);
                //// alert('Express' + '<i class="fa fa-rupee"></i>' + values[4]);
                //expresscharge = values[4];
                ObjBook.echarge = values[4];
                ObjBook.ercost = values[5];
                ObjBook.eservice = taskfee;
          
            if ($('#Edelibery').text() != '0' && $('#Ndelibery').text() != '0') {
                $("#delivery-mode").modal('show');
            }

        },
        error: OnFailE
    });
    return false;
}
function OnFailE(result) {
    alert('Request Failed');
}


function Normalclick(elm) {
    var bookingtype = 'N';
    var cost = 0;
    var rcost = 0;

    cost = ObjBook.ncharge;
    rcost = ObjBook.nrcost;
    var imgname = 'N';
    var imageData = $('#image-editor').cropit('export');
    // image upload code 
    $.ajax({
        url: "https://www.russsh.com/handler/upload.php",
        // send the base64 post parameter
        data: {
            base64: imageData
        },
        // important POST method !
        type: "post",
        complete: function (data) {
            if (imageData != '')
            {
                imgname = data.responseText;
            }
            else
            {
                imgname = 'N';
            }
            fnsaverequest(ObjBook.cat, ObjBook.pval, ObjBook.weight, ObjBook.rcat, ObjBook.rpval,
                ObjBook.rweight, ObjBook.padd, 1, ObjBook.dadd, 1, 0,
                'N', 0, ObjBook.tdate, bookingtype, ObjBook.ttype, ObjBook.paddressid, ObjBook.daddressid, cost, ObjBook.ptime, ObjBook.des, ObjBook.rdes, imgname, rcost, ObjBook.service);
        }
    });
}
function Expressclick(elm) {
    var bookingtype = 'E';
    var cost = 0;
    var rcost = 0;
    cost = ObjBook.echarge;
    rcost = ObjBook.ercost;
    var imgname = 'N';
    var imageData = $('#image-editor').cropit('export');
    // image upload code 
        $.ajax({
            url: "https://www.russsh.com/handler/upload.php",
            // send the base64 post parameter
            data: {
                base64: imageData
            },
            // important POST method !
            type: "post",
            complete: function (data) {
                if (imageData != '') {
                    imgname = data.responseText;
                }
                else
                {
                    imgname = 'N';
                }
                fnsaverequest(ObjBook.cat, ObjBook.pval, ObjBook.weight, ObjBook.rcat, ObjBook.rpval,
                ObjBook.rweight, ObjBook.padd, 1, ObjBook.dadd, 1, 0,
                'N', 0, ObjBook.tdate, bookingtype, ObjBook.ttype, ObjBook.paddressid, ObjBook.daddressid, cost, ObjBook.ptime, ObjBook.des, ObjBook.rdes, imgname, rcost, ObjBook.eservice);
            }
        });
    

}



function fnsaverequest(ServiceCategory, ProductValue, ProductWeight, ReturnServiceCategory, ReturnProductValue, ReturnProductWeight, PickupAreaID, PickUpCityID, DropAreaID, DropCityID, PaymentMode, ApplyInsurance, PromoCode, TaskDate, IsExpress, TaskMode, Paddid, Daddid, Cost, Ptime, desc, rdesc, imgname, Rcost,service) {
    $.ajax({
        url: "../BookTask6/Handler/SaveRequest.ashx",
        contentType: "application/text; charset=utf-8",
        data: {
            'SERVICECATEGORY': ServiceCategory,
            'PRODUCTVALUE': ProductValue,
            'PRODUCTWEIGHT': ProductWeight,
            'RETURNSERVICECATEGORY': ReturnServiceCategory,
            'RETURNPRODUCTVALUE': ReturnProductValue,
            'RETURNPRODUCTWEIGHT': ReturnProductWeight,
            'PICKUPAREAID': PickupAreaID,
            'DROPOFFAREAID': DropAreaID,
            'TASKDATE': TaskDate,
            'ISEXPRESS': IsExpress,
            'TASKMODE': TaskMode,
            'Paddid': Paddid,
            'Daddid': Daddid,
            'Cost': Cost,
            'Ptime': Ptime,
            'Desc': desc,
            'Rdesc': rdesc,
            'IMGNAME': imgname,
            'RCOST': Rcost,
            'SERVICE':service
        },
        success: function OnComplete1(result) {
            // alert(result);
            url = '../Payment/default.aspx?rid=' + result;
            window.location = url;
        },
        error: OnFail1
    });
    return false;

}
function OnFail1(result) {
    alert('Request Failed');
}
function guid() {
    function s4() {
        return Math.floor((1 + Math.random()) * 0x10000)
          .toString(16)
          .substring(1);
    }
    return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
      s4() + '-' + s4() + s4() + s4();
}



