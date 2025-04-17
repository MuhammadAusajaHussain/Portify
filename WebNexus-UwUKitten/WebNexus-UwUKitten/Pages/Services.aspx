<%@ Page Title="Services" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="WebNexus_UwUKitten.Pages.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="bg-white text-gray-900 font-sans">
        
            <div class="container mx-auto px-4 py-10">
                <h1 class="text-4xl font-bold text-center text-blue-800 mb-10">Our Services</h1>
                
                <!-- Service List -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 mb-16">
                    <asp:Repeater ID="RepeaterServices" runat="server">
                        <ItemTemplate>
    <div class="bg-gray-100 p-6 rounded-lg shadow-md flex flex-col justify-between h-full">
        <div>
            <h2 class="text-2xl font-semibold text-blue-700"><%# Eval("Title") %></h2>
            <p class="mt-2 text-gray-800"><%# Eval("Description") %></p>
            <p class="mt-2 text-green-700 font-semibold">
                <%# Eval("Price") != DBNull.Value ? "Price: $" + string.Format("{0:0.00}", Eval("Price")) : "Contact for pricing" %>
            </p>
        </div>
        <a href="#bookingForm" class="inline-block mt-6 text-center text-white bg-blue-600 px-4 py-2 rounded hover:bg-blue-700 transition">
            Schedule a Consultation
        </a>
    </div>
</ItemTemplate>

                    </asp:Repeater>
                </div>

                <!-- Booking Form -->
                <div id="bookingForm" class="bg-white p-8 shadow-lg rounded-lg max-w-2xl mx-auto">
                    <h2 class="text-2xl font-bold text-blue-800 mb-4">Book a Consultation</h2>
                    <div class="grid grid-cols-1 gap-4">
                        <label class="block">Name:
                            <asp:TextBox ID="txtName" runat="server" CssClass="w-full border p-2 rounded" />
                        </label>
                        <label class="block">Email:
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="w-full border p-2 rounded" TextMode="Email" />
                        </label>
                        <label class="block">Select Service:
                            <asp:DropDownList ID="ddlServices" runat="server" CssClass="w-full border p-2 rounded"></asp:DropDownList>
                        </label>
                        <label class="block">Preferred Date & Time:
                            <asp:TextBox ID="txtDateTime" runat="server" CssClass="w-full border p-2 rounded" TextMode="DateTimeLocal" />
                        </label>
                        <label class="block">Message:
                            <asp:TextBox ID="txtMessage" runat="server" CssClass="w-full border p-2 rounded" TextMode="MultiLine" Rows="3" />
                        </label>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700" OnClick="btnSubmit_Click" />
                        <asp:Label ID="lblStatus" runat="server" CssClass="text-green-600 mt-2"></asp:Label>
                    </div>
                </div>
            </div>
      
    </div>
</asp:Content>
