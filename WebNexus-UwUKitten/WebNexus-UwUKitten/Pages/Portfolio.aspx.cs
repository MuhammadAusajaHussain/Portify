using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace WebNexus_UwUKitten.Pages
{
    public partial class Portfolio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProjects();
            }
        }

        private void LoadProjects()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBC"].ConnectionString;
            string query = @"
                SELECT 
                    p.Id, 
                    p.Title, 
                    p.Description, 
                    p.ClientName, 
                    p.Outcome, 
                    p.ImageUrl, 
                    t.Quote AS TestimonialQuote
                FROM 
                    Projects p
                    LEFT JOIN Testimonials t ON p.TestimonialId = t.Id
                ORDER BY 
                    p.CreatedAt DESC";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                    DataSet ds = new DataSet();
                    adapter.Fill(ds);

                    // Check if there are any rows in the DataSet
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        // Bind the data to the Repeater control
                        Repeater1.DataSource = ds.Tables[0];
                        Repeater1.DataBind();
                    }
                    else
                    {
                        // Handle case when there are no projects
                        // You can display a message or hide the repeater
                        Repeater1.Visible = false;
                        // Optionally show a "No Projects" message
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle any errors during database operations
                // Log the error or show a friendly error message
                // For example:
                Response.Write("Error: " + ex.Message);
            }
        }
    }
}
