<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Home.aspx.cs" Inherits="WebNexus_UwUKitten.Pages.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- HERO SECTION -->
<section class="text-center py-20 bg-cover bg-center" style="background-image: url('<%= ResolveUrl("~/Images/hero-img.jpg") %>');">
    <h1 class="text-5xl font-bold mb-4 text-black">Crafting Digital Experiences That Inspire</h1>
    <p class="text-xl text-black mb-8">Transforming ideas into interactive, elegant solutions.</p>
    <div class="space-x-4">
        <asp:HyperLink NavigateUrl="~/Pages/Contact.aspx" CssClass="bg-blue-700 text-white px-6 py-3 rounded hover:bg-blue-800 transition" runat="server">Contact</asp:HyperLink>
        <asp:HyperLink NavigateUrl="~/Images/resume.docx" CssClass="bg-white text-blue-700 px-6 py-3 rounded hover:bg-gray-300 transition" Target="_blank" runat="server">Download Resume</asp:HyperLink>
    </div>
</section>


    <!-- SERVICES OVERVIEW -->
    <section class="py-16 bg-white">
        <h2 class="text-3xl font-bold text-center mb-10">What I Offer</h2>
        <div class="grid md:grid-cols-3 gap-8 px-6 md:px-16">
            <asp:Repeater ID="rptServices" runat="server">
                <ItemTemplate>
                    <div class="border p-6 rounded shadow hover:shadow-lg transition">
                        <h3 class="text-xl font-semibold mb-2"><%# Eval("Title") %></h3>
                        <p class="text-gray-700 text-sm"><%# Eval("Description") %></p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>

    <!-- HIGHLIGHTS / ACHIEVEMENTS -->
 
    <!-- TESTIMONIAL HIGHLIGHT -->
    <section class="py-16 bg-white">
        <h2 class="text-3xl font-bold text-center mb-10">What Clients Say</h2>
        <div class="max-w-2xl mx-auto text-center bg-blue-50 p-8 rounded shadow">
            <asp:Repeater ID="rptTestimonials" runat="server">
                <ItemTemplate>
                    <p class="text-lg italic text-gray-800">“<%# Eval("Quote") %>”</p>
                    <div class="mt-4 text-sm text-blue-900 font-semibold"><%# Eval("ClientName") %>, <%# Eval("Company") %></div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>

</asp:Content>

 