using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WebNexus_UwUKitten.AdminPages
{
    public partial class AddService : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DBC"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear any messages on page load
            lblError.Text = string.Empty;
            lblSuccess.Text = string.Empty;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Validate input fields
            if (string.IsNullOrWhiteSpace(txtTitle.Text) || string.IsNullOrWhiteSpace(txtDescription.Text))
            {
                lblError.Text = "Title and Description are required fields.";
                return;
            }

            decimal price;
            if (!decimal.TryParse(txtPrice.Text, out price))
            {
                lblError.Text = "Please enter a valid price.";
                return;
            }

            // Insert service into the database
            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "INSERT INTO Services (Title, Description, Price) VALUES (@Title, @Description, @Price)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                    cmd.Parameters.AddWithValue("@Price", price);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    // Success message
                    lblSuccess.Text = "Service added successfully! Redirecting to Services Management page...";

                    // Redirect after 2 seconds
                    Response.AddHeader("REFRESH", "2;URL=ServicesManagement.aspx");
                }
            }
            catch (Exception ex)
            {
                // Handle any database errors
                lblError.Text = "Error occurred while adding the service: " + ex.Message;
            }
        }
    }
}
