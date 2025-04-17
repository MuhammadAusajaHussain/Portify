using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WebNexus_UwUKitten.Pages
{
    public partial class Services : System.Web.UI.Page
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
                string query = "SELECT Id, Title, Description, Price FROM Services";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                RepeaterServices.DataSource = dt;
                RepeaterServices.DataBind();

                ddlServices.DataSource = dt;
                ddlServices.DataTextField = "Title";
                ddlServices.DataValueField = "Id";
                ddlServices.DataBind();
                ddlServices.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Service --", ""));
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DateTime appointmentDateTime;

            // Validate the date input and try to parse it
            if (DateTime.TryParse(txtDateTime.Text, out appointmentDateTime))
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "INSERT INTO Appointments (Name, Email, ServiceId, DateTime, Message) VALUES (@Name, @Email, @ServiceId, @DateTime, @Message)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@ServiceId", ddlServices.SelectedValue);
                    cmd.Parameters.AddWithValue("@DateTime", appointmentDateTime); // Use the parsed DateTime object
                    cmd.Parameters.AddWithValue("@Message", txtMessage.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    lblStatus.Text = "Your appointment has been submitted successfully!";
                    txtName.Text = txtEmail.Text = txtDateTime.Text = txtMessage.Text = "";
                    ddlServices.SelectedIndex = 0;
                }
            }
            else
            {
                lblStatus.Text = "Please enter a valid date and time.";
            }
        }
    }
}
