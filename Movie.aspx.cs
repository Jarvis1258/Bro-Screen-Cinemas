using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bro_Screen_Cinemas
{
    public partial class Movie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRepeater("Available");
            }
        }

        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedFilter = ddlFilter.SelectedValue;
            BindRepeater(selectedFilter);
        }

        private void BindRepeater(string filter)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT MovieID, Title, Genre, Duration, Subtitle, Availability, Poster FROM Movie WHERE Availability = @Filter";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Filter", filter);

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
                        Image imgPoster = (Image)item.FindControl("imgPoster");
                        PlaceHolder phBuyNow = (PlaceHolder)item.FindControl("phBuyNow");

                        if (dt.Rows[item.ItemIndex]["Poster"] != DBNull.Value)
                        {
                            byte[] imageBytes = (byte[])dt.Rows[item.ItemIndex]["Poster"];
                            string base64String = Convert.ToBase64String(imageBytes);
                            imgPoster.ImageUrl = "data:image/png;base64," + base64String;
                        }
                        else
                        {
                            imgPoster.ImageUrl = "~/images/no-image.png";
                        }

                        string availability = dt.Rows[item.ItemIndex]["Availability"].ToString();
                        if (availability == "Upcoming")
                        {
                            phBuyNow.Visible = false;
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