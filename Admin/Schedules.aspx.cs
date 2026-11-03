using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Bro_Screen_Cinemas
{
    public partial class ManageSchedules : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMovies();
                LoadCinemas();
            }
        }

        private void LoadMovies()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT MovieID, Title FROM Movie";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                ddlMovies.DataSource = dt;
                ddlMovies.DataTextField = "Title";
                ddlMovies.DataValueField = "MovieID";
                ddlMovies.DataBind();

                // Preserve the placeholder
                ddlMovies.Items.Insert(0, new ListItem("Please Select a Movie", ""));
            }
        }

        private void LoadCinemas()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT CinemaID, Outlet FROM Cinema";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                ddlCinemas.DataSource = dt;
                ddlCinemas.DataTextField = "Outlet";
                ddlCinemas.DataValueField = "CinemaID";
                ddlCinemas.DataBind();

                // Preserve the placeholder
                ddlCinemas.Items.Insert(0, new ListItem("Please Select a Cinema", ""));
            }
        }

        protected void btnViewSchedules_Click(object sender, EventArgs e)
        {
            string selectedDate = txtDate.Text;

            if (DateTime.TryParse(selectedDate, out DateTime date))
            {
                LoadSchedules(date);
            }
            else
            {
                // Show error for invalid date
                Response.Write("<script>alert('Please enter a valid date in yyyy-MM-dd format.');</script>");
            }
        }

        private void LoadSchedules(DateTime date)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
            SELECT 
                s.ShowtimeID, 
                m.Title AS MovieTitle, 
                c.Outlet, 
                s.Date, 
                CONVERT(VARCHAR(5), s.Time, 108) AS Time
            FROM Showtime s
            JOIN Movie m ON s.MovieID = m.MovieID
            JOIN Cinema c ON s.CinemaID = c.CinemaID
            WHERE s.Date = @Date";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Date", date);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvSchedules.DataSource = dt;
                gvSchedules.DataBind();
                pnlSchedules.Visible = dt.Rows.Count > 0;
            }
        }
        protected void btnAddSchedule_Click(object sender, EventArgs e)
        {
            string movieID = ddlMovies.SelectedValue;
            string cinemaID = ddlCinemas.SelectedValue;
            string dateText = txtNewDate.Text;
            string timeText = txtNewTime.Text;

            // Validate date format
            if (!DateTime.TryParseExact(dateText, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out DateTime date))
            {
                Response.Write("<script>alert('Invalid date format. Please enter a valid date in yyyy-MM-dd format.');</script>");
                return; // Stop further execution
            }

            // Validate time format
            if (string.IsNullOrWhiteSpace(timeText) || !TimeSpan.TryParse(timeText, out TimeSpan time))
            {
                Response.Write("<script>alert('Invalid time format. Please enter a valid time in HH:mm format.');</script>");
                return; // Stop further execution
            }

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    // Generate the new ShowtimeID
                    string newShowtimeID = GenerateNewShowtimeID(conn);

                    string query = @"
                INSERT INTO Showtime (ShowtimeID, MovieID, CinemaID, Date, Time)
                VALUES (@ShowtimeID, @MovieID, @CinemaID, @Date, @Time)";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@ShowtimeID", newShowtimeID);
                    cmd.Parameters.AddWithValue("@MovieID", movieID);
                    cmd.Parameters.AddWithValue("@CinemaID", cinemaID);
                    cmd.Parameters.AddWithValue("@Date", date);
                    cmd.Parameters.AddWithValue("@Time", time);

                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Showtime added successfully!');</script>");

                    // Reload schedules for the selected date
                    LoadSchedules(date);
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }

        private string GenerateNewShowtimeID(SqlConnection conn)
        {
            string lastID = null;

            // Query to get the last ShowtimeID
            string query = "SELECT TOP 1 ShowtimeID FROM Showtime ORDER BY ShowtimeID DESC";

            SqlCommand cmd = new SqlCommand(query, conn);

            // Open the connection if it is not already open
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }

            object result = cmd.ExecuteScalar();

            if (result != null)
            {
                lastID = result.ToString();
            }

            // If no ID exists, start with ST001
            if (string.IsNullOrEmpty(lastID))
            {
                return "ST001";
            }

            // Extract the numeric part from the last ID (e.g., 001 from ST001)
            string numericPart = lastID.Substring(2); // Skip "ST"
            int nextNumber = int.Parse(numericPart) + 1;

            // Format the new ID with leading zeros (e.g., ST002, ST010, etc.)
            return "ST" + nextNumber.ToString("D3");
        }


        protected void gvSchedules_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Set the row to edit mode
            gvSchedules.EditIndex = e.NewEditIndex;

            // Reload the schedules to show the editable row
            if (DateTime.TryParse(txtDate.Text, out DateTime selectedDate))
            {
                LoadSchedules(selectedDate);
            }
        }

        protected void gvSchedules_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            // Cancel edit mode
            gvSchedules.EditIndex = -1;

            // Reload the schedules
            if (DateTime.TryParse(txtDate.Text, out DateTime selectedDate))
            {
                LoadSchedules(selectedDate);
            }
        }

        protected void gvSchedules_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Get the selected row
            GridViewRow row = gvSchedules.Rows[e.RowIndex];

            // Retrieve the schedule ID
            string showtimeID = gvSchedules.DataKeys[e.RowIndex].Value.ToString();

            // Retrieve the updated values
            string updatedDate = ((TextBox)row.Cells[2].Controls[0]).Text;
            string updatedTime = ((TextBox)row.Cells[3].Controls[0]).Text;

            // Validate the input
            if (DateTime.TryParse(updatedDate, out DateTime date) &&
                TimeSpan.TryParse(updatedTime, out TimeSpan time))
            {
                // Update the schedule in the database
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "UPDATE Showtime SET Date = @Date, Time = @Time WHERE ShowtimeID = @ShowtimeID";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Date", date);
                    cmd.Parameters.AddWithValue("@Time", time);
                    cmd.Parameters.AddWithValue("@ShowtimeID", showtimeID);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                // Exit edit mode
                gvSchedules.EditIndex = -1;

                // Reload the schedules
                LoadSchedules(date);

                Response.Write("<script>alert('Schedule updated successfully.');</script>");
            }
            else
            {
                Response.Write("<script>alert('Invalid date or time format.');</script>");
            }
        }

        protected void gvSchedules_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Retrieve the schedule ID from the DataKeys
            string showtimeID = gvSchedules.DataKeys[e.RowIndex].Value.ToString();

            // Connection string to your database
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Showtime WHERE ShowtimeID = @ShowtimeID";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ShowtimeID", showtimeID);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Schedule deleted successfully.');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }

            // Reload the schedules to reflect changes
            if (DateTime.TryParse(txtDate.Text, out DateTime selectedDate))
            {
                LoadSchedules(selectedDate);
            }
        }

    }
}