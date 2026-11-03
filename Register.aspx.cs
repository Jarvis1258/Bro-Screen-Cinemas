using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bro_Screen_Cinemas
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            // Get the newly created user's Membership information
            MembershipUser newUser = Membership.GetUser(CreateUserWizard1.UserName);

            if (newUser != null)
            {

                // Get the UserID (GUID) of the newly created user
                Guid userId = (Guid)newUser.ProviderUserKey;

                // Get additional information from the CreateUserWizard
                string email = CreateUserWizard1.Email;
                string username = CreateUserWizard1.UserName;
                string password = CreateUserWizard1.Password;

                // Insert data into the Customer table
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string query = "INSERT INTO Customer (UserId, UserName, Email, Password) VALUES (@UserId, @Username, @Email, @Password)";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters
                        command.Parameters.AddWithValue("@UserId", userId);
                        command.Parameters.AddWithValue("@Username", username);
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@Password", password);

                        // Open connection and execute query
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }
            }

        }
    }
}