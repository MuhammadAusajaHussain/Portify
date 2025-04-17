<%@ Page Title="About Me" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebNexus_UwUKitten.Pages.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="max-w-5xl mx-auto text-center mt-6">
        <!-- Professional Biography -->
        <h1 class="text-4xl font-bold mb-6">Hi, I’m Muhammad Abdullah 👋</h1>
        <p class="text-lg text-gray-700 leading-relaxed mb-8">
            I’m a passionate full-stack developer with expertise in building scalable ASP.NET applications, designing optimized databases, and crafting responsive UI experiences. I strive to deliver clean, efficient, and impactful digital solutions.
        </p>

        <!-- Photo -->
        <div class="mb-10">
            <img src="<%= ResolveUrl("~/Images/profile-img.jpg") %>" alt="Profile Photo" class="rounded-full mx-auto shadow-lg w-48 h-48 object-cover">
        </div>

        <!-- Intro Video -->
        <div class="mb-12">
            <h2 class="text-2xl font-semibold mb-4">Intro Video</h2>
            <div class="aspect-w-16 aspect-h-9 w-full">
                <iframe class="w-full h-96 rounded shadow-xl mx-auto"
                    src="https://www.youtube.com/embed/P54QwJt4dC8"
                    title="Intro Video"
                    frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    allowfullscreen>
                </iframe>
            </div>
        </div>

        <!-- Certifications & Achievements -->
        <h2 class="text-2xl font-semibold mb-4">Certifications & Achievements</h2>

        <asp:Repeater ID="rptCertifications" runat="server">
            <HeaderTemplate>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6 justify-center items-center mb-8">
            </HeaderTemplate>
            <ItemTemplate>
                <div class="flex items-center space-x-4 bg-gray-100 p-4 rounded shadow">
                    <img src="https://img.icons8.com/color/48/000000/certificate.png" alt="Certificate Icon" />
                    <div class="text-left">
                        <p class="font-medium"><%# Eval("Title") %></p>
                        <p class="text-sm text-gray-600">
                            <%# Eval("Institution") %> - 
                            <%# Eval("IssuedDate", "{0:MMM yyyy}") %>
                        </p>
                    </div>
                </div>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>

        <!-- CTA -->
        <div class="mt-10">
            <a href="<%= ResolveUrl("~/Pages/Contact.aspx") %>" class="inline-block bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 px-6 rounded transition">
                Get in Touch
            </a>
        </div>
    </div>
</asp:Content>
