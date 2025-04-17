<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WebNexus_UwUKitten.AdminPages.Dashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
</head>
<body class="bg-gray-100 text-gray-800 min-h-screen flex flex-col">
    <form id="form1" runat="server">
        <!-- Navbar -->
        <div class="bg-blue-800 text-white p-4 shadow flex justify-between items-center">
            <div class="text-xl font-semibold">WebNexus</div>
            <div class="space-x-4">
                <a href="Dashboard.aspx" class="hover:underline">Dashboard</a>
                <a href="ProjectManagement.aspx" class="hover:underline">Projects</a>
                <a href="ServicesManagement.aspx" class="hover:underline">Services</a>
                <a href="AppointmentManagement.aspx" class="hover:underline">Appointments</a>
                <asp:LinkButton 
                    ID="btnLogout" 
                    runat="server" 
                    CssClass="bg-red-500 hover:bg-red-600 px-3 py-1 rounded text-white"
                    OnClick="btnLogout_Click">Logout</asp:LinkButton>
            </div>
        </div>

        <!-- Main Dashboard Content -->
        <div class="flex-1 container mx-auto p-6">
            <h2 class="text-3xl font-bold mb-6">Welcome, Admin!</h2>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div class="bg-white p-6 rounded shadow text-center">
                    <h3 class="text-xl font-semibold mb-2">Projects</h3>
                    <p class="text-gray-600 mb-4">Manage all your portfolio projects.</p>
                    <a href="ProjectManagement.aspx" class="text-blue-600 hover:underline">Go to Projects</a>
                </div>
                <div class="bg-white p-6 rounded shadow text-center">
                    <h3 class="text-xl font-semibold mb-2">Services</h3>
                    <p class="text-gray-600 mb-4">Add or update services you offer.</p>
                    <a href="ServicesManagement.aspx" class="text-blue-600 hover:underline">Go to Services</a>
                </div>
                <div class="bg-white p-6 rounded shadow text-center">
                    <h3 class="text-xl font-semibold mb-2">Appointments</h3>
                    <p class="text-gray-600 mb-4">View or manage user bookings.</p>
                    <a href="AppointmentManagement.aspx" class="text-blue-600 hover:underline">Go to Appointments</a>
                </div>
            </div>
        </div>

        <!-- Footer -->
         <div class="bg-gray-900 text-white p-4 mt-6 bottom-0 w-full fixed">
     <div class="flex justify-between text-center">
         <p class="mb-2">&copy; <%: DateTime.Now.Year %> - WebNexus</p>
         <div class="flex justify-center space-x-4 text-sm">
             <a href="https://www.linkedin.com/in/your-linkedin" target="_blank" class="text-blue-400 hover:text-white transition">LinkedIn</a>
             <a href="https://github.com/your-github" target="_blank" class="text-blue-400 hover:text-white transition">GitHub</a>
         </div>
     </div>
 </div>
    </form>
</body>
</html>
