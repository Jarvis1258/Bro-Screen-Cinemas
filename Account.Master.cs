using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bro_Screen_Cinemas
{
    public partial class Account1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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

                MembershipUser currentUser = Membership.GetUser();

                if (currentUser != null)
                {
                    Guid userId = (Guid)currentUser.ProviderUserKey;

                    string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        string query = "SELECT * FROM Customer WHERE UserId = @UserId";
                        SqlCommand command = new SqlCommand(query, connection);
                        command.Parameters.AddWithValue("@UserId", userId);

                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.Read())
                        {
                            string custID = reader["FormattedCustomerID"].ToString();
                            lblFullName.Text = reader["FullName"].ToString();
                            editProfile.NavigateUrl = "EditProfile.aspx?CustID=" + custID;
                            profilePic.ImageUrl = "/ImageHandler.ashx?CustID=" + custID;
                        }

                    }
                }
            }
        }
        private int GetCurrentPoints()
        {
            // Example: Fetch the user's current points from a database or session
            // Replace this with actual logic
            return 50000; // Dummy data
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear the session
            Session.Clear();
            Session.Abandon();

            // If using FormsAuthentication, sign the user out
            FormsAuthentication.SignOut();

            // Redirect to the Login page
            Response.Redirect("~/Login.aspx");
        }
    }
}