using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bro_Screen_Cinemas
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string custID = Request.QueryString["CustID"];
                LoadInfo();
                imgProfilePic.ImageUrl = "/ImageHandler.ashx?CustID=" + custID;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text;
            string email = txtEmail.Text;
            string phoneNumber = txtPhoneNumber.Text;
            string dateOfBirth = txtDateOfBirth.Text;

            // Join selected genres into a comma-separated string
            string favoriteGenres = string.Join(",", chkFavoriteGenres.Items
                                                   .Cast<ListItem>()
                                                   .Where(item => item.Selected)
                                                   .Select(item => item.Value));

            // Join selected notification preferences into a comma-separated string
            string notificationPreferences = string.Join(",", chkNotificationPreferences.Items
                                                                  .Cast<ListItem>()
                                                                  .Where(item => item.Selected)
                                                                  .Select(item => item.Value));
            MembershipUser currentUser = Membership.GetUser();
            Guid userId = (Guid)currentUser.ProviderUserKey;
            string cinema = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            string query = "UPDATE Customer SET FullName = @FullName, Email = @Email, PhoneNumber = @PhoneNumber, DateOfBirth = @DateOfBirth, FavoriteGenres = @FavoriteGenres, PreferredCinema = @PreferredCinema, Notification = @Notification WHERE UserId = @UserId";

            try
            {
                using (SqlConnection connection = new SqlConnection(cinema))
                {
                    SqlCommand command = new SqlCommand(query, connection);


                    // Add parameters to prevent SQL injection
                    command.Parameters.AddWithValue("@FullName", fullName);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                    command.Parameters.AddWithValue("@DateOfBirth", dateOfBirth);
                    command.Parameters.AddWithValue("@FavoriteGenres", string.IsNullOrEmpty(favoriteGenres) ? DBNull.Value : (object)favoriteGenres);
                    command.Parameters.AddWithValue("@PreferredCinema", ddlPreferredCinema.SelectedValue);
                    command.Parameters.AddWithValue("@Notification", string.IsNullOrEmpty(notificationPreferences) ? DBNull.Value : (object)notificationPreferences);
                    command.Parameters.AddWithValue("@UserId", userId.ToString());

                    // Open the connection and execute the update query
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();

                    // Check if the update was successful
                    if (rowsAffected > 0)
                    {
                        lblStatus.Text = "Changes saved successfully!";
                        lblStatus.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblStatus.Text = "Failed to save changes. Please try again.";
                        lblStatus.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
            catch (Exception ex)
            {
                // Display the error message
                lblStatus.Text = "Error: " + ex.Message;
                lblStatus.ForeColor = System.Drawing.Color.Red;
                Debug.WriteLine("Error: " + ex.Message);
            }

            if (fileProfilePic.HasFile)
            {

                try
                {
                    // Convert the uploaded file into a byte array
                    byte[] imageBytes = fileProfilePic.FileBytes;

                    // Convert uploaded file to byte array
                    using (Stream fileStream = fileProfilePic.PostedFile.InputStream)
                    {
                        using (BinaryReader reader = new BinaryReader(fileStream))
                        {
                            imageBytes = reader.ReadBytes((int)fileStream.Length);
                        }
                    }
                    string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        string query1 = "UPDATE Customer SET ProfilePic = @ProfilePic WHERE UserId = @UserId";

                        using (SqlCommand command = new SqlCommand(query1, connection))
                        {
                            Debug.WriteLine("testing");
                            // Add parameters to prevent SQL injection
                            command.Parameters.AddWithValue("@ProfilePic", imageBytes);
                            command.Parameters.AddWithValue("@UserId", userId); // Ensure you're passing the correct user ID here


                            connection.Open();
                            command.ExecuteNonQuery();
                            connection.Close();
                        }
                    }

                    // Success message
                    lblStatus.Text = "Profile picture updated successfully!";
                    lblStatus.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex)
                {
                    // Handle errors
                    lblStatus.Text = "Error: " + ex.Message;
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }
            }
            Response.Redirect("Account.aspx");
        }


        private void LoadInfo()
        {
            // Get the currently logged-in user
            MembershipUser currentUser = Membership.GetUser();

            if (currentUser != null)
            {
                // Get the UserId
                Guid userId = (Guid)currentUser.ProviderUserKey;

                string membership = ConfigurationManager.ConnectionStrings["Membership"].ConnectionString;
                string cinema = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(membership))
                {
                    string query = "Select CreateDate, LastLoginDate FROM aspnet_Membership WHERE UserId = @UserId";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@UserId", userId.ToString());

                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.Read())
                        {
                            txtAccountCreationDate.Text = reader["CreateDate"].ToString();
                            txtLastLoginDate.Text = reader["LastLoginDate"].ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                        lblStatus.Text = "Error: " + ex.Message;
                        lblStatus.ForeColor = System.Drawing.Color.Red;
                    }
                }

                using (SqlConnection connection = new SqlConnection(cinema))
                {
                    // Define the query to fetch the customer data based on the logged-in user's UserId
                    string query1 = "SELECT * FROM Customer WHERE UserId = @UserId";
                    string query2 = "SELECT DISTINCT Genre FROM Movie";

                    SqlCommand command1 = new SqlCommand(query1, connection);
                    SqlCommand command2 = new SqlCommand(query2, connection);

                    // Add parameter to prevent SQL injection
                    command1.Parameters.AddWithValue("@UserId", userId.ToString());

                    try
                    {
                        connection.Open();

                        using (SqlDataReader read = command2.ExecuteReader())
                        {
                            // Bind the CheckBoxList
                            chkFavoriteGenres.DataSource = read;
                            chkFavoriteGenres.DataTextField = "Genre"; // Display text
                            chkFavoriteGenres.DataValueField = "Genre"; // Value
                            chkFavoriteGenres.DataBind();
                        }

                        SqlDataReader reader = command1.ExecuteReader();

                        if (reader.Read())
                        {
                            txtFullName.Text = reader["FullName"].ToString();
                            txtEmail.Text = reader["Email"].ToString();
                            txtPhoneNumber.Text = reader["PhoneNumber"].ToString();
                            txtDateOfBirth.Text = reader["DateOfBirth"].ToString();

                            // Populate Favorite Genres (assuming genres are stored as comma-separated values in the database)
                            string[] genres = reader["FavoriteGenres"].ToString().Split(',');
                            foreach (ListItem item in chkFavoriteGenres.Items)
                            {
                                item.Selected = genres.Contains(item.Value);
                            }

                            // Populate Preferred Cinema
                            ddlPreferredCinema.SelectedValue = reader["PreferredCinema"].ToString();

                            // Populate Notification Preferences (assuming preferences are stored as comma-separated values in the database)
                            string[] notifications = reader["Notification"].ToString().Split(',');
                            foreach (ListItem item in chkNotificationPreferences.Items)
                            {
                                item.Selected = notifications.Contains(item.Value);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // Display error message if an exception occurs
                        lblStatus.Text = "Error: " + ex.Message;
                        lblStatus.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Account.aspx");
        }
    }
}