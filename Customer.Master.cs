using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bro_Screen_Cinemas
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is logged in
            if (Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"])
            {
                // The user is logged in
                string username = Session["UserName"].ToString();
                lblUsername.Text = username;

                btnUsername.Attributes["style"] = "display: block";
                btnLogin.Attributes["style"] = "display: none";
            }
            else
            {
                btnLogin.Attributes["style"] = "display: block";
                btnUsername.Attributes["style"] = "display: none";
            }

        }
    }
}