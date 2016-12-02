<%@ WebHandler Language="C#" Class="MobiKwikResponse" %>

using System;
using System.Web;

public class MobiKwikResponse : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/xml";
        String orderId = context.Request.Form["orderId"];
        String responseCode =context.Request.Form["responseCode"];
        String responseDescription = context.Request.Form["responseDescription"];
        String checksum = context.Request.Form["checksum"];
        String amounts =context.Request.Form["amount"];
        String paymentMethod =context.Request.Form["paymentMethod"];
        String cardhashid = context.Request.Form["cardhashid"];
        String status="";             
        MobiCheckSum mobi=new MobiCheckSum();
 Boolean isChecksumValid = false;
          if("wallet"==paymentMethod)
          {


            //{amount=296700, responseCode=0, responseDescription=Transaction completed successfully, paymentMethod=wallet, orderId=399312556}
           
String checksumInput="'"+orderId+"''"+amounts+"''"+responseCode+"''"+""+responseDescription+"'";

          //  String checksumInput = "'" + amounts + "''" + orderId + "''" + "MBK7460" + "'";
              
           // Boolean isChecksumValid = false;
           
            if(checksum != null){
                String MOBIKWIK_SECRET_KEY="Tn3WtxXYIgXibEMHKn4gyVuup4ig"; // Put your MobiKwik secret key here
              isChecksumValid = MobiCheckSum.verifyChecksum(MOBIKWIK_SECRET_KEY, checksumInput, checksum);

              
                      }
            if( isChecksumValid && responseCode=="0")
                {
                 status="0";
                }
            }
        
    else{
            String checksumInput = "'"+orderId+"''"+responseCode+"''"+responseDescription+"''"+amounts+"''"+paymentMethod+"''"+cardhashid+"'";
           
           
           
            if(checksum != null){
                String ZAAKPAY_SECRET_KEY="Tn3WtxXYIgXibEMHKn4gyVuup4ig"; // Put your Zaakpay secret key here
               isChecksumValid = MobiCheckSum.verifyChecksum(ZAAKPAY_SECRET_KEY, checksumInput, checksum);

              
            }
            if( isChecksumValid && responseCode=="100") {
                 status="0";
                }
          }
        String res="";
        res=res+"<paymentResponse>";
 res=res+"<orderid>"+orderId+"</orderid>";
res=res+"<amount>"+amounts+"</amount>";
res=res+"<status>"+status+"</status>";
res=res+"<statusMsg>"+responseDescription+ "</statusMsg>";
res=res+"</paymentResponse>";

      context.Response.Write(res);  
        
        


    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}