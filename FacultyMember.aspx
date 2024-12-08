<%@ Page Title="Faculty Members" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="FacultyMember.aspx.cs" Inherits="pages_Default" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="Content/pages.css">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="Content" runat="Server">
    <section class="py-5 bg-light">
        <div class="container contain bg-white rounded shadow-sm py-5 px-4">
            <div class="text-center bg-gradient-primary text-white p-4 rounded">
                <h1>Our Faculty Members</h1>
            </div>
            <div class="mt-4">
                <asp:Repeater ID="facultyRepeater" runat="server">
                    <ItemTemplate>
                        <div class="card shadow-sm mb-4">
                            <div class="row g-0 align-items-center">
                                <div class="col-md-3 text-center">
                                    <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("Name") %>' class="img-fluid rounded-circle p-3" />
                                </div>
                                <div class="col-md-9 p-3">
                                    <h2 class="h5 mb-2"><%# Eval("Name") %></h2>
                                    <p><strong>Qualification:</strong>&nbsp;<%# Eval("Qualification") %></p>
                                    <p><strong>Position:</strong>&nbsp;<%# Eval("Position") %></p>
                                    <p class="mb-1"><i class="fa fa-phone"></i>&nbsp;<strong>Phone:</strong>&nbsp;<a href='tel:<%# Eval("Phone") %>'><%# Eval("Phone") %></a></p>
                                    <p><i class="fa fa-envelope"></i>&nbsp;<strong>Email:</strong>&nbsp;<a href='mailto:<%# Eval("Email") %>'><%# Eval("Email") %></a></p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="text-center bg-gradient-primary text-white p-4 rounded">
                    <h1>Our Guest Faculty Members</h1>
                </div>
                <asp:Repeater ID="GuestRepeater" runat="server">
                    <ItemTemplate>
                        <div class="card shadow-sm mb-4">
                            <div class="row g-0 align-items-center">
                                <div class="col-md-3 text-center">
                                    <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("Name") %>' class="img-fluid rounded-circle p-3" />
                                </div>
                                <div class="col-md-9 p-3">
                                    <h2 class="h5 mb-2"><%# Eval("Name") %></h2>
                                    <p><strong>Qualification:</strong>&nbsp;<%# Eval("Qualification") %></p>
                                    <p><strong>Position:</strong>&nbsp;<%# Eval("Position") %></p>
                                    <p class="mb-1"><i class="fa fa-phone"></i>&nbsp;<strong>Phone:</strong>&nbsp;<a href='tel:<%# Eval("Phone") %>'><%# Eval("Phone") %></a></p>
                                    <p><i class="fa fa-envelope"></i>&nbsp;<strong>Email:</strong>&nbsp;<a href='mailto:<%# Eval("Email") %>'><%# Eval("Email") %></a></p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="text-center bg-gradient-primary text-white p-4 rounded">
                    <h1>Our Former Faculty Members</h1>
                </div>
                <asp:Repeater ID="FormerRepeater" runat="server">
                    <ItemTemplate>
                        <div class="card shadow-sm mb-4">
                            <div class="row g-0 align-items-center">
                                <div class="col-md-3 text-center">
                                    <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("Name") %>' class="img-fluid rounded-circle p-3" />
                                </div>
                                <div class="col-md-9 p-3">
                                    <h2 class="h5 mb-2"><%# Eval("Name") %></h2>
                                    <p><strong>Qualification:</strong>&nbsp;<%# Eval("Qualification") %></p>
                                    <p><strong>Position:</strong>&nbsp;<%# Eval("Position") %></p>
                                    <p class="mb-1"><i class="fa fa-phone"></i>&nbsp;<strong>Phone:</strong>&nbsp;<a href='tel:<%# Eval("Phone") %>'><%# Eval("Phone") %></a></p>
                                    <p><i class="fa fa-envelope"></i>&nbsp;<strong>Email:</strong>&nbsp;<a href='mailto:<%# Eval("Email") %>'><%# Eval("Email") %></a></p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>
</asp:Content>
