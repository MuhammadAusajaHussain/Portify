using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebNexus_UwUKitten.AdminPages
{
    public partial class Appointments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAppointments();
            }
        }

        private void LoadAppointments()
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["DBC"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT a.Id, a.Name, a.Email, s.Title AS Service, a.DateTime, a.Message, a.Status
                    FROM Appointments a
                    LEFT JOIN Services s ON a.ServiceId = s.Id
                    ORDER BY a.DateTime DESC";

                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                GridViewAppointments.DataSource = dt;
                GridViewAppointments.DataBind();
            }
        }

        protected void GridViewAppointments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve" || e.CommandName == "Decline")
            {
                int appointmentId = Convert.ToInt32(e.CommandArgument);  // Now correctly getting the ID from CommandArgument

                string status = e.CommandName == "Approve" ? "approved" : "declined";

                UpdateAppointmentStatus(appointmentId, status);
            }
        }

        private void UpdateAppointmentStatus(int appointmentId, string status)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["DBC"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE Appointments SET Status = @Status WHERE Id = @AppointmentId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Status", status);
                cmd.Parameters.AddWithValue("@AppointmentId", appointmentId);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            // Reload appointments to reflect the updated status
            LoadAppointments();
        }
    }
}
