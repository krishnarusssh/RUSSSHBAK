<%@ WebHandler Language="C#" Class="PayTmVerifyCheckSum" %>

using System;
using System.Web;
using paytm;
using System.Collections.Generic;
using System.Web.Script.Serialization;
public class PayTmVerifyCheckSum : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
         context.Response.ContentType = "text/plain";
	 Dictionary<string, string> parameters = new Dictionary<string, string>();
           if (context.Request.Form.AllKeys.Length > 0)
        {
           
            try
            {
                string paytmChecksum = "", responseString = "";

                foreach (string key in context.Request.Form.Keys)
                {
                    parameters.Add(key.Trim(), context.Request.Form[key].Trim());
                }


                if (parameters.ContainsKey("CHECKSUMHASH"))
                {
                    paytmChecksum = parameters["CHECKSUMHASH"];
                    parameters.Remove("CHECKSUMHASH");
                }
		
                if (CheckSum.verifyCheckSum("1@DXTl3hJRjdFKXx", parameters, paytmChecksum))
                {
                    parameters.Add("IS_CHECKSUM_VALID", "Y");
                }
                else
                {
                    parameters.Add("IS_CHECKSUM_VALID", "N");
                }


            }
            catch (Exception ex)
            {
                parameters.Add("IS_CHECKSUM_VALID", "N");


            }

           
            string myJsonString = (new JavaScriptSerializer()).Serialize(parameters);

            context.Response.Write(myJsonString);
        }
else
	{
 		parameters.Add("IS_CHECKSUM_VALID", "N");
		string myJsonString = (new JavaScriptSerializer()).Serialize(parameters);

            context.Response.Write(myJsonString);
	}
        
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}