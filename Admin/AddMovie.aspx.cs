using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bro_Screen_Cinemas
{
    public partial class AddMovie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Retrieve user inputs
            string movieId = txtMovieID.Text;
            string title = txtTitle.Text;
            string releaseDate = txtReleaseDate.Text;
            string duration = txtDuration.Text;
            string language = txtLanguage.Text;
            string subtitle = txtSubtitle.Text;
            string genre = txtGenre.Text;
            string classification = txtClassification.Text;
            byte[] imageBytes = null;

            // Convert uploaded file to byte array
            using (Stream fileStream = filePoster.PostedFile.InputStream)
            {
                using (BinaryReader reader = new BinaryReader(fileStream))
                {
                    imageBytes = reader.ReadBytes((int)fileStream.Length);
                }
            }

            // Insert into database
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Movie(MovieID, Title, ReleaseDate, Duration, Language, Subtitle, Genre, Classification, Poster) VALUES (@MovieID, @Title, @ReleaseDate, @Duration, @Language, @Subtitle, @Genre, @Classification, @Poster)";
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
                    command.ExecuteNonQuery();
                    lblStatus.Text = "Movie added successfully!";
                    lblStatus.ForeColor = System.Drawing.Color.Green;

                    // Clear fields
                    txtMovieID.Text = "";
                    txtTitle.Text = "";
                    txtReleaseDate.Text = "";
                    txtDuration.Text = "";
                    txtLanguage.Text = "";
                    txtSubtitle.Text = "";
                    txtGenre.Text = "";
                    txtClassification.Text = "";
                }
                catch (Exception ex)
                {
                    lblStatus.Text = "Error: " + ex.Message;
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("MovieList.aspx");
        }
    }
}