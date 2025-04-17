using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace WebNexus_UwUKitten.Pages
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindServices();
       
                BindTestimonials();
            }
        }

        private void BindServices()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBC"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT TOP 3 * FROM Services ORDER BY CreatedAt DESC", con);
                con.Open();
                rptServices.DataSource = cmd.ExecuteReader();
                rptServices.DataBind();
            }
        }

        private void BindTestimonials()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBC"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 * FROM Testimonials ORDER BY NEWID()", con);
                con.Open();
                rptTestimonials.DataSource = cmd.ExecuteReader();
                rptTestimonials.DataBind();
            }
        }
    }
}
