<%@ WebHandler Language="C#" Class="PayTMReturn" %>

using System;
using System.Collections.Generic;
using System.Linq;


using System.Web.UI.WebControls;
using paytm;

using System.Data;
using System.Web;
using System.Web.Security;

using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Collections.Specialized;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Drawing;
using System.Configuration;
using System.Security.Cryptography;
using System.Configuration;

public class PayTMReturn : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        String merchantKey = "1@DXTl3hJRjdFKXx"; // Replace the with the Merchant Key provided by Paytm at the time of registration.

        Dictionary<string, string> parameters = new Dictionary<string, string>();
        string paytmChecksum = "";

        string state1 = string.Empty;
        string pgtxnid = string.Empty;
        string amount = string.Empty;
        string marchant_txt_id = string.Empty;
	string msg=string.Empty;

        String retval = "{\"merchantTxnId\"" + ":";
        retval = retval + "\"" + pgtxnid + "\",";

        foreach (string key in context.Request.Form.Keys)
        {
                parameters.Add(key.Trim(), context.Request.Form[key].Trim());
                retval = retval + "\""+key.Trim()+"\":";
                retval = retval + "\"" + context.Request.Form[key].Trim() + "\"";

        }

      
         retval = retval +"}";


        context.Response.Write(retval);
        
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}