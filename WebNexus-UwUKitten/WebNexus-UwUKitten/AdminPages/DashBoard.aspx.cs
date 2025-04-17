using System;

namespace WebNexus_UwUKitten.AdminPages
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Redirect to login if user is not authenticated
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();           // Clear session
            Session.Abandon();         // Abandon session
            Response.Redirect("Login.aspx");  // Redirect to login page
        }
    }
}
