using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Text;
using System.Security.Cryptography;
using System.Collections.Specialized;
using System.IO;
/// <summary>
/// Summary description for MobiCheckSum
/// </summary>
public class MobiCheckSum
{
	public MobiCheckSum()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    public static string toHex(byte[] bytes)
    {
        StringBuilder hex = new StringBuilder(bytes.Length * 2);
        foreach (byte b in bytes)
            hex.AppendFormat("{0:x2}", b);
        return hex.ToString();


    }

    public static string calculateChecksum(string secretkey, string allparamvalues)
    {

        byte[] dataToEncryptByte = Encoding.UTF8.GetBytes(allparamvalues);
        byte[] keyBytes = Encoding.UTF8.GetBytes(secretkey);
        HMACSHA256 hmacsha256 = new HMACSHA256(keyBytes);
        byte[] checksumByte = hmacsha256.ComputeHash(dataToEncryptByte);
        String checksum = toHex(checksumByte);

        return checksum;
    }

    public static Boolean verifyChecksum(String secretKey, String allParamVauleExceptChecksum, String checksumReceived)
    {

        byte[] dataToEncryptByte = Encoding.UTF8.GetBytes(allParamVauleExceptChecksum);
        byte[] keyBytes = Encoding.UTF8.GetBytes(secretKey);
        HMACSHA256 hmacsha256 = new HMACSHA256(keyBytes);
        byte[] checksumCalculatedByte = hmacsha256.ComputeHash(dataToEncryptByte); ;
        String checksumCalculated = toHex(checksumCalculatedByte);

        if (checksumReceived.Equals(checksumCalculated))
        {
            return true;
        }
        else
        {
            return false;
        }

    }

    public static string getChecksumString(HttpRequest Request)
    {
          String checksumString = "";
            // System.Text.StringBuilder displayValues = new System.Text.StringBuilder();

            String email = Request.Form["email"];
            String cell = Request.Form["cell"];
            String redirecturl = Request.Form["redirecturl"];
            String amount = Request.Form["amt"];
            String orderid = Request.Form["orderid"];
            String mid = Request.Form["mid"];

            checksumString = "'" + amount + "''" + orderid + "''" + mid+ "'";

            return checksumString;


    }
}