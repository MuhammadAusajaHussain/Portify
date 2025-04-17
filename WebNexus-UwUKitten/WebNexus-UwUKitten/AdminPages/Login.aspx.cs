using System;
using System.Data.SqlClient;

namespace WebNexus_UwUKitten.AdminPages
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                Response.Redirect("Dashboard.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["DBC"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Id FROM Users WHERE Name=@Username AND PasswordHash=@Password AND Role='Admin'";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);

                conn.Open();
                object result = cmd.ExecuteScalar();

                if (result != null)
                {
                    Session["UserID"] = result.ToString();
                    Session["Username"] = username;
                    Response.Redirect("DashBoard.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid credentials or unauthorized access.";
                }
            }
        }
    }
}
