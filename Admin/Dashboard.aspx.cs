using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bro_Screen_Cinemas
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //lblUsername.Text = Session["username"].ToString();
            }

        }

        private void LoadMovieData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT MovieID, Title, ReleaseDate, Genre FROM Movie WHERE Availablility = Upcoming"; // Select required columns
                SqlCommand command = new SqlCommand(query, connection);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    // Use a DataTable to hold the data
                    DataTable movieTable = new DataTable();
                    movieTable.Load(reader);

                    // Bind the DataTable to a GridView
                    gvMovies.DataSource = movieTable;
                    gvMovies.DataBind();
                }
                catch (Exception ex)
                {
                    lblStatus.Text = "Error: " + ex.Message;
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

    }
}