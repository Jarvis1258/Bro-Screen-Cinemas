using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Bro_Screen_Cinemas
{
    public partial class EditCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string customerId = Request.QueryString["CustomerID"];
                if (!string.IsNullOrEmpty(customerId))
                {
                    hfCustomerID.Value = customerId;
                    LoadCustomerDetails(customerId);
                }
                else
                {
                    lblStatus.Text = "Customer ID is missing.";
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        private void LoadCustomerDetails(string customerId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT UserName, FullName, Email, PhoneNumber, 
                           DateOfBirth, FavoriteGenres, PreferredCinema
                    FROM Customer 
                    WHERE FormattedCustomerID = @CustomerID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@CustomerID", customerId);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        txtUsername.Text = reader["UserName"].ToString();
                        txtFullName.Text = reader["FullName"].ToString();
                        txtEmail.Text = reader["Email"].ToString();
                        txtPhoneNumber.Text = reader["PhoneNumber"].ToString();
                        txtDateOfBirth.Text = reader["DateOfBirth"].ToString();
                        txtFavoriteGenres.Text = reader["FavoriteGenres"].ToString();
                        ddlPreferredCinema.SelectedValue = reader["PreferredCinema"].ToString();
                    }
                    else
                    {
                        lblStatus.Text = "Customer not found.";
                        lblStatus.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch (Exception ex)
                {
                    lblStatus.Text = $"Error loading customer: {ex.Message}";
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string customerId = hfCustomerID.Value;
            string username = txtUsername.Text;
            string fullName = txtFullName.Text;
            string email = txtEmail.Text;
            string phoneNumber = txtPhoneNumber.Text;
            string dateOfBirth = txtDateOfBirth.Text;
            string favoriteGenres = txtFavoriteGenres.Text;
            string preferredCinema = ddlPreferredCinema.SelectedValue;

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    UPDATE Customer
                    SET UserName = @UserName,
                        FullName = @FullName,
                        Email = @Email,
                        PhoneNumber = @PhoneNumber,
                        DateOfBirth = @DateOfBirth,
                        FavoriteGenres = @FavoriteGenres,
                        PreferredCinema = @PreferredCinema
                    WHERE FormattedCustomerID = @CustomerID";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@UserName", username);
                command.Parameters.AddWithValue("@FullName", fullName);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                command.Parameters.AddWithValue("@DateOfBirth", dateOfBirth);
                command.Parameters.AddWithValue("@FavoriteGenres", favoriteGenres);
                command.Parameters.AddWithValue("@PreferredCinema", preferredCinema);
                command.Parameters.AddWithValue("@CustomerID", customerId);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    lblStatus.Text = "Customer updated successfully!";
                    lblStatus.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex)
                {
                    lblStatus.Text = $"Error updating customer: {ex.Message}";
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Users.aspx");
        }
    }
}
