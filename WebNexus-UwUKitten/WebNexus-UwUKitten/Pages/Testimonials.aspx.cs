using System;
using System.Data;
using System.Data.SqlClient;

namespace WebNexus_UwUKitten.Pages
{
    public partial class Testimonials : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTestimonials();
                
            }
        }

        private void LoadTestimonials()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBC"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT 
                        t.ClientName, t.Company, t.Quote, t.LogoUrl,
                        p.Title AS ProjectTitle
                    FROM Testimonials t
                    LEFT JOIN Projects p ON p.TestimonialId = t.Id";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    TestimonialRepeater.DataSource = reader;
                    TestimonialRepeater.DataBind();
                }
            }
        }

        
    }
}
