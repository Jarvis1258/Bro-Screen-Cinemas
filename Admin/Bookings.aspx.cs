using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bro_Screen_Cinemas
{
    public partial class Bookings : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookings();
            }
        }

        /// <summary>
        /// Loads all bookings from the database and binds them to the GridView.
        /// </summary>
        private void LoadBookings()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT BookingID, Seats, Food, People, TotalAmount, PaymentMethod, BookingDate FROM Bookings ORDER BY BookingID ASC";
                SqlCommand command = new SqlCommand(query, connection);

                try
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    // Bind data to GridView
                    gvBookings.DataSource = dataTable;
                    gvBookings.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error loading bookings: {ex.Message}');</script>");
                }
            }
        }

        /// <summary>
        /// Handles row-level commands like deleting a booking.
        /// </summary>
        protected void gvBookings_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                string bookingId = e.CommandArgument.ToString();
                DeleteBooking(bookingId);
            }
        }

        /// <summary>
        /// Deletes a booking from the database based on the BookingID.
        /// </summary>
        /// <param name="bookingId">The ID of the booking to delete.</param>
        private void DeleteBooking(string bookingId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Bookings WHERE BookingID = @BookingID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@BookingID", bookingId);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();

                    // Reload bookings to reflect the deletion
                    LoadBookings();
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error deleting booking: {ex.Message}');</script>");
                }
            }
        }

        protected void gvBookings_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // This event must exist even if you don't use it. Just leave it empty.
        }
    }
}