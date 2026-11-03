using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Bro_Screen_Cinemas
{
    public partial class EditAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string adminId = Request.QueryString["AdminID"];
                if (!string.IsNullOrEmpty(adminId))
                {
                    LoadAdminDetails(adminId);
                }
                else
                {
                    Response.Redirect("Users.aspx");
                }
            }
        }

        private void LoadAdminDetails(string adminId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT AdminID, UserName, FullName, Email, PhoneNumber, CinemaID, Role FROM Admin WHERE AdminID = @AdminID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@AdminID", adminId);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        lblAdminID.Text = $"Admin ID: {reader["AdminID"]}";
                        txtUserName.Text = reader["UserName"].ToString();
                        txtFullName.Text = reader["FullName"].ToString();
                        txtEmail.Text = reader["Email"].ToString();
                        txtPhoneNumber.Text = reader["PhoneNumber"].ToString();
                        ddlCinemaID.SelectedValue = reader["CinemaID"].ToString();
                        ddlRole.SelectedValue = reader["Role"].ToString();
                    }
                    else
                    {
                        Response.Redirect("Users.aspx");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error loading admin details: {ex.Message}');</script>");
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string adminId = Request.QueryString["AdminID"];
            string userName = txtUserName.Text;
            string fullName = txtFullName.Text;
            string email = txtEmail.Text;
            string phoneNumber = txtPhoneNumber.Text;
            string cinemaId = ddlCinemaID.SelectedValue;
            string role = ddlRole.SelectedValue;

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    UPDATE Admin
                    SET UserName = @UserName, FullName = @FullName, Email = @Email, 
                        PhoneNumber = @PhoneNumber, CinemaID = @CinemaID, Role = @Role
                    WHERE AdminID = @AdminID";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@AdminID", adminId);
                command.Parameters.AddWithValue("@UserName", userName);
                command.Parameters.AddWithValue("@FullName", fullName);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                command.Parameters.AddWithValue("@CinemaID", cinemaId);
                command.Parameters.AddWithValue("@Role", role);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    Response.Redirect("Users.aspx");
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error saving admin details: {ex.Message}');</script>");
                }
            }
        }
    }
}