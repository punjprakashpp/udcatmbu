<%@ Page Title="Administrative Persons" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="AdministrativePersons.aspx.cs" Inherits="pages_Default" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="style/faculty.css">
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="Content" runat="Server">
    <div class="cont">
        <div class="container">
            <div class="header">
                <h1>Administrative Persons</h1>
            </div>
            <div class="faculty-member">
                <asp:Image ID="Image" class="img" runat="server" />
                <div class="faculty-details">
                    <h2>
                        <asp:Label ID="lblName" runat="server" Text=""></asp:Label></h2>
                    <p><strong>Hon'ble</strong>&nbsp;Governer of Bihar</p>
                    <p><strong>Position:</strong>&nbsp;<asp:Label ID="lblType" runat="server" Text=""></asp:Label></p>
                    <p><strong>To know more:</strong>&nbsp;<a href="https://governor.bih.nic.in/" target="_blank">Click here</a></p>
                </div>
            </div>
            <asp:Repeater ID="AdministrativeRepeater" runat="server">
                <ItemTemplate>
                    <div class="faculty-member">
                        <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("Name") %>' />
                        <div class="faculty-details">
                            <h2><%# Eval("Name") %></h2>
                            <p><strong>Position:</strong>&nbsp;<%# Eval("Type") %></p>
                            <p class="contact-info">
                                <i class="fa fa-phone"></i>&nbsp;<strong>Phone No: </strong><a href='tel:<%# Eval("Phone") %>'>&nbsp;<%# Eval("Phone") %></a>
                            </p>
                            <p class="contact-info">
                                <i class="fa fa-envelope"></i>&nbsp;<strong>Email-Id:</strong> <a href='mailto:<%# Eval("Email") %>'>&nbsp;<%# Eval("Email") %></a>
                            </p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
