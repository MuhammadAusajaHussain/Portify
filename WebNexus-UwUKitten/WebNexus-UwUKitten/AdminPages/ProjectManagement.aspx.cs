using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WebNexus_UwUKitten.AdminPages
{
    public partial class ProjectManagement : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DBC"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProjects();
            }
        }

        private void LoadProjects()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT Id, Title, Description, ClientName, Outcome, ImageUrl FROM Projects";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewProjects.DataSource = dt;
                GridViewProjects.DataBind();
            }
        }

        protected void GridViewProjects_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int projectId = Convert.ToInt32(GridViewProjects.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Projects WHERE Id = @ProjectId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ProjectId", projectId);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            LoadProjects();
        }
    }
}
