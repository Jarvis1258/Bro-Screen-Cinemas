using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bro_Screen_Cinemas
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string movieId = Request.QueryString["MovieID"];
                if (!string.IsNullOrEmpty(movieId))
                {
                    LoadMovieData(movieId);
                    moviePoster.ImageUrl = "ImageHandler.ashx?MovieID=" + movieId;
                }


            }
        }

        private void LoadMovieData(string movieId)
        {
            string date = Request.QueryString["Date"];
            string time = Request.QueryString["Time"];
            string cinema = Request.QueryString["Cinema"];
            lblLocation.Text = cinema;
            lblDate.Text = date + ", " + time;

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Movie WHERE MovieID = @MovieID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@MovieID", movieId);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        lblTitle.Text = reader["Title"].ToString();
                        lblDuration.Text = reader["Duration"].ToString();
                        lblGenre.Text = reader["Genre"].ToString();
                        lblClassification.Text = reader["Classification"].ToString();
                    }
                    else
                    {
                        //lblStatus.Text = "Movie not found.";
                        //lblStatus.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch (Exception ex)
                {
                    //lblStatus.Text = "Error: " + ex.Message;
                    //lblStatus.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            // Retrieve details from localStorage using hidden inputs or form values
            string seats = Request.Form["hiddenSeat"];
            string food = Request.Form["hiddenFood"];
            string people = Request.Form["hiddenPeople"];
            string totalAmount = Request.Form["grandTotal"];
            string paymentMethod = Request.Form["payment-method"];

            // Insert booking data into the database
            SaveBookingToDatabase(seats, food, people, totalAmount, paymentMethod);

            // Redirect to confirmation or another page
            Response.Redirect("Homepage.aspx");
        }

        private void SaveBookingToDatabase(string seats, string food, string people, string totalAmount, string paymentMethod)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Generate new BookingID
                string newBookingID = GenerateBookingID(connection);

                string query = @"
        INSERT INTO Bookings (BookingID, Seats, Food, People, TotalAmount, PaymentMethod, BookingDate)
        VALUES (@BookingID, @Seats, @Food, @People, @TotalAmount, @PaymentMethod, @BookingDate)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@BookingID", newBookingID);
                    command.Parameters.AddWithValue("@Seats", seats);
                    command.Parameters.AddWithValue("@Food", food);
                    command.Parameters.AddWithValue("@People", people);

                    if (decimal.TryParse(totalAmount, out decimal parsedTotalAmount))
                    {
                        command.Parameters.AddWithValue("@TotalAmount", parsedTotalAmount);
                    }
                    else
                    {
                        throw new ArgumentException("Invalid TotalAmount value. Unable to parse as decimal.");
                    }

                    command.Parameters.AddWithValue("@PaymentMethod", paymentMethod);
                    command.Parameters.AddWithValue("@BookingDate", DateTime.Now);

                    command.ExecuteNonQuery();
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
    }
}