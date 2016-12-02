<%@ WebHandler Language="C#" Class="PayTmCheckSumGeneration" %>

using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using paytm;

public class PayTmCheckSumGeneration : IHttpHandler {
    
    public void ProcessRequest (HttpContext context)
    {

        if (context.Request.Form.AllKeys.Length > 0)
        {
            try
            {
                Dictionary<string, string> parameters = new Dictionary<string, string>();
                string paytmChecksum = "";
                foreach (string key in context.Request.Form.Keys)
                {
                    parameters.Add(key.Trim(), context.Request.Form[key].Trim());
                }

                paytmChecksum = CheckSum.generateCheckSum("1@DXTl3hJRjdFKXx", parameters);

                if (parameters.ContainsKey("ORDER_ID") && parameters.ContainsKey("MID"))
                {
                    context.Response.AddHeader("Content-type", "application/json");
                    context.Response.Write("{\"ORDER_ID\":\"" + parameters["ORDER_ID"] + "\",\"CHECKSUMHASH\":\"" + paytmChecksum + "\",\"payt_STATUS\":\"1\"}");
                }
                else
                {
                    context.Response.AddHeader("Content-type", "application/json");
                    context.Response.Write("{\"ORDER_ID\":\"" + parameters["ORDER_ID"] + "\",\"CHECKSUMHASH\":\"" + paytmChecksum + "\",\"payt_STATUS\":\"2\"}");
                }
            }
            catch (Exception)
            {
            }


        }


    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}