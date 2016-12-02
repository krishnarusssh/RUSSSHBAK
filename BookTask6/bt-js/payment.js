$(document).ready(function () {
    $("#paytype li").click(function () {
        $('#hndptype').val(this.id);
        //alert($('#hndptype').val());
        if (this.id == '7') {
            $('#hndcashtype').val("7");
        }
        var total = $('#divtotal').text();
        // //alert(total);
        // //alert($('#wallbal').text());
        var cwall = $('#wallbal').text();
        ////alert(cwall);
        if (cwall < $.trim(total)) {
            //alert('Low Balance in Russsh wallet....');
            $('#wallet1').attr("disabled", true);
        }
    });
    $("chkcash").click(function () {
        var isChecked = jQuery("input[name=chkcash]:checked").val();
        if (!isChecked) {
            //alert('Nothing Selected');
        } else {
            // //alert(jQuery("input[name=chkcash]:checked").val());
            //alert('You have selected :' + isChecked);
        }
    });
    $("input[name='chkcash']").change(function () {
        var isChecked = jQuery("input[name=chkcash]:checked").val();
        if (!isChecked) {
            $('#hndcashtype').val("");
        } else {
            ////alert();
            ////alert('You have selected :' + isChecked);
            $('#hndcashtype').val(jQuery("input[name=chkcash]:checked").val());
        }
    });
    $("input[name='wal']").change(function () {
        var isChecked = jQuery("input[name=wal]:checked").val();
        if (!isChecked) {
            $('#hndcashtype').val("");
        } else {
            ////alert('You have selected :' + isChecked);
            $('#hndcashtype').val(jQuery("input[name=wal]:checked").val());

        }
    });

    $("input[name='bank']").change(function () {
        var isChecked = jQuery("input[name=bank]:checked").val();
        if (!isChecked) {
            $('#hndcashtype').val("");
        } else {
            //alert('You have selected :' + isChecked);
            var hndbankval = jQuery("input[name=bank]:checked").val();
            $('#hndcashtype').val("6");
            $('#hndbankval').val(isChecked);
            $('#otherbanks').val(isChecked);
        }
    }); 

    $("input[name='cardid']").change(function () {
        var isChecked = jQuery("input[name=cardid]:checked").val();
       // alert(isChecked);
        if (!isChecked) {
            $('#hndcashtype').val("");
        } else {
            //alert('You have selected :' + isChecked);
            var hndbankval = jQuery("input[name=cardid]:checked").val();
            var crddata = $('#hndcard' + isChecked.toString()).val();
            //alert(crddata);
            var values = crddata.split('_');
            ObjCard.cno = values[0];
            ObjCard.name = values[1];
            ObjCard.cm = values[2];
            ObjCard.cy = values[3];
            $('#hndptype').val("8");
            $('#hndcashtype').val(isChecked);
        }
    });
    $('#otherbanks').change(function () {
        $('#hndbankval').val($('#otherbanks').val());
        jQuery("input[name=bank]:checked").prop("checked", false);
		$('#hndcashtype').val("6");
        //alert($('#hndbankval').val());
    });
});
function fncheck() {
    if ($('#hndptype').val() != '0') {
        if ($('#hndptype').val() == '1') {
            //  //alert('Cash Selected...');
            if ($('#hndcashtype').val() == '') {
                $('#msgalert').text('Please select Payment Mode');
                document.querySelector('.notify-trigger').click();
            }
            else {
                BookTask($('#hndrid').val(), $('hndcid').val(), $('#hndcashtype').val(), $('#hndweight').val())
            }
        }
        if ($('#hndptype').val() == '2') {
            if ($('#hndcashtype').val() == '') {
                $('#msgalert').text('Please select Payment Mode');
                document.querySelector('.notify-trigger').click();
            }
            else {
                if ($('#hndcashtype').val() < 3) {
                    // //alert($('#hndcashtype').val());
                    BookTask($('#hndrid').val(), $('hndcid').val(), $('#hndcashtype').val(), $('#hndweight').val());
                }
                if ($('#hndcashtype').val() == 3) {
                    ////alert($('#hndcashtype').val());
                    BookTask($('#hndrid').val(), $('hndcid').val(), $('#hndcashtype').val(), $('#hndweight').val());
                }
                if ($('#hndcashtype').val() == 4) {
                    ////alert($('#hndcashtype').val());
                    BookTask($('#hndrid').val(), $('hndcid').val(), $('#hndcashtype').val(), $('#hndweight').val());
                }
                if ($('#hndcashtype').val() == 5) {
                    ////alert($('#hndcashtype').val());
                    BookTask($('#hndrid').val(), $('hndcid').val(), $('#hndcashtype').val(), $('#hndweight').val());
                }
                if ($('#hndcashtype').val() == 6)
                {
                    BookTask($('#hndrid').val(), $('hndcid').val(), $('#hndcashtype').val(), $('#hndweight').val());
                }
            }

        }
        if ($('#hndptype').val() == '3')
        {
            if ($('#hndbankval').val() == '0')
            {
                $('#msgalert').text('Please select Any Payment Method');
                document.querySelector('.notify-trigger').click();
            }
            else
            {
                //  alert('fncheck alert');
                    BookTask($('#hndrid').val(), $('hndcid').val(), "6", $('#hndweight').val());                
            }
        }
        if ($('#hndptype').val() == '7')
        {
            if (ObjCard.c1 == '' || ObjCard.c2 == '' || ObjCard.c3 == '' || ObjCard.c4 == '' || ObjCard.name == '' || ObjCard.cm == '' || ObjCard.cy == '' || ObjCard.cv == '') {
                $('#msgalert').text('Please Fill card detail');
                document.querySelector('.notify-trigger').click();
            }
            else
            {
               // alert('fncheck alert');
                 BookTask($('#hndrid').val(), $('hndcid').val(), $('#hndptype').val(), $('#hndweight').val());
                }
        }
        if ($('#hndptype').val() == '8') {
            if (ObjCard.cno == ''  || ObjCard.name == '' || ObjCard.cm == '' || ObjCard.cy == '' || ObjCard.cv == '') {
                $('#msgalert').text('Please Fill card detail');
                document.querySelector('.notify-trigger').click();
            }
            else {
                // alert('fncheck alert');
                BookTask($('#hndrid').val(), $('hndcid').val(), $('#hndptype').val(), $('#hndweight').val());
            }
        }
    }
    else {
        $('#msgalert').text('Please select Any Payment Method');
        document.querySelector('.notify-trigger').click();
    }
}

function BookTask(rid, cid, paymode, bggage) {
    $.ajax({
        url: "../BookTask6/Handler/BookTask.ashx",
        contentType: "application/text; charset=utf-8",
        data: {
            'rid': rid,
            'cid': cid,
            'weight': bggage,
            'paymode': paymode
        },
        success: function OnComplete(result) {
            //alert(result);
            //alert($('#hndptype').val());
            if ($('#hndptype').val() > 1) {
                //var values = result.split(',');
                if ($('#hndcashtype').val() == 2) {
                    url = '../Confirmationnew';
                    window.location = url;
                }
                if ($('#hndcashtype').val() == 3) {
                    url = '../mobiqwik';
                    window.location = url;
                }
                if ($('#hndcashtype').val() == 4) {
                    url = '../PayTM';
                    window.location = url;
                }
                if ($('#hndcashtype').val() == 5) {
                    url = '../payumoney';
                    window.location = url;
                }
                if ($('#hndcashtype').val() == 6) {
                    url = '../payment/PayByNetBanking.aspx?bid=' + $('#hndbankval').val();;
                    window.location = url;
                }
                if ($('#hndcashtype').val() == 7) {
 var qp = 0;
                    if (document.getElementById("chkqpy").checked == true)
                    {
                        qp = 1;
                    }
                    var data = ObjCard.c1 + ObjCard.c2 + ObjCard.c3 + ObjCard.c4 + '_' + ObjCard.name + '_' + ObjCard.cm + '_' + ObjCard.cy + '_' + ObjCard.cv + '_' + qp;
                    url = '../payment/PayByCard.aspx?Data=' + data;
                    window.location = url;
                }
                if ($('#hndcashtype').val() == 9) {
var qp = 0;
                    var data = ObjCard.cno + '_' + ObjCard.name + '_' + ObjCard.cm + '_' + ObjCard.cy + '_' + ObjCard.cv + '_' + qp;
                    url = '../payment/PayByCard.aspx?Data=' + data;
                    window.location = url;
                }
            }
else {
                url = '../Confirmationnew';
                window.location = url;
            }

        },
        error: OnFail
    });
    return false;
}
function OnFail(result) {
    //alert('Request Failed');
}
function MoveFromA() {

    if (document.getElementById("ccdcno1").value.length == 4) {
        
        ObjCard.c1 = $('#ccdcno1').val();
        document.getElementById("ccdcno2").focus();
    }
}
function MoveFromB() {
    if (document.getElementById("ccdcno2").value.length == 4) {
CardDetails(document.getElementById("ccdcno1").value.concat(document.getElementById("ccdcno2").value));
        ObjCard.c2 = $('#ccdcno2').val();
        document.getElementById("ccdcno3").focus();
    }
}
function MoveFromC() {
    if (document.getElementById("ccdcno3").value.length == 4) {
        ObjCard.c3 = $('#ccdcno3').val();
        document.getElementById("ccdcno4").focus();
    }
}

function CnoD() {

    if ($('#ccdcno4').val().length < 3) {
        $('#msgalert').text('Please Enter Valid Card details');
        document.querySelector('.notify-trigger').click();
    }
    else {
        ObjCard.c4 = $('#ccdcno4').val()
    }
}
function CName() {

    if ($('#ccdname').val().length < 2) {
        $('#msgalert').text('Please Enter Valid Card details');
        document.querySelector('.notify-trigger').click();
    }
    else {
        ObjCard.name = $('#ccdname').val()
    }
}
function fncm() {
    
    var mval = $('#cm').val();
    if (mval.length < 2)
    {
        $('#cm').val('0'+mval);
    }
    var mnth = $('#cm').val();
    if (mnth > 12) {
        $('#cm').val(0);
        $('#cm').focus();
    }
    else
    {
        ObjCard.cm = $('#cm').val()
    }
}
function fncy() {
   ObjCard.cy ='20'+$('#cy').val()
} function fnccv() {
    ObjCard.cv = $('#cv').val()
}
function fnqpcv(elm)
{
   // alert($(elm).val());
    ObjCard.cv = $(elm).val();
}
function CardDetails(cno) {
    $.ajax({
        url: "https://binlist.net/json/"+cno,
        contentType: "application/text; charset=utf-8",
        success: function OnComplete(result) {
            
	        try {
		          var json = $.parseJSON(result);
            if (json.brand == 'MASTERCARD')
            {
                $("#cimg").attr("src", "../BookTask6/img/Mastercard.png");
            }
			if (json.brand == 'VISA')
            {
                $("#cimg").attr("src", "../BookTask6/img/visa.png");
            }
			if (json.brand == 'MAESTRO')
            {
                $("#cimg").attr("src", "../BookTask6/img/Maestro.png");
            }		  
            } catch (e) {
                 $("#cimg").attr("display", "none");
            }
        },
        error: OnFailc
    });
    return false;
}
function OnFailc(result) {
    //alert('Request Failed');
}
function FnPromo()
{
    ApplyPromo($('#hndrid').val(), $('#hndcid').val(), $('#promo').val());
}
function ApplyPromo(rid, cid, promo) {
    $.ajax({


        url: "../BookTask6/Handler/ApplyPromoCode.ashx",
        contentType: "application/text; charset=utf-8",
        data: {
            'rid': rid,
            'cid': cid,
            'pcode': promo
        },
        success: function OnComplete(result) {
            var values = result.split(',');
         
       
                $('#divtotal').html('<i class=fa fa-rupee></i>' + values[0]);
                $('#divdiscount').html('<i class=fa fa-rupee></i>' + values[1]);
           


        },

        error: OnFailP
    });
    return false;
}
function OnFailP(result) {
    //alert('Request Failed');
}

