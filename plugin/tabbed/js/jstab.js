// JavaScript Document
function ShowTab1()
   {
	
document.getElementById("tab_content1").style.display="block";
document.getElementById("tab_content1").style.width="100%";

	   document.getElementById("tab_content2").style.display="none";
	   document.getElementById("tab_content3").style.display="none";
	   document.getElementById("tab_content4").style.display="none";

	

	   document.getElementById("tablink1").className="selected";
	   document.getElementById("tablink2").className="";
	   document.getElementById("tablink3").className="";
	   document.getElementById("tablink4").className="";
   }
 function ShowTab2()
   {
	   document.getElementById("tab_content1").style.display="none";
	   document.getElementById("tab_content2").style.display="block";
          document.getElementById("tab_content2").style.width="100%";
	   document.getElementById("tab_content3").style.display="none";
	   document.getElementById("tab_content4").style.display="none";
        

	     document.getElementById("tablink1").className="";
	   document.getElementById("tablink2").className="selected";
	    document.getElementById("tablink3").className="";
		 document.getElementById("tablink4").className="";
   }
   function ShowTab3()
   {
	   document.getElementById("tab_content1").style.display="none";
	   document.getElementById("tab_content2").style.display="none";
	   document.getElementById("tab_content3").style.display="block";
            document.getElementById("tab_content3").style.width="100%";
	   document.getElementById("tab_content4").style.display="none";

         
	     document.getElementById("tablink1").className="";
	   document.getElementById("tablink2").className="";
	    document.getElementById("tablink3").className="selected";
		 document.getElementById("tablink4").className="";
   }
    function ShowTab4()
   {
	   document.getElementById("tab_content1").style.display="none";
	   document.getElementById("tab_content2").style.display="none";
	   document.getElementById("tab_content3").style.display="none";

	   document.getElementById("tab_content4").style.display="block";
document.getElementById("tab_content4").style.width="100%";
	    document.getElementById("tablink1").className="";
	   document.getElementById("tablink2").className="";
	    document.getElementById("tablink3").className="";
		 document.getElementById("tablink4").className="selected";
   }