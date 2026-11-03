using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bro_Screen_Cinemas
{
    public partial class Users : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAdmins();
                LoadCustomers();
            }
        }

        private void LoadAdmins()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT AdminID, UserName, Email, FullName, PhoneNumber, Role FROM Admin";
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                gvAdmins.DataSource = dt;
                gvAdmins.DataBind();
            }
        }

        private void LoadCustomers()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT FormattedCustomerID, UserName, Email, FullName, PhoneNumber FROM Customer";
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                gvCustomers.DataSource = dt;
                gvCustomers.DataBind();
            }
        }

        protected void gvAdmins_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteAdmin")
            {
                string adminId = e.CommandArgument.ToString();
                DeleteAdmin(adminId);
                LoadAdmins();
            }
        }

        protected void gvCustomers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "PromoteCustomer")
            {
                string customerId = e.CommandArgument.ToString();
                PromoteCustomerToAdmin(customerId);
                LoadAdmins();
                LoadCustomers();
            }
            else if (e.CommandName == "DeleteCustomer")
            {
                string customerId = e.CommandArgument.ToString();
                DeleteCustomer(customerId);
                LoadCustomers();
            }
        }

        private void DeleteAdmin(string adminId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Admin WHERE AdminID = @AdminID";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@AdminID", adminId);

                connection.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private void PromoteCustomerToAdmin(string customerId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string selectQuery = "SELECT UserName, FullName, Email, PhoneNumber FROM Customer WHERE FormattedCustomerID = @CustomerID";
                SqlCommand selectCmd = new SqlCommand(selectQuery, connection);
                selectCmd.Parameters.AddWithValue("@CustomerID", customerId);

                connection.Open();
                SqlDataReader reader = selectCmd.ExecuteReader();

                if (reader.Read())
                {
                    string userName = reader["UserName"].ToString();
                    string fullName = reader["FullName"].ToString();
                    string email = reader["Email"].ToString();
                    string phoneNumber = reader["PhoneNumber"].ToString();
                    reader.Close();

                    string insertQuery = @"
                        INSERT INTO Admin (AdminID, UserName, FullName, Email, PhoneNumber, Role)
                        VALUES (@AdminID, @UserName, @FullName, @Email, @PhoneNumber, 'Admin')";

                    SqlCommand insertCmd = new SqlCommand(insertQuery, connection);
                    insertCmd.Parameters.AddWithValue("@AdminID", GenerateAdminID(connection));
                    insertCmd.Parameters.AddWithValue("@UserName", userName);
                    insertCmd.Parameters.AddWithValue("@FullName", fullName);
                    insertCmd.Parameters.AddWithValue("@Email", email);
                    insertCmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);

                    insertCmd.ExecuteNonQuery();
                }
            }
        }

        private void DeleteCustomer(string customerId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Customer WHERE FormattedCustomerID = @CustomerID";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@CustomerID", customerId);

                connection.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private string GenerateAdminID(SqlConnection connection)
        {
            string query = "SELECT ISNULL(MAX(CAST(SUBSTRING(AdminID, 3, LEN(AdminID) - 2) AS INT)), 0) + 1 FROM Admin";
            SqlCommand cmd = new SqlCommand(query, connection);
            int nextId = (int)cmd.ExecuteScalar();
            return $"AD{nextId:D3}";
        }
    }
}
