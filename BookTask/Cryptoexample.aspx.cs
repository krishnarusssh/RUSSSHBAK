using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BookTask_Cryptoexample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnencrypt_Click(object sender, EventArgs e)
    {
        estr.Text = MyExtenstionMethods.EncryptString(txtdecrypt.Text);
    }
    protected void btndrcrypt_Click(object sender, EventArgs e)
    {
        dstr.Text = MyExtenstionMethods.DecryptString(txtdecrypt.Text);
    }
}