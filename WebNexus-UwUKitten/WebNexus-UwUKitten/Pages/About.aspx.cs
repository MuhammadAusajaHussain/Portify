using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WebNexus_UwUKitten.Pages
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCertifications();
            }
        }

        private void LoadCertifications()
        {
            string connStr = ConfigurationManager.ConnectionStrings["DBC"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Title, Institution, IssuedDate FROM Certifications ORDER BY IssuedDate DESC";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                rptCertifications.DataSource = reader;
                rptCertifications.DataBind();
            }
        }
    }
}
