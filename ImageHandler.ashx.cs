using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Bro_Screen_Cinemas
{
    /// <summary>
    /// Summary description for Handler1
    /// </summary>
    public class Handler1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string movieID = context.Request.QueryString["MovieID"];
            string custID = context.Request.QueryString["CustID"];
            if (!string.IsNullOrEmpty(movieID))
            {
                byte[] imageBytes = GetMoviePosterFromDb(movieID);
                if (imageBytes != null)
                {
                    context.Response.ContentType = "image/jpeg"; // Adjust based on your image type
                    context.Response.BinaryWrite(imageBytes);
                }
            }
            else if (!string.IsNullOrEmpty(custID))
            {
                byte[] imageBytes = GetProfilePicFromDb(custID);
                if (imageBytes != null)
                {
                    context.Response.ContentType = "image/jpeg"; // Adjust based on your image type
                    context.Response.BinaryWrite(imageBytes);
                }
            }
            else
            {
                // Handle case where MovieID is not provided
                context.Response.StatusCode = 400;
            }
        }

        private byte[] GetMoviePosterFromDb(string movieID)
        {
            byte[] imageBytes = null;
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT Poster FROM Movie WHERE MovieID = @MovieID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@MovieID", movieID);
                    connection.Open();
                    object result = command.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        imageBytes = (byte[])result;
                    }
                }
            }
            return imageBytes;
        }

        private byte[] GetProfilePicFromDb(string custID)
        {
            byte[] imageBytes = null;
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT ProfilePic FROM Customer WHERE FormattedCustomerID = @CustID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CustID", custID);
                    connection.Open();
                    object result = command.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        imageBytes = (byte[])result;
                    }
                }
            }
            return imageBytes;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}