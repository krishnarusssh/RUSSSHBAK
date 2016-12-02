using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Web;

/// <summary>
/// Summary description for MyExtenstionMethods
/// </summary>
public static class MyExtenstionMethods
{
    //JpMomXxUanc= is encrypted string with passphrase RUSSSH and string RUSSSH
    const string passphrase = "JpMomXxUanc=";
    public static string Sanatize(this string Text)
    {
        Text = Text.Replace("&lt;", "<");
        Text = Text.Replace("&gt;", ">");
        Text = Text.Replace("'", " ");
        Text = Text.Replace("\t", "");
        //string regEx = "<.*?>.*?</.*?>";
        string regEx = "<(.|\n)*?>";
        string tagless = Regex.Replace(Text, regEx, string.Empty);
        tagless = Regex.Replace(tagless, @"\<[^\<\>]*\>", String.Empty);
        tagless = tagless.Replace("<", string.Empty).Replace(">", string.Empty);
        Text = tagless.Trim();
        //if (Text == "" || Text == null) throw new Exception("string can not be empty after applying ToClear() to it.");
        return Text;
    }
    public static string EncryptString(string Message)
    {
        byte[] Results;
        System.Text.UTF8Encoding UTF8 = new System.Text.UTF8Encoding();
        MD5CryptoServiceProvider HashProvider = new MD5CryptoServiceProvider();
        byte[] TDESKey = HashProvider.ComputeHash(UTF8.GetBytes(passphrase));
        TripleDESCryptoServiceProvider TDESAlgorithm = new TripleDESCryptoServiceProvider();
        TDESAlgorithm.Key = TDESKey;
        TDESAlgorithm.Mode = CipherMode.ECB;
        TDESAlgorithm.Padding = PaddingMode.PKCS7;
        byte[] DataToEncrypt = UTF8.GetBytes(Message);
        try
        {
            ICryptoTransform Encryptor = TDESAlgorithm.CreateEncryptor();
            Results = Encryptor.TransformFinalBlock(DataToEncrypt, 0, DataToEncrypt.Length);
        }
        finally
        {
            TDESAlgorithm.Clear();
            HashProvider.Clear();
        }
        return Convert.ToBase64String(Results);
    }

    public static string DecryptString(string Message)
    {
        byte[] Results;
        System.Text.UTF8Encoding UTF8 = new System.Text.UTF8Encoding();
        MD5CryptoServiceProvider HashProvider = new MD5CryptoServiceProvider();
        byte[] TDESKey = HashProvider.ComputeHash(UTF8.GetBytes(passphrase));
        TripleDESCryptoServiceProvider TDESAlgorithm = new TripleDESCryptoServiceProvider();
        TDESAlgorithm.Key = TDESKey;
        TDESAlgorithm.Mode = CipherMode.ECB;
        TDESAlgorithm.Padding = PaddingMode.PKCS7;
        byte[] DataToDecrypt = Convert.FromBase64String(Message.Trim().Replace(" ","+"));
        try
        {
            ICryptoTransform Decryptor = TDESAlgorithm.CreateDecryptor();
            Results = Decryptor.TransformFinalBlock(DataToDecrypt, 0, DataToDecrypt.Length);
        }
        finally
        {
            TDESAlgorithm.Clear();
            HashProvider.Clear();
        }
        return UTF8.GetString(Results);
    }
    
        public static string GetLast(this string source, int tail_length)
        {
            if (tail_length >= source.Length)
                return source;
            return source.Substring(source.Length - tail_length);
        }
}