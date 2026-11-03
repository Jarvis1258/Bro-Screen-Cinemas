using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Bro_Screen_Cinemas
{
    public partial class Cinema : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCinemaData();
            }
        }

        private void LoadCinemaData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT CinemaID, Outlet, City, Address, ContactNumber, OpeningHours, Facilities FROM Cinema ORDER BY Outlet";
                SqlCommand command = new SqlCommand(query, connection);

                try
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    // Bind the data to the Repeater
                    CinemaRepeater.DataSource = dt;
                    CinemaRepeater.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                }
            }
        }
    }
}