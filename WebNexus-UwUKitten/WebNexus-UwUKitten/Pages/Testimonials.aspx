<%@ Page Title="Testimonials" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Testimonials.aspx.cs" Inherits="WebNexus_UwUKitten.Pages.Testimonials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="bg-white text-gray-900 font-sans">
            <div class="container mx-auto px-4 py-10">
                <h1 class="text-4xl font-bold text-center text-blue-800 mb-10">What Clients Say</h1>

                <!-- Client Logos -->
               

                <!-- Testimonials Grid -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                    <asp:Repeater ID="TestimonialRepeater" runat="server">
                        <ItemTemplate>
                            <div class="bg-gray-100 rounded-lg shadow-md p-6">
                                <p class="italic text-gray-800">“<%# Eval("Quote") %>”</p>
                                <p class="mt-4 font-semibold text-blue-900"><%# Eval("ClientName") %> - <%# Eval("Company") %></p>
                                
                                <!-- Optional: Star Rating -->
                                <div class="flex mt-2 text-yellow-500">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                </div>

                                <!-- Optional: Case Study link (assumes Projects table is linked) -->
                                <%# !string.IsNullOrEmpty(Eval("ProjectTitle") as string) ? 
                                    $"<a href='Portfolio.aspx' class='text-sm text-blue-600 hover:underline mt-2 inline-block'>View Case Study</a>" : "" %>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <!-- Optional: Video Testimonial Section -->
                <div class="mt-16 text-center">
                    <h2 class="text-2xl font-bold text-blue-800 mb-4">Hear from Our Clients</h2>
                    <div class="aspect-w-16 aspect-h-9 mx-auto max-w-4xl">
                        <iframe class="w-full h-96 rounded-lg shadow-md"
                                src="https://www.youtube.com/watch?v=8LSt8_11wbQ"
                                title="Video Testimonial"
                                frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen></iframe>
                    </div>
                </div>
            </div>
    </div>
</asp:Content>
