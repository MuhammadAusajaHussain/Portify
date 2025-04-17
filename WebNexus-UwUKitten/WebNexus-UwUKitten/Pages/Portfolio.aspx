<%@ Page Title="Portfolio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Portfolio.aspx.cs" Inherits="WebNexus_UwUKitten.Pages.Portfolio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="bg-white text-gray-900 font-sans">
        <!-- Main Content -->
        <div class="container mx-auto px-4 py-8">
             <h1 class="text-4xl font-bold text-center text-blue-800 mb-10">Our Portfolio</h1>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                <!-- Loop through Projects and display -->
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="bg-white shadow-lg rounded-lg overflow-hidden">
                            <div class="flex justify-center">
                                  <img src="<%# Eval("ImageUrl") %>" alt="Project Image" class="w-[60%] h-64 object-cover">
                            </div>
                          
                            <div class="p-4">
                                <h3 class="text-xl font-semibold text-blue-800"><%# Eval("Title") %></h3>
                                <p class="text-gray-700 mt-2"><%# Eval("Description") %></p>
                                <p class="text-gray-600 text-sm mt-2"><strong>Client:</strong> <%# Eval("ClientName") %></p>

                                <!-- Problem + Solution -->
                                <div class="mt-4">
                                    <h4 class="font-semibold text-gray-800">Problem & Solution:</h4>
                                    <p class="text-gray-700"><%# Eval("Outcome") %></p>
                                </div>

                                <!-- Client Testimonial -->
                                <div class="mt-4">
                                    <h4 class="font-semibold text-gray-800">Client Testimonial:</h4>
                                    <%# Eval("TestimonialQuote") != DBNull.Value ? 
                                    string.Format("\"{0}\"", Eval("TestimonialQuote")) : "" %>
                                </div>

                                <!-- Outcome -->
                                <div class="mt-4">
                                    <h4 class="font-semibold text-gray-800">Outcome:</h4>
                                    <p class="text-gray-700"><%# Eval("Outcome") %></p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
