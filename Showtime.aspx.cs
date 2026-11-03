using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;

namespace Bro_Screen_Cinemas
{
    public partial class buynow : System.Web.UI.Page
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

                    // Load showtimes for this movie
                    LoadShowtimes(movieId);
                }
            }
        }

        private void LoadMovieData(string movieId)
        {
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
                        title.Text = reader["Title"].ToString();
                        releaseDate.Text = Convert.ToDateTime(reader["ReleaseDate"]).ToString("yyyy-MM-dd");
                        language.Text = reader["Language"].ToString();
                        duration.Text = reader["Duration"].ToString();
                        subtitles.Text = reader["Subtitle"].ToString();
                        genre.Text = reader["Genre"].ToString();
                        classification.Text = reader["Classification"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }

        private void LoadShowtimes(string movieId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT 
                        c.Outlet AS CinemaName, 
                        c.City, 
                        s.Date, 
                        s.Time
                    FROM Showtime s
                    JOIN Cinema c ON s.CinemaID = c.CinemaID
                    JOIN Movie m ON s.MovieID = m.MovieID
                    WHERE s.MovieID = @MovieID
                    ORDER BY s.Date, s.Time";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@MovieID", movieId);

                try
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    // Convert data to JSON format
                    var showtimeData = new Dictionary<string, List<object>>();

                    foreach (DataRow row in dt.Rows)
                    {
                        string date = Convert.ToDateTime(row["Date"]).ToString("yyyy-MM-dd");

                        if (!showtimeData.ContainsKey(date))
                        {
                            showtimeData[date] = new List<object>();
                        }

                        showtimeData[date].Add(new
                        {
                            cinema = $"{row["CinemaName"]}, {row["City"]}",
                            time = row["Time"].ToString()
                        });
                    }

                    // Serialize to JSON
                    var serializer = new JavaScriptSerializer();
                    string json = serializer.Serialize(showtimeData);

                    // Inject JSON into front end
                    ClientScript.RegisterStartupScript(this.GetType(), "showtimeData", $"var showtimeData = {json};", true);
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }
    }
}