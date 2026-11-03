using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace Bro_Screen_Cinemas
{
    public partial class Homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRepeater();
            }
        }

        private void BindRepeater()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT MovieID, Title, ReleaseDate, Genre, Duration, Classification, Poster FROM Movie WHERE Availability = 'Available'";
                SqlCommand command = new SqlCommand(query, connection);

                try
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    rptMovies.DataSource = dt;
                    rptMovies.DataBind();

                    foreach (RepeaterItem item in rptMovies.Items)
                    {
                        // Get the image control in the Repeater item
                        Image imgPoster = (Image)item.FindControl("imgPoster");

                        // Check if the Poster column contains a value
                        if (dt.Rows[item.ItemIndex]["Poster"] != DBNull.Value)
                        {
                            byte[] imageBytes = (byte[])dt.Rows[item.ItemIndex]["Poster"];
                            string base64String = Convert.ToBase64String(imageBytes);
                            imgPoster.ImageUrl = "data:image/png;base64," + base64String;
                        }
                        else
                        {
                            // Use a default image if the Poster is NULL
                            imgPoster.ImageUrl = "~/images/no-image.png";
                        }
                    }

                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
        }
    }
}