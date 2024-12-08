<%@ Page Title="Our Achievers" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="OurAchivers.aspx.cs" Inherits="OurAchivers" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="Content/pages.css">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="Content" runat="Server">
    <section class="py-5 bg-light">
        <div class="container bg-white rounded shadow-sm py-5 px-4">
            <h1 class="text-center text-white bg-gradient-primary rounded-top p-4 mb-4">Meet Our Achievers</h1>

            <!-- Achievers List -->
            <div class="row">
                <asp:Repeater ID="AchiverRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-md-6 mb-4">
                            <div class="card shadow-sm">
                                <div class="row g-0 align-items-center">
                                    <!-- Achiever Image -->
                                    <div class="col-md-4 text-center p-3">
                                        <img class="img-fluid rounded-circle" src='<%# Eval("ImagePath") %>' alt='<%# Eval("FirstName") %>' style="max-width: 120px;">
                                        <h4 class="text-primary mt-2">
                                            <%# Eval("FirstName") %> <%# Eval("MidName") %> <%# Eval("LastName") %>
                                        </h4>
                                        <p><strong>Session:</strong> <%# Eval("Session") %></p>
                                    </div>

                                    <!-- Achiever Details -->
                                    <div class="col-md-8 p-3">
                                        <p><strong>Achievement:</strong> <%# Eval("Achivement") %></p>
                                        <p><strong>Qualification:</strong> <%# Eval("Qualification") %></p>
                                        <p><strong>Occupation / Job:</strong> <%# Eval("Occupation") %></p>
                                        <p><strong>Work Location / Company:</strong> <%# Eval("Company") %></p>
                                        <p><i class="fa fa-phone"></i> <strong>Phone:</strong> <a href='tel:<%# Eval("Phone") %>'><%# Eval("Phone") %></a></p>
                                        <p><i class="fa fa-envelope"></i> <strong>Email:</strong> <a href='mailto:<%# Eval("Email") %>'><%# Eval("Email") %></a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>
</asp:Content>
