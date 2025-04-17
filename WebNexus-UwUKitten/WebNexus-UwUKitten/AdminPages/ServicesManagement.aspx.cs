using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WebNexus_UwUKitten.AdminPages
{
    public partial class ServicesManagement : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DBC"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadServices();
            }
        }

        private void LoadServices()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT Id, Title, Description, Price, CreatedAt FROM Services";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewServices.DataSource = dt;
                GridViewServices.DataBind();
            }
        }

        protected void GridViewServices_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int serviceId = Convert.ToInt32(GridViewServices.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Services WHERE Id = @ServiceId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ServiceId", serviceId);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            LoadServices();
        }
    }
}
