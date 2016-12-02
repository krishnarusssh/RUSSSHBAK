<%@ WebHandler Language="C#" Class="Upload" %>

using System;
using System.Web;

public class Upload : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{


    public void ProcessRequest(HttpContext context)
    {

        string Name = "";
        string ImgBase64 = context.Session["imgsession"].ToString();
        string ClientXMl = "N";

        if (context.Request.QueryString["imageData"] != "" && context.Request.QueryString["imageData"] != null)
        {
            ImgBase64 = context.Request.QueryString["imageData"];
        }
        string fileNameWitPath = "../TaskImages/" + Name + ".png";
        if (Name != "" && ImgBase64 != "")
        {
            using (System.IO.FileStream fs = new System.IO.FileStream(fileNameWitPath, System.IO.FileMode.Create))
            {
                using (System.IO.BinaryWriter bw = new System.IO.BinaryWriter(fs))
                {
                    byte[] data = Convert.FromBase64String(ImgBase64);
                    bw.Write(data);
                    bw.Close();
                    ClientXMl = "Y";

                }
            }
        }
        context.Response.Write(ClientXMl);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}