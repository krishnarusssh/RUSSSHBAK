using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net;
using System.IO;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Reflection;

/// <summary>
/// Summary description for FacebookManager
/// </summary>
public class FacebookManager
{
    public FacebookManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public String GetAccessToken(string code, string redirectPageName)
    {
        string token = "";
        string strResult = string.Empty;
        string strURL = string.Empty;
        try
        {
            strURL = "https://graph.facebook.com/oauth/access_token?" +
                     "client_id=" + ConfigurationManager.AppSettings["AppID"] +
                     "&redirect_uri=" + ConfigurationManager.AppSettings["WebsitePath"].ToString() + redirectPageName +
                     "&client_secret=" + ConfigurationManager.AppSettings["AppSecret"] +
                     "&code=" + code;
            if (strURL != string.Empty)
            {
                WebResponse objResponse;
                WebRequest objRequest = System.Net.HttpWebRequest.Create(strURL);
                objResponse = objRequest.GetResponse();

                using (StreamReader sr =
                new StreamReader(objResponse.GetResponseStream()))
                {
                    strResult = sr.ReadToEnd();
                    sr.Close();
                }
            }
            if (strResult != "" && strResult.Contains("access_token="))
            {
                string[] newtoken = strResult.Split('&');
                string[] getToken = newtoken[0].Split('=');
                token = getToken[1];
            }
        }
        catch (Exception ex)
        {

        }

        return token;
    }

    //Function to renew the access Token
    public String GetRenewalAccessToken(string accessToken)
    {
        string token = "";
        string strResult = string.Empty;
        string strURL = string.Empty;
        try
        {
            strURL = "https://graph.facebook.com/oauth/access_token?client_id=" + ConfigurationManager.AppSettings["AppID"] + "&client_secret=" + ConfigurationManager.AppSettings["AppSecret"] + "&grant_type=fb_exchange_token&fb_exchange_token=" + accessToken;
            if (strURL != string.Empty)
            {
                WebResponse objResponse;
                WebRequest objRequest = System.Net.HttpWebRequest.Create(strURL);
                objResponse = objRequest.GetResponse();

                using (StreamReader sr =
                new StreamReader(objResponse.GetResponseStream()))
                {
                    strResult = sr.ReadToEnd();
                    sr.Close();
                }
            }

            if (strResult != "" && strResult.Contains("access_token="))
            {
                string[] newtoken = strResult.Split('&');
                string[] getToken = newtoken[0].Split('=');
                token = getToken[1];
            }
        }
        catch (Exception ex)
        {

        }

        return token;
    }

    //Functin to get user details
    public String GetUserDetails(string accessToken)
    {
        string strResult = string.Empty;
        string strURL = string.Empty;

        try
        {
            strURL = "https://graph.facebook.com/me?fields=id,name,email,birthday,gender&access_token=" + accessToken;
            if (strURL != string.Empty)
            {
                WebResponse objResponse;
                WebRequest objRequest = System.Net.HttpWebRequest.Create(strURL);
                objResponse = objRequest.GetResponse();

                using (StreamReader sr =
                new StreamReader(objResponse.GetResponseStream()))
                {
                    strResult = sr.ReadToEnd();
                    sr.Close();
                }
            }

        }
        catch (Exception ex)
        {

        }

        return strResult;
    }
}

public class FaceBookData
{
    public List<FaceBookUser> Data { get; set; }
}

public class FaceBookUser
{
    public string Id { get; set; }
    public string Name { get; set; }
    public string PictureUrl { get; set; }
}
