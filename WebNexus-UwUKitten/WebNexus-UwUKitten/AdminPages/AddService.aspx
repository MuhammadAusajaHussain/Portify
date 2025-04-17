<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddService.aspx.cs" Inherits="WebNexus_UwUKitten.AdminPages.AddService" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Add New Service</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
</head>
<body class="bg-gray-100">

    <!-- Navbar Start -->
    <nav class="bg-blue-800 p-4">
        <div class="max-w-7xl mx-auto flex items-center justify-between">
            <div class="text-white font-bold text-2xl">WebNexus Admin</div>
            <div class="space-x-6">
                <a href="/Dashboard.aspx" class="text-white hover:text-gray-300">Dashboard</a>
                <a href="/ServicesManagement.aspx" class="text-white hover:text-gray-300">Services</a>
                <a href="/Appointments.aspx" class="text-white hover:text-gray-300">Appointments</a>
                <a href="/Logout.aspx" class="text-white hover:text-gray-300">Logout</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <form id="form1" runat="server" class="p-8 bg-white shadow-md rounded">
        <h2 class="text-2xl font-bold mb-6 text-center text-blue-800">Add New Service</h2>

        <!-- Error Message -->
        <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red" CssClass="mb-4 block text-center" />

        <!-- Success Message -->
        <asp:Label ID="lblSuccess" runat="server" Text="" ForeColor="Green" CssClass="mb-4 block text-center" />

        <!-- Service Title -->
        <div class="mb-4">
            <label for="txtTitle" class="block text-lg">Title</label>
            <asp:TextBox ID="txtTitle" runat="server" CssClass="w-full p-2 border rounded" />
        </div>

        <!-- Service Description -->
        <div class="mb-4">
            <label for="txtDescription" class="block text-lg">Description</label>
            <asp:TextBox ID="txtDescription" runat="server" CssClass="w-full p-2 border rounded" TextMode="MultiLine" Rows="4" />
        </div>

        <!-- Service Price -->
        <div class="mb-4">
            <label for="txtPrice" class="block text-lg">Price</label>
            <asp:TextBox ID="txtPrice" runat="server" CssClass="w-full p-2 border rounded" />
        </div>

        <!-- Submit Button -->
        <div class="text-center">
            <asp:Button ID="btnSubmit" runat="server" Text="Add Service" CssClass="bg-blue-500 text-white px-6 py-2 rounded hover:bg-blue-600" OnClick="btnSubmit_Click" />
        </div>
    </form>

    <!-- Footer Start -->
    <footer class="bg-blue-800 text-white p-4 mt-6">
        <div class="max-w-7xl mx-auto text-center">
            <p>&copy; 2025 WebNexus. All Rights Reserved.</p>
        </div>
    </footer>
    <!-- Footer End -->

</body>
</html>
