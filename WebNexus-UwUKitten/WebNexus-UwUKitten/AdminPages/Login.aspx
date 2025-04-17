<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="WebNexus_UwUKitten.AdminPages.AdminLogin" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">

    <form id="form1" runat="server" class="bg-white p-8 rounded shadow-md w-full max-w-md">
        <h2 class="text-2xl font-bold text-center mb-6 text-blue-800">Admin Login</h2>

        <asp:Label ID="lblMessage" runat="server" CssClass="text-red-500 mb-4 block"></asp:Label>

        <div class="mb-4">
            <asp:Label runat="server" AssociatedControlID="txtUsername" CssClass="block text-gray-700 font-medium mb-1">Username</asp:Label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500" />
        </div>

        <div class="mb-6">
            <asp:Label runat="server" AssociatedControlID="txtPassword" CssClass="block text-gray-700 font-medium mb-1">Password</asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500" />
        </div>

        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="w-full bg-blue-700 text-white py-2 rounded hover:bg-blue-800 transition" OnClick="btnLogin_Click" />
    </form>

</body>
</html>
