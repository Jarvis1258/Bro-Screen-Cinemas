using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Bro_Screen_Cinemas
{
    public partial class ViewCustomerDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string customerId = Request.QueryString["CustomerID"];
                if (!string.IsNullOrEmpty(customerId))
                {
                    LoadCustomerDetails(customerId);
                }
            }
        }

        private void LoadCustomerDetails(string customerId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Customer WHERE FormattedCustomerID = @CustomerID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@CustomerID", customerId);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        lblCustomerID.Text = reader["FormattedCustomerID"].ToString();
                        lblUsername.Text = reader["UserName"].ToString();
                        lblFullName.Text = reader["FullName"].ToString();
                        lblEmail.Text = reader["Email"].ToString();
                        lblPhoneNumber.Text = reader["PhoneNumber"].ToString();
                        lblDateOfBirth.Text = reader["DateOfBirth"].ToString();
                        lblFavoriteGenres.Text = reader["FavoriteGenres"].ToString();
                        lblPreferredCinema.Text = reader["PreferredCinema"].ToString();
                        lblNotification.Text = reader["Notification"].ToString();

                        byte[] profilePic = reader["ProfilePic"] as byte[];
                        if (profilePic != null && profilePic.Length > 0)
                        {
                            string base64String = Convert.ToBase64String(profilePic);
                            imgProfilePic.ImageUrl = "data:image/png;base64," + base64String;
                        }
                        else
                        {
                            imgProfilePic.ImageUrl = "~/images/default-profile.png"; // Default image path
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error loading customer details: {ex.Message}');</script>");
                }
            }
        }
    }
}