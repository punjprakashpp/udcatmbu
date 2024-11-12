<%@ Page Title="Our Achivers" Language="C#" MasterPageFile="~/Website.master" AutoEventWireup="true" CodeFile="OurAchivers.aspx.cs" Inherits="OurAchivers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="style/StyleSheet.css" />
    <style>
        .pic {
            border-radius: 50%;
        }

        .row {
            border-radius: 10px;
        }

        .pic, .row {
            border: 4px solid #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <div class="container">
        <h1 class="text-center">Meet Our Achivers</h1>
        <div class="row">
            <asp:Repeater ID="AchiverRepeater" runat="server">
                <ItemTemplate>
                    <div class="col col-6 mt-10 mb-10">
                        <div class="row">
                            <div class="col col-5 mt-10 mb-10 text-center">
                                <img class="pic" src='<%# Eval("ImagePath") %>' alt='<%# Eval("FirstName") %>' />
                                <h2><%# Eval("FirstName") %> <%# Eval("MidName") %> <%# Eval("LastName") %></h2>
                                <p><strong>Session: </strong><%# Eval("Session")%></p>
                            </div>
                            <div class="col col-7 mt-10 mb-10">
                                <p><strong>Achivement: </strong><%# Eval("Achivement")%></p>
                                <p><strong>Qualification:</strong><%# Eval("Qualification") %></p>
                                <p><strong>Occupation / Job:</strong><%# Eval("Occupation")%></p>
                                <p><strong>Work Location / Company:</strong><%# Eval("Company")%></p>
                                <p class="contact-info"><i class="fa fa-phone" aria-hidden="true"></i><strong>Phone No:</strong> <a href='tel:<%# Eval("Phone") %>'><%# Eval("Phone") %></a></p>
                                <p class="contact-info"><i class="fa fa-envelope" aria-hidden="true"></i><strong>Email-Id:</strong> <a href='mailto:<%# Eval("Email") %>'><%# Eval("Email") %></a></p>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>