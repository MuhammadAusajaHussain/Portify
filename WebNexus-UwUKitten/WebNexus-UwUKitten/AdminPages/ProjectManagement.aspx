<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectManagement.aspx.cs" Inherits="WebNexus_UwUKitten.AdminPages.ProjectManagement" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Project Management</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
</head>
<body class="bg-gray-100">

    <!-- Navbar Start -->
    <nav class="bg-blue-800 p-3">
        <div class="max-w-7xl mx-auto flex items-center justify-between">
            <div class="text-white font-bold text-2xl tracking-wide">Portify - Admin</div>
             <div class="flex space-x-4">
     <asp:HyperLink ID="lnkDashboard" runat="server" CssClass="text-white hover:bg-blue-700 px-4 py-2 rounded transition" NavigateUrl="Dashboard.aspx">Dashboard</asp:HyperLink>
     <asp:HyperLink ID="lnkProjectManagement" runat="server" CssClass="text-white hover:bg-blue-700 px-4 py-2 rounded transition" NavigateUrl="ProjectManagement.aspx">Projects</asp:HyperLink>
     <asp:HyperLink ID="lnkServicesManagement" runat="server" CssClass="text-white hover:bg-blue-700 px-4 py-2 rounded transition" NavigateUrl="ServicesManagement.aspx">Services</asp:HyperLink>
     <asp:HyperLink ID="lnkAppointmentManagement" runat="server" CssClass="text-white hover:bg-blue-700 px-4 py-2 rounded transition" NavigateUrl="AppointmentManagement.aspx">Appointments</asp:HyperLink>
 </div>
    </nav>
    <!-- Navbar End -->

    <form id="form1" runat="server">
        <div class="container mx-auto p-4">
            <h2 class="text-2xl font-bold text-blue-800">Project Management</h2>

            <!-- Add New Project Button -->
            <a href="/AddProduct.aspx" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 mb-4 inline-block">Add New Project</a>

            <!-- GridView for displaying projects -->
            <asp:GridView ID="GridViewProjects" runat="server" 
                CssClass="table-auto w-full border-collapse border border-gray-300" 
                AutoGenerateColumns="False" 
                OnRowDeleting="GridViewProjects_RowDeleting" 
                DataKeyNames="Id">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" SortExpression="Id" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="ClientName" HeaderText="Client" SortExpression="ClientName" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Outcome" HeaderText="Outcome" SortExpression="Outcome" />
                    <asp:BoundField DataField="ImageUrl" HeaderText="Image URL" SortExpression="ImageUrl" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <!-- Delete Button -->
                            <asp:Button ID="btnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("Id") %>' Text="Delete" CssClass="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>

    <!-- Footer Start -->
    <div class="bg-gray-900 text-white p-4 mt-6 bottom-0 w-full fixed">
        <div class="flex justify-between text-center">
            <p class="mb-2">&copy; <%: DateTime.Now.Year %> - Portify</p>
        </div>
    </div>
    <!-- Footer End -->

</body>
</html>
