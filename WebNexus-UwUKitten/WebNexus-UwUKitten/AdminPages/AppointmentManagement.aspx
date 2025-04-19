<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="WebNexus_UwUKitten.AdminPages.Appointments" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Appointment Management</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
</head>
<body class="bg-gray-100">

    <!-- NAVBAR -->
    <div class="bg-blue-800 p-3 shadow-md">
        <div class="flex justify-between items-center">
            <!-- Logo / Branding -->
            <div class="text-white text-2xl font-semibold tracking-wide">Portify - Admin</div>

            <!-- Navbar Links -->
                  <div class="flex space-x-4">
     <asp:HyperLink ID="lnkDashboard" runat="server" CssClass="text-white hover:bg-blue-700 px-4 py-2 rounded transition" NavigateUrl="Dashboard.aspx">Dashboard</asp:HyperLink>
     <asp:HyperLink ID="lnkProjectManagement" runat="server" CssClass="text-white hover:bg-blue-700 px-4 py-2 rounded transition" NavigateUrl="ProjectManagement.aspx">Projects</asp:HyperLink>
     <asp:HyperLink ID="lnkServicesManagement" runat="server" CssClass="text-white hover:bg-blue-700 px-4 py-2 rounded transition" NavigateUrl="ServicesManagement.aspx">Services</asp:HyperLink>
     <asp:HyperLink ID="lnkAppointmentManagement" runat="server" CssClass="text-white hover:bg-blue-700 px-4 py-2 rounded transition" NavigateUrl="AppointmentManagement.aspx">Appointments</asp:HyperLink>
 </div>
        </div>
    </div>

    <!-- MAIN CONTENT -->
    <form id="form1" runat="server" class="p-8 bg-white shadow-md rounded mt-6">
        <h2 class="text-2xl font-bold mb-6 text-center text-blue-800">Manage Appointments</h2>

        <asp:GridView ID="GridViewAppointments" runat="server" CssClass="table-auto w-full border-collapse border border-gray-300" AutoGenerateColumns="False" OnRowCommand="GridViewAppointments_RowCommand">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" SortExpression="Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Service" HeaderText="Service" SortExpression="Service" />
                <asp:BoundField DataField="DateTime" HeaderText="Date & Time" SortExpression="DateTime" DataFormatString="{0:MM/dd/yyyy hh:mm tt}" />
                <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnApprove" runat="server" CommandName="Approve" CommandArgument='<%# Eval("Id") %>' Text="Approve" CssClass="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600 transition" />
                        <asp:Button ID="btnDecline" runat="server" CommandName="Decline" CommandArgument='<%# Eval("Id") %>' Text="Decline" CssClass="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 transition" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>

    <!-- FOOTER -->
    <div class="bg-gray-900 text-white p-4 mt-6 bottom-0 w-full fixed">
        <div class="flex justify-between text-center">
            <p class="mb-2">&copy; <%: DateTime.Now.Year %> - Portify</p>
            <div class="flex justify-center space-x-4 text-sm">
                <a href="https://www.linkedin.com/in/your-linkedin" target="_blank" class="text-blue-400 hover:text-white transition">LinkedIn</a>
                <a href="https://github.com/your-github" target="_blank" class="text-blue-400 hover:text-white transition">GitHub</a>
            </div>
        </div>
    </div>

</body>
</html>
