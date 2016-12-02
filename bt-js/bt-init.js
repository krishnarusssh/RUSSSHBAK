jQuery(function($){
var TENTERED = window.TENTERED || {};
/* ====  Tooltip === */
TENTERED.toolTip = function(){$('a[data-toggle=tooltip]').tooltip();}
/* Init Functions */
$(document).ready(function(){TENTERED.toolTip();});
// Animation Appear
$("[data-appear-animation]").each(function() {
    var $this = $(this);
    $this.addClass("appear-animation");
    if(!$("html").hasClass("no-csstransitions") && $(window).width() > 767) {
      $this.appear(function() {
        var delay = ($this.attr("data-appear-animation-delay") ? $this.attr("data-appear-animation-delay") : 1);
        if(delay > 1) $this.css("animation-delay", delay + "ms");
        $this.addClass($this.attr("data-appear-animation"));
        setTimeout(function() {
        $this.addClass("appear-animation-visible");
        }, delay);
        }, {accX: 0, accY: -150});
      } 
      else {$this.addClass("appear-animation-visible");}
});
// Animation Progress Bars
$("[data-appear-progress-animation]").each(function() {
var $this = $(this);
$this.appear(function() {
var delay = ($this.attr("data-appear-animation-delay") ? $this.attr("data-appear-animation-delay") : 1);
if(delay > 1) $this.css("animation-delay", delay + "ms");
$this.addClass($this.attr("data-appear-animation"));
setTimeout(function() {
$this.animate({
width: $this.attr("data-appear-progress-animation")}, 1500, "easeOutQuad", function() {
$this.find(".progress-bar-tooltip").animate({
opacity: 1}, 500, "easeOutQuad");});}, delay);}, {accX: 0, accY: -50});
});
// file upload  
$("input[type='image']").click(function() {
$("input[id='my_file']").click();
});
$("#edit_window").click(function() {
$("input[id='my_file']").click();
});
// weight range slider
$("#weight-bt").slider();
$("#weight-bt").on("slide", function(slideEvt) {
$("#weight-view").text(slideEvt.value);
$("#weight-value").text(slideEvt.value);

});
$("#weight-bt").on( "change input", function () {
    var value = $(this).val();
    $(this).attr("data-name", value);
    fnAddItem($(this));
    $( ".img" ).attr({src: "img/weight/"+ value +".png"}).css("height","230px");
    $(".submit-bt").css("background","#ed846a");
});

function resetSlider() {
  var $slider = $("#weight-bt");
  $slider.slider("values", 0, initialMinimumValue);
  $slider.slider("values", 1, initialMaximumValue);  
}

$(document).on('click', '.dropdown-menu', function(e) {
    if ($(this).hasClass('keep-open-on-click')) { e.stopPropagation(); }
});
$('.dropdown-scroll,.map_left,.address-scroll').enscroll({
    showOnHover: true,
    verticalTrackClass: 'track3',
    verticalHandleClass: 'handle3'
});

$(".camera").click(function(){
  $(".cropit-preview").css({"display":"block","width":"100%"});
  $(".camera").css("display","none");
  $(".cam_edit").show();
});
$(".none_item").click(function(){
  $(".filter_input").hide();
});
});

$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});
/* ======= Item Selection ========= */
  var arrItems = {
    'drop_parcel'       : [],
    'drop_pick_parcel'  : [],
     'multi_pop1'       : [],
     'multi_pop2'       : [],
     'multi_pop3'       : [],
     'multi_pop4'       : []
  };

  var temArr    = {};
  var dataFor  = "";

  function fnAddItem(elm, itemInd, rem){
        if(elm != "" && elm != undefined){
            var _name = $(elm).attr("data-name");
            var _id = $(elm).attr("data-id");
            var _in = $(elm).attr("data-index");
            itemInd = _in;
            if(_id=='ITEM0014')
            {
              //var myVar = $(".filter_input").find('.myClass').val();
              var ICat = document.getElementById("txtsearch").value;
              _name = ICat;
              //alert(ICat);
            }
            arrItems[dataFor][_in] = {
                'name'     : _name,
                'id'     : _id,
                'index' : _in
            };
        }
        var strHtml = "";
        $.each(arrItems[dataFor], function(key, value) {

          if(value['name'] != undefined || value['name'] != null)
          strHtml += '<div onclick="fnRemoveItem(this,0,\''+ dataFor +'\');" class="value-selected" data-remove="'+ value['index'] +'"><span>'+ (value['index'] == 1 ? "<i class='fa fa-rupee'></i> " : "") + value['name'] + (value['index'] == 4 ? " KG" : "") +'</span><span class="x">&times;</span></div>';
            //alert(this.id);
        });
    if(Object.keys(arrItems[dataFor]).length > 0){
      $(".submit-bt").css("background","#CCC");
      $("[data-item-collection]").html(strHtml);
      $("[data-item-collection]").addClass("item_collection");
      if(itemInd != 1){
        if(itemInd == 2)
          itemInd = 1;
        $("[data-step='"+ itemInd +"']").hide();
        $(".filter_input").hide().val("");

        if(rem && itemInd == 3){
          steps = 2;
        } else {
          if(itemInd == 4){
            steps = parseInt(Object.keys(arrItems[dataFor]).length);
          } else {
            steps = parseInt(Object.keys(arrItems[dataFor]).length-1);
          }
        }
        if(rem)
          $("[data-step='"+ steps +"']").show();
        else
          $("[data-step='"+ parseInt(Object.keys(arrItems[dataFor]).length) +"']").show();

      }
    } else {
      $("[data-step]").hide();
      $("[data-step='0']").show();
      $("[data-item-collection]").removeClass("item_collection");
      $("[data-item-collection]").html('<input type="text" class="form-control" placeholder="Select a Item, Description, Price &amp; Weight" />');
    }
  }

  function fnAddPriceInd(){
    var _pr   = $("[data-index='1']");
    var _ind  = $("[data-index='2']");
    if(_pr.val() != "" && _ind.val() != ""){
      _pr.attr("data-name", _pr.val());
      _ind.attr("data-name", _ind.val());
      fnAddItem(_pr);
      fnAddItem(_ind);
    }
  }
  function fnProceedParcel(){
    if(Object.keys(arrItems[dataFor]).length > 3){
      $("#select-catg").modal("hide");
      //$("[data-dismiss='modal']").click();
      $("#"+ dataFor +" [data-parcel-detail]").addClass("parcel_active");
      $(".filter_input").show();
      var strHtml = "";
      temArr = arrItems[dataFor];
      $.each(arrItems[dataFor], function(key, value){
        if(value['name'] != undefined || value['name'] != null)
          strHtml += '<div data-remove="'+ value['index'] +'" onclick="fnRemoveItem(this,1,\''+ dataFor +'\');" class="item-selected">'+ (value['index'] == 1 ? "<i class='fa fa-rupee'></i> " : "") + value['name'] + (value['index'] == 4 ? " KG" : "")  +' <span class="x">×</span></div>';

      });
      $("#"+ dataFor +" .item-collected").html(strHtml);
      arrItems[dataFor] = {};
      fnAddItem();
    }
    $(".btn-checkout").css("background","#ed846a");
    
  }

  function fnResetModal(elm){
    dataFor   = $(elm).attr("data-type");
    arrItems[dataFor]  = {};
    $("#select-catg .form-control").val("");
    fnAddItem();
  }

  function fnRemoveItem(elm, action, type){
    dataFor = type;
    var _in = $(elm).attr("data-remove");
    if(action == 1){
      $("#"+dataFor +" .parcel_active .form-control").click();
      arrItems[dataFor] = temArr;
    }
    if(_in == 2){
      $("[data-step]").hide();
      $("[data-step='1']").show();
      $(".btn-next").css("background","#CCC");
    }

    if(_in != 2){
      $("[data-step]").hide();
      $("[data-step='"+ _in +"']").show();
      $(".btn-next").css("background","#CCC");
      $(".filter_input").show();
      $(".filter_input input").val("");    
    }
    $("[data-index='"+_in+"']").val("");

    delete arrItems[dataFor][_in];
    var tempVar = 0;
    $.each(arrItems[dataFor], function(key, value){
      if(_in < value['index']){
        delete arrItems[dataFor][value['index']];
        tempVar = value['index'];
      }
    });
    fnAddItem("",_in, 1);
  }
  $(document).keyup(function(elm){
    if(elm.which == "9" && $("[data-index='1']").val() != "" && arrItems[dataFor]['1'] == undefined){
      $("[data-index='1']").attr("data-name",$("[data-index='1']").val());
      fnAddItem($("[data-index='1']"));
    }

  })
  $("#next input").keyup(function(){
        var _val = $(this).val();
      if(_val != ""){
        $(".btn-next,.btn-next-mobile").css("background","#f46d40");
      } else {
         $(".btn-next,.btn-next-mobile").css("background","#CCC");
      }
  });
/* ================ Item selection End =============== */
// book tab
$(document).ready(function () {
    $(".book-tab a").click(function (event) {
        event.preventDefault();
        $(this).parent().addClass("active");
        $(this).parent().siblings().removeClass("active");
        var tab = $(this).attr("href");
        $(".book-content").not(tab).css("display", "none");
        $(tab).fadeIn('slow');
    });
});
// add address tab
$(document).ready(function () {
    $(".address-tab a").click(function (event) {
        event.preventDefault();
        $(this).parent().addClass("active");
        $(this).parent().siblings().removeClass("active");
        var tab = $(this).attr("href");
        $(".address-content").not(tab).css("display", "none");
        $(tab).fadeIn('slow');
    });
});
// date setting
function settdate()
{
  var months = new Array(12);
months[0] = "Jan";
months[1] = "Feb";
months[2] = "Mar";
months[3] = "Apr";
months[4] = "May";
months[5] = "June";
months[6] = "July";
months[7] = "Aug";
months[8] = "Sept";
months[9] = "Oct";
months[10] = "Nov";
months[11] = "Dec";
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!

    var yyyy = today.getFullYear();
    if (dd < 10) {
                    dd = '0' + dd
                }
               
                var today = months[mm-1] + ' ' + dd + ' ' + yyyy;
                document.getElementById('tdate').value= today;
                $('#tdate').addClass("date-selected").removeClass("form-control").css({"margin-bottom":"20px"});
                //$(".close-icon").css("display","block");
}
// clear date
function cleardate(){
        document.getElementById("tdate").value="";
        $('#tdate').addClass("form-control").removeClass("date-selected").css("margin-bottom" , "0");
        $('.time-container').fadeOut('slow').css("display", "none");
        $(".datepickers-container").css("display" , "block");
        $(".close-icon").css("display","none");
        $(".multiSelectElementSelected").css("display","none");
}
//show time
function showhidetime()
{
    if ($('.time-container').css('display') == 'none') {
        $(".time-container").fadeIn("slow").css({"display": "block"}).addClass("time-container-relative");
        $(".datepickers-container").fadeIn("slow").css("display" , "none");   
    }
    else{
          $(".time-container").css("display" , "none");
    }
 }
// date capsule style
(function(e)
{
  e.fn.multiSelect=function(t)
{
   var n={title:"Title",elements:["Lorem","Ipsum","Dolor","Sit","Amet"]};
   var r=e.extend(n,t);return this.each(function(){var t=e(this);t.html("");
   t.append('<div id="multiSelectSelected"></div>');
   var n=e("#multiSelectSelected");
   n.append('<div id="multiSelectElementsSelected">'+r.title+"</div>");
  //t.append('<div id="multiSelectElements"></div>');
  var i=e("#multiSelectElements");
  for(var s=0;s<r.elements.length;s++)
  {
    i.append('<p class="timetxt">'+r.elements[s]+"</p>")}
    e(document).on("click",".timetxt",function()
    {
      alert(this.id);
      var t=e("#multiSelectElementsSelected").html();
      var n='<div class="multiSelectElementSelected">'+e(this).html()+'<span class="multiSelectClose"> &times;</span></div>';
      $('.time-container').fadeOut('slow').hide();
         
      if(t.trim()==r.title){t=""}
        e("#multiSelectElementsSelected").html(t+n)});
          e(document).on("click",".multiSelectClose",function()
         {
            $(".time-container").fadeIn("slow").css("display" , "block");
            var t=e(this).parent().html();
            t=t.replace('<span class="multiSelectClose"> &times;</span>',"");
            e(this).parent().remove();
            i.append('<p class="timetxt">'+t+"</p>");
            if(e("#multiSelectElementsSelected").html().trim()=="")
            {e("#multiSelectElementsSelected").html(r.title)}})})}})(jQuery)
//number validation
function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
    return false;
    return true;
}
$( ".pick_input .addr-body" ).click(function() {
  $("#addr_filter .dropdown-menu").hide();
  var text = $(this).text();
  $(".pick_input input").val( text ).addClass("address-selected").css("padding","3px 20px");
  $("#drop_filter .dropdown-menu").show();
  $(".pick_input input").click(function() {
    $(".pick_input input").val("").removeClass("address-selected").css("padding","1px 1px");
    $("#addr_filter .dropdown-menu").show();
  });
  $(".addr_close").click(function() {
    $("#addr_filter .dropdown-menu").hide();
  });
});

$(".drop_input .addr-body").click(function() {
  $("#drop_filter .dropdown-menu").hide();
  var text = $(this).text();
  $(".drop_input input").val( text ).addClass("address-selected").css("padding","3px 20px");
  $(".drop_input input").click(function() {
    $(".drop_input input").val("").removeClass("address-selected").css("padding","1px 1px");
    $("#drop_filter .dropdown-menu").show();
  });
  $(".addr_close").click(function() {
    $("#drop_filter .dropdown-menu").hide();
  });
});
if ($('.drop_input input').val() == '') {
      $(".pick_input input").click(function() {
      $("#drop_filter .dropdown-menu").hide();
  });  
    }
    else {
        $(".drop_input input").click(function() {
        $("#drop_filter .dropdown-menu").show();
        });
    }
// other value filter input
$(document).ready(function () {
$(".filter_input input").keyup(function() {
    var value = $(this).val();
    $(".others h3").text(value);
})
.keyup();
});

/* notification  */
$(".notify-trigger").click(function() {
  $(".notify_box").fadeToggle( "slow", "linear" );
  setTimeout(function(){$(".notify_box").slideUp(500)}, 8000);
});

// Filter element
var options = {
  valueNames: [ 'time' ]
};
var userList = new List('users', options);
var options = {
  valueNames: [ 'filtervalue' ]
};
// filter address
var userList = new List('item_filter', options);
var options = {
  valueNames: [ 'addr_h3', 'addr_p' ]
};
var userList = new List('addr_filter', options);
// drop filter
var options = {
  valueNames: [ 'addr_h3', 'addr_p' ]
};
var userList = new List('drop_filter', options);

// multi_pick_add_filter
var options = {
  valueNames: [ 'multiple-select' ]
};
var userList = new List('multi_pick_filter', options);
// multi_drop_add_filter
var options = {
  valueNames: [ 'multiple-select_drop' ]
};
var userList = new List('multi_drop_filter', options);


// home office others address hide and show
  function dropparcel()
  {
    $("#drop_parcel").show();
    $("#multi_pick_drop").hide();
    $("#pick_drop_box").show();
    $("#address_single_return").show();
    $("#proceed_hidden ").show();
  }
  function drophidesingle()
  {
    $("#drop_parcel").hide();
    $("#multi_pick_drop").hide();
    $("#pick_drop_box").show();
    $("#address_single_return").show();
    $("#proceed_hidden ").show(); 
  }
  function others(elm)
  {
      $("#other_show").show();
      // alert($(elm).attr('data-id'))
      $('#addtype').val($(elm).attr('data-id'));
  }
  function office(elm)
  {
      $("#other_show").hide();
      // alert($(elm).attr('data-id'))
      $('#addtype').val($(elm).attr('data-id'));
  }
  function multi_pick_drop1()
  {
    $("#multi_pick_drop").fadeIn();
    $("#pick_drop_box").hide();
    $("#address_single_return").hide();
    $("#proceed_hidden ").hide();  
  }
// address body scroll top on mobile   
  $('.sticky_address').on('click', function (e) {
        e.preventDefault();
        $('html,body').animate({
            scrollTop:650
        }, 250);
  });
// multi address selection
$('#multi_submit').click(function() {

  var strHtml = "";

  var sel = $('.multiple-select input[type=checkbox]:checked').length;

  for(var i = 0; i<sel; i++){
     strHtml += "<span class='__pill'>"+ $('.multiple-select input[type=checkbox]:checked').eq(i).val() + '<span class="x" onclick="multi_X()">&times;</span>'+"</span>";
  }
  $(".multi_input input").hide(); // First hide the element
  //strHtml += "<span class='__pill'>"+ sel +"</span>";
  $(".multi_input .container__pill").html(strHtml); // add new div with the class .address-selected and display none by default
   //$(".multi_input .container__pill").show(); // show it now
    $(".multi_input .dropdown-menu").fadeOut();
});

$('#multi_submit').click(function() {
  $(".__pill").css("display","block");
});
function multi_X() {
 $(".multi_input .dropdown-menu").fadeIn('slow');
 $(".__pill").css("display","none");
 $(".multi_input input").show();
 $(".multiple-select input[type=checkbox]").prop('checked', false);
}
$('.multiple-select input[type=checkbox]').on('change', function(){
      $('#multi_submit').css('background', this.checked ? '#ed846a' : ''); 
});
/* ================ multi drop selection ====================== */

$('#multi_d_submit').click(function() {
  var strHtml = "";
  var sel = $('.multiple-select_drop input[type=checkbox]:checked').length;

  for(var i = 0; i<sel; i++){
     strHtml += "<span class='__pill_drop'>"+ $('.multiple-select_drop input[type=checkbox]:checked').eq(i).val() + '<span class="x" onclick="multi_X_drop()">&times;</span>'+"</span>";
  }
  $(".multi_input_drop input").hide(); // First hide the element
  $(".multi_input_drop .container__pill_drop").html(strHtml); // add new div with the class .address-selected and
  $(".multi_input_drop .dropdown-menu").fadeOut();
  //alert(sel);
});

$('#multi_d_submit').click(function() {
  $(".__pill_drop").css("display","block");
});

function multi_X_drop() {
 $(".multi_input_drop .dropdown-menu").fadeIn('slow');
 $(".__pill_drop").css("display","none");
 $(".multi_input_drop input").show();
 $(".multiple-select_drop input[type=checkbox]").prop('checked', false);
}
$('.multiple-select_drop input[type=checkbox]').on('change', function(){ 
$('#multi_d_submit').css('background', this.checked ? '#ed846a' : ''); 
});
