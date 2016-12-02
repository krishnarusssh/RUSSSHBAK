<%@ WebHandler Language="C#" Class="MobiKwikCheckSumGeneration" %>

using System;
using System.Web;


using System.Collections.Generic;
using System.Linq;

using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Text;
using System.Security.Cryptography;
using System.Collections.Specialized;
using System.IO;

public class MobiKwikCheckSumGeneration : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

   String checksumString = "";
        String secretKey = "Tn3WtxXYIgXibEMHKn4gyVuup4ig";
     
       MobiCheckSum mobi = new MobiCheckSum();

      
          
            String email = context.Request.Form["email"];
            String cell = context.Request.Form["cell"];
            String redirecturl = context.Request.Form["redirecturl"];
            String amount = context.Request.Form["amount"];
            String orderid = context.Request.Form["orderid"];
            String mid = context.Request.Form["mid"];

         checksumString = "'" + amount + "''" + orderid + "''" + mid+ "'";

       String checksum = MobiCheckSum.calculateChecksum(secretKey, checksumString);




       String s="";
	s=s+"<checksum>";
 	s=s+"<status>SUCCESS</status>";
s=s+"<checksumString>"+checksumString +"</checksumString>";
	s=s+"<checksumValue>"+checksum+"</checksumValue>";
         s=s+"</checksum>";

	context.Response.Write(s);
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}