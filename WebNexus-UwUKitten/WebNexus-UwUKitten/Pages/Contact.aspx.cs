using System;
using System.Data.SqlClient;

namespace WebNexus_UwUKitten.Pages
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string message = txtMessage.Text.Trim();
            DateTime submittedAt = DateTime.Now;

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBC"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"INSERT INTO ContactSubmissions (Name, Email, Message, SubmittedAt) 
                                 VALUES (@Name, @Email, @Message, @SubmittedAt)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Message", message);
                    cmd.Parameters.AddWithValue("@SubmittedAt", submittedAt);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            lblStatus.Text = "Your message has been sent successfully!";
            lblStatus.Visible = true;

            // Optional: Clear fields
            txtName.Text = "";
            txtEmail.Text = "";
            txtMessage.Text = "";
        }
    }
}
