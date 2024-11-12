<%@ Page Title="Our Alumni" Language="C#" MasterPageFile="Website.master" AutoEventWireup="true" CodeFile="OurAlumni.aspx.cs" Inherits="pages_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="style/site.css">
    <link rel="stylesheet" href="style/alumni.css">
    <style>
        .cont .container {
            max-width: 1320px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <div class="cont">
        <div class="container">
            <h1>Meet Our Alumni</h1>
            <div class="search-bar">
                <label>
                    Session:
                <asp:DropDownList ID="ddlSession" runat="server" CssClass="dropdown">
                </asp:DropDownList>
                </label>
                <label>
                    Roll&nbsp;No:
                <asp:TextBox ID="txtRollNo" runat="server" CssClass="textbox"></asp:TextBox>
                </label>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"
                    CssClass="btn" />
                <label>
                    Records&nbsp;per&nbsp;page:
                <asp:DropDownList ID="ddlRecordsPerPage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlRecordsPerPage_SelectedIndexChanged"
                    CssClass="dropdown">
                    <asp:ListItem Value="10" Text="10" />
                    <asp:ListItem Value="20" Text="20" />
                    <asp:ListItem Value="50" Text="50" />
                </asp:DropDownList>
                </label>
                <asp:Button ID="btnPrevious" runat="server" Text="Previous" OnClick="btnPrevious_Click"
                    CssClass="btn" />
                <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" CssClass="btn" />
            </div>
            <asp:Repeater ID="facultyRepeater" runat="server">
                <ItemTemplate>
                    <div class="faculty-member">
                        <div class="col1">
                            <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("Name") %>' />
                            <h2>
                                <%# Eval("Name") %></h2>
                        </div>
                        <div class="col2">
                            <p>
                                <strong>Session:</strong>
                                <%# Eval("Session")%>
                            </p>
                            <p>
                                <strong>Qualification:</strong>
                                <%# Eval("Qualification") %>
                            </p>
                            <p>
                                <strong>Occupation / Job:</strong>
                                <%# Eval("Occupation")%>
                            </p>
                            <p>
                                <strong>Work Location / Company:</strong>
                                <%# Eval("Company")%>
                            </p>
                            <p class="contact-info">
                                <i class="fa fa-phone" aria-hidden="true"></i><strong>Phone No:</strong> <a href='tel:<%# Eval("Phone") %>'>
                                    <%# Eval("Phone") %></a>
                            </p>
                        </div>
                        <div class="col3">
                            <p class="contact-info">
                                <i class="fa fa-envelope" aria-hidden="true"></i><strong>Email-Id:</strong> <a href='mailto:<%# Eval("Email") %>'>
                                    <%# Eval("Email") %></a>
                            </p>
                            <p class="contact-info">
                                <i class="fa fa-linkedin" aria-hidden="true"></i><strong>Linkedin:</strong> <a href='https://www.linkedin.com/in/<%# Eval("LinkedIn") %>'
                                    target="_blank">@<%# Eval("LinkedIn") %></a>
                            </p>
                            <p class="contact-info">
                                <i class="fa fa-facebook" aria-hidden="true"></i><strong>Facebook:</strong> <a href='https://www.facebook.com/<%# Eval("Facebook") %>'
                                    target="_blank">@<%# Eval("Facebook")%></a>
                            </p>
                            <p class="contact-info">
                                <i class="fa fa-instagram" aria-hidden="true"></i><strong>Instagram:</strong> <a
                                    href='https://www.instagram.com/<%# Eval("Instagram") %>' target="_blank">@<%# Eval("Instagram")%></a>
                            </p>
                            <p class="contact-info">
                                <i class="fa fa-twitter" aria-hidden="true"></i><strong>Twitter/X:</strong> <a href='https://x.com/<%# Eval("Twitter") %>'
                                    target="_blank">@<%# Eval("Twitter")%></a>
                            </p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
