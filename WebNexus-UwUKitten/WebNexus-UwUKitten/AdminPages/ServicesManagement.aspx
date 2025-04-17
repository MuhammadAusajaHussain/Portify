<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServicesManagement.aspx.cs" Inherits="WebNexus_UwUKitten.AdminPages.ServicesManagement" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Services Management</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
</head>
<body class="bg-gray-100">

    <!-- Navbar Start -->
    <div class="bg-blue-800 p-3 shadow-md">
     <div class="flex justify-between items-center">
         <!-- Logo / Branding -->
         <div class="text-white text-2xl font-semibold">WebNexus</div>

         <!-- Navbar Links -->
         <div class="flex space-x-6">
             <asp:HyperLink ID="lnkDashboard" runat="server" CssClass="text-white hover:bg-blue-700 px-4 py-2 rounded transition" NavigateUrl="Dashboard.aspx">Dashboard</asp:HyperLink>
             <asp:HyperLink ID="lnkProjectManagement" runat="server" CssClass="text-white hover:bg-blue-700 px-4 py-2 rounded transition" NavigateUrl="ProjectManagement.aspx">Project Management</asp:HyperLink>
             <asp:HyperLink ID="lnkServicesManagement" runat="server" CssClass="text-white hover:bg-blue-700 px-4 py-2 rounded transition" NavigateUrl="ServicesManagement.aspx">Services Management</asp:HyperLink>
             <asp:HyperLink ID="lnkAppointmentManagement" runat="server" CssClass="text-white hover:bg-blue-700 px-4 py-2 rounded transition" NavigateUrl="AppointmentManagement.aspx">Appointment Management</asp:HyperLink>
         </div>
     </div>
 </div>
    <!-- Navbar End -->

    <form id="form1" runat="server">
        <div class="container mx-auto p-4">
            <h2 class="text-2xl font-bold text-blue-800">Services List</h2>

            <!-- Add New Service Button -->
            <a href="AddService.aspx" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 mb-4 inline-block">Add New Service</a>

            <!-- GridView for displaying services -->
            <asp:GridView ID="GridViewServices" runat="server" 
                CssClass="table-auto w-full border-collapse border border-gray-300" 
                AutoGenerateColumns="False" 
                OnRowDeleting="GridViewServices_RowDeleting" 
                DataKeyNames="Id">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" SortExpression="Id" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="CreatedAt" HeaderText="Created At" SortExpression="CreatedAt" DataFormatString="{0:MM/dd/yyyy}" />
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
            <p class="mb-2">&copy; <%: DateTime.Now.Year %> - WebNexus</p>
            <div class="flex justify-center space-x-4 text-sm">
                <a href="https://www.linkedin.com/in/your-linkedin" target="_blank" class="text-blue-400 hover:text-white transition">LinkedIn</a>
                <a href="https://github.com/your-github" target="_blank" class="text-blue-400 hover:text-white transition">GitHub</a>
            </div>
        </div>
    </div>
    <!-- Footer End -->

</body>
</html>
