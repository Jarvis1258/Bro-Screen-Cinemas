using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace Bro_Screen_Cinemas
{
    public partial class MovieList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRepeater();
            }
        }
        protected void rptMovies_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DropDownList ddlAvailability = (DropDownList)e.Item.FindControl("ddlAvailability");
                string currentAvailability = DataBinder.Eval(e.Item.DataItem, "Availability").ToString();
                ddlAvailability.SelectedValue = currentAvailability;
            }
        }
        protected void rptMovies_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                string movieID = e.CommandArgument.ToString();
                DeleteMovie(movieID);
                BindRepeater();
            }
        }

        private void BindRepeater()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT MovieID, Title, Genre, Duration, Availability, Poster FROM Movie";
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

        protected void ddlAvailability_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            RepeaterItem item = (RepeaterItem)ddl.NamingContainer;
            string movieID = ((Label)item.FindControl("lblMovieID")).Text;
            string selectedAvailability = ddl.SelectedValue;

            UpdateMovieAvailability(movieID, selectedAvailability);
        }

        private void UpdateMovieAvailability(string movieID, string availability)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE Movie SET Availability = @Availability WHERE MovieID = @MovieID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Availability", availability);
                command.Parameters.AddWithValue("@MovieID", movieID);

                try
                {
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        // Optionally, rebind the Repeater to reflect the updated availability
                        BindRepeater();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
        }

        private void DeleteMovie(string movieID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Movie WHERE MovieID = @MovieID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@MovieID", movieID);
                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();

                    // Log the result of the delete operation
                    //if (rowsAffected > 0)
                    //{
                    //    Debug.WriteLine($"Successfully deleted movie with ID: {movieID}");
                    //}
                    //else
                    //{
                    //    Debug.WriteLine($"No movie found with ID: {movieID}. Deletion not performed.");
                    //}
                }
            }
        }

        protected void btnAddMovie_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddMovie.aspx");
        }
    }
}