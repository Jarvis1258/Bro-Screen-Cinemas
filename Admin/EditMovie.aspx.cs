using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bro_Screen_Cinemas
{
    public partial class Edit_Movie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string movieId = Request.QueryString["MovieID"];
                if (!string.IsNullOrEmpty(movieId))
                {
                    LoadMovieData(movieId);
                    imgPoster.ImageUrl = "/ImageHandler.ashx?MovieID=" + movieId;
                }
                else
                {
                    lblStatus.Text = "Invalid Movie ID.";
                    lblStatus.ForeColor = System.Drawing.Color.Red;
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
                        txtMovieID.Text = reader["MovieID"].ToString();
                        txtTitle.Text = reader["Title"].ToString();
                        txtReleaseDate.Text = reader["ReleaseDate"].ToString();
                        txtDuration.Text = reader["Duration"].ToString();
                        txtLanguage.Text = reader["Language"].ToString();
                        txtSubtitle.Text = reader["Subtitle"].ToString();
                        txtGenre.Text = reader["Genre"].ToString();
                        txtClassification.Text = reader["Classification"].ToString();
                    }
                    else
                    {
                        lblStatus.Text = "Movie not found.";
                        lblStatus.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch (Exception ex)
                {
                    lblStatus.Text = "Error: " + ex.Message;
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string movieId = txtMovieID.Text;
            string title = txtTitle.Text;
            string releaseDate = txtReleaseDate.Text;
            string duration = txtDuration.Text;
            string language = txtLanguage.Text;
            string subtitle = txtSubtitle.Text;
            string genre = txtGenre.Text;
            string classification = txtClassification.Text;
            byte[] imageBytes = filePoster.FileBytes;

            // Convert uploaded file to byte array
            using (Stream fileStream = filePoster.PostedFile.InputStream)
            {
                using (BinaryReader reader = new BinaryReader(fileStream))
                {
                    imageBytes = reader.ReadBytes((int)fileStream.Length);
                }
            }

            // Validation for null fields
            if (string.IsNullOrEmpty(movieId) || string.IsNullOrEmpty(title))
            {
                lblStatus.Text = "Please enter valid values for all fields.";
                lblStatus.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE Movie SET Title = @Title, ReleaseDate = @ReleaseDate, Duration = @Duration, Language = @Language, Subtitle = @Subtitle, Genre = @Genre, Classification = @Classification, Poster = @Poster WHERE MovieID = @MovieID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Title", title);
                command.Parameters.AddWithValue("@ReleaseDate", releaseDate);
                command.Parameters.AddWithValue("@Duration", duration);
                command.Parameters.AddWithValue("@Language", language);
                command.Parameters.AddWithValue("@Subtitle", subtitle);
                command.Parameters.AddWithValue("@Genre", genre);
                command.Parameters.AddWithValue("@Classification", classification);
                command.Parameters.AddWithValue("@MovieID", movieId);
                command.Parameters.AddWithValue("@Poster", imageBytes);

                try
                {
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        lblStatus.Text = "Movie updated successfully!";
                        lblStatus.ForeColor = System.Drawing.Color.Green;
                        Response.Redirect("MovieList.aspx");
                    }
                    else
                    {
                        lblStatus.Text = "Update failed.";
                        lblStatus.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch (Exception ex)
                {
                    lblStatus.Text = "Error: " + ex.Message;
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }
            }


        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("MovieList.aspx");
        }
    }
}