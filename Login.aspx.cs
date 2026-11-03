using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bro_Screen_Cinemas
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_LoggedIn(object sender, EventArgs e)
        {
            try
            {
                string username = Login1.UserName;

                Session["IsLoggedIn"] = true;  
                Session["username"] = username;

                // Example role-based redirection
                if (Roles.IsUserInRole(username, "admin"))
                {
                    Response.Redirect("/Admin/Dashboard.aspx");
                }
                else
                {
                    Response.Redirect("Homepage.aspx");
                }
            }
            catch (Exception ex)
            {
                Login1.FailureText = $"An error occurred: {ex.Message}";
            }

        }
    }
}