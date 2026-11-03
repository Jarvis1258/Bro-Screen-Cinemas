using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Bro_Screen_Cinemas
{
    public partial class AddBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Any required actions during initial page load
            }
        }

        /// <summary>
        /// Event handler for the Add Booking button
        /// </summary>
        protected void btnAddBooking_Click(object sender, EventArgs e)
        {
            // Retrieve user inputs
            string seats = txtSeats.Text.Trim();
            string food = txtFood.Text.Trim();
            string people = txtPeople.Text.Trim();
            string totalAmountText = txtTotalAmount.Text.Trim();
            string paymentMethod = ddlPaymentMethod.SelectedValue;
            decimal totalAmount;

            // Validate total amount
            if (!decimal.TryParse(totalAmountText, out totalAmount))
            {
                lblStatus.Text = "Invalid Total Amount. Please enter a valid number.";
                lblStatus.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Insert into database
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Generate the next BookingID
                string newBookingID = GenerateBookingID(connection);

                string query = @"
                    INSERT INTO Bookings (BookingID, Seats, Food, People, TotalAmount, PaymentMethod, BookingDate)
                    VALUES (@BookingID, @Seats, @Food, @People, @TotalAmount, @PaymentMethod, @BookingDate)";
                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.AddWithValue("@BookingID", newBookingID);
                command.Parameters.AddWithValue("@Seats", seats);
                command.Parameters.AddWithValue("@Food", food);
                command.Parameters.AddWithValue("@People", people);
                command.Parameters.AddWithValue("@TotalAmount", totalAmount);
                command.Parameters.AddWithValue("@PaymentMethod", paymentMethod);
                command.Parameters.AddWithValue("@BookingDate", DateTime.Now);

                try
                {
                    command.ExecuteNonQuery();
                    lblStatus.Text = "Booking added successfully!";
                    lblStatus.ForeColor = System.Drawing.Color.Green;

                    // Clear fields
                    txtSeats.Text = "";
                    txtFood.Text = "";
                    txtPeople.Text = "";
                    txtTotalAmount.Text = "";
                    ddlPaymentMethod.SelectedIndex = 0;
                }
                catch (Exception ex)
                {
                    lblStatus.Text = "Error: " + ex.Message;
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        /// <summary>
        /// Generates the next BookingID in the format "BK001".
        /// </summary>
        /// <param name="connection">The database connection.</param>
        /// <returns>The next BookingID.</returns>
        private string GenerateBookingID(SqlConnection connection)
        {
            string query = "SELECT TOP 1 BookingID FROM Bookings ORDER BY BookingID DESC";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                object result = command.ExecuteScalar();

                if (result != null)
                {
                    // Extract numeric part and increment it
                    string currentID = result.ToString(); // e.g., "BK001"
                    int numericPart = int.Parse(currentID.Substring(2));
                    return $"BK{(numericPart + 1).ToString("D3")}";
                }
                else
                {
                    // Start from BK001 if no rows exist
                    return "BK001";
                }
            }
        }

        /// <summary>
        /// Event handler for the Cancel button
        /// </summary>
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Bookings.aspx");
        }
    }
}