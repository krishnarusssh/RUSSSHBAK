﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Twitterizer;

public partial class PostFansTwitter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var oauth_consumer_key = "vMuCtI6MpXW0sq0xIcW4AlIhQ";
        var oauth_consumer_secret = "GRrvxYcOzrxM9pp2OuyVC84qtOBtb4zGyhhqbkdvxvkwPwsywA";
 
            if (Request["oauth_token"] == null)
            {
                OAuthTokenResponse reqToken = OAuthUtility.GetRequestToken(
                    oauth_consumer_key,
                    oauth_consumer_secret,
                    Request.Url.AbsoluteUri);
 
                Response.Redirect(string.Format("http://twitter.com/oauth/authorize?oauth_token={0}",
                    reqToken.Token));
            }
            else
            {
                string requestToken = Request["oauth_token"].ToString();
                string pin = Request["oauth_verifier"].ToString();
 
                var tokens = OAuthUtility.GetAccessToken(
                    oauth_consumer_key,
                    oauth_consumer_secret,
                    requestToken,
                    pin);
 
                OAuthTokens accesstoken = new OAuthTokens()
                {
                    AccessToken = tokens.Token,
                    AccessTokenSecret = tokens.TokenSecret,
                    ConsumerKey = oauth_consumer_key,
                    ConsumerSecret = oauth_consumer_secret
                };
 
                TwitterResponse<TwitterStatus> response = TwitterStatus.Update(
                    accesstoken,
                    "Testing!! It works (hopefully).");
 
                if (response.Result == RequestResult.Success)
                {
                    Response.Write("we did it!");
                }
                else
                {
                    Response.Write("it's all bad.");
                }
            }
        }
}