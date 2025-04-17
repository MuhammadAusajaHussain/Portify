<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebNexus_UwUKitten.Pages.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="bg-white text-gray-900 font-sans">
    <div class="container mx-auto px-4 py-10 max-w-3xl">
        <h1 class="text-4xl font-bold text-center text-blue-800 mb-8">Contact Me</h1>

        <!-- Contact Form -->
        <div class="bg-gray-100 p-6 rounded-lg shadow-lg mb-10">
            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700">Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="w-full mt-1 p-2 border border-gray-300 rounded" required="true" />
            </div>

            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="w-full mt-1 p-2 border border-gray-300 rounded" TextMode="Email" required="true" />
            </div>

            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700">Message</label>
                <asp:TextBox ID="txtMessage" runat="server" CssClass="w-full mt-1 p-2 border border-gray-300 rounded" TextMode="MultiLine" Rows="5" required="true" />
            </div>

            <asp:Button ID="btnSubmit" runat="server" CssClass="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700" Text="Send Message" OnClick="btnSubmit_Click" />
            <asp:Label ID="lblStatus" runat="server" CssClass="block mt-4 text-green-600 font-semibold" Visible="false" />
        </div>

        <!-- Contact Links -->
                 <div class="text-center mb-10 mt-6">
 

    <!-- Book a Consultation Button -->
    <a href="Services.aspx" class="inline-block mt-4 bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700 transition">
        Book a Consultation
    </a>
</div>
      

        <!-- Optional Map -->
     <div class="mt-10">
    <h2 class="text-2xl font-bold text-blue-800 mb-4">Our Location</h2>
    <iframe class="w-full h-64 rounded-lg"
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3620.570760041745!2d67.11224311499672!3d24.84707028405661!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3eb33e57a9e5b9b9%3A0x4c8ebbb88ff5f2aa!2sNational%20Incubation%20Center%20Karachi!5e0!3m2!1sen!2s!4v1684567890123!5m2!1sen!2s" 
        style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
    </iframe>
</div>


       

    </div>
</div>
</asp:Content>
