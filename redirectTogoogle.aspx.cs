using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASPSnippets.GoogleAPI;

public partial class redirectTogoogle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GoogleConnect.ClientId = "91098301541-s3bl45ll36gqgntna70h05buolath3jv.apps.googleusercontent.com";
        GoogleConnect.ClientSecret = "ePZO2QHUiEu-DDLOy4syg2MY";
        GoogleConnect.RedirectUri = "https://www.russsh.com/GoogleReturn.aspx";
        GoogleConnect.Authorize("profile", "email");
    }
}