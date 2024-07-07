<%@ Page Title="" Language="C#" MasterPageFile="../Site.master" AutoEventWireup="true" CodeFile="ViewAlumni.aspx.cs" Inherits="Admin_pages_ViewFaculty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <title>View Alumni</title>
    <link rel="stylesheet" href="../Styles/faculty.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>View Alumni</h2>
    <div class="search-bar">
            <label>
                Search Session:
                <asp:DropDownList ID="ddlSession" runat="server" CssClass="dropdown">
                </asp:DropDownList>
            </label>
            <label>
                Roll No:
                <asp:TextBox ID="txtRollNo" runat="server" CssClass="textbox"></asp:TextBox>
            </label>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"
                CssClass="btn" />
            <label>
                Records per page:
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
                    <img src='<%# "../../" + Eval("ImagePath") %>' alt='<%# Eval("Name") %>' />
                    <div class="faculty-details">
                        <h2><%# Eval("Name") %></h2>
                        <p><strong>Session:</strong> <%# Eval("Session")%></p>
                        <p><strong>Qualification:</strong> <%# Eval("Qualification") %></p>
                        <p><strong>Occupation / Job: </strong> <%# Eval("Occupation")%></p>
                        <p class="contact-info">
                            <i class="fa fa-phone" aria-hidden="true"></i>
                            <strong>Phone No: </strong>
                            <a href='tel:<%# Eval("Phone") %>'><%# Eval("Phone") %></a>
                        </p>
                        <p class="contact-info">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                            <strong>Email-Id:</strong>
                            <a href='mailto:<%# Eval("Email") %>'><%# Eval("Email") %></a>
                        </p>
                        <p class="contact-info">
                            <i class="fa fa-linkedin" aria-hidden="true"></i>
                            <strong>Linkedin:</strong>
                            <a href='https://www.linkedin.com/in/<%# Eval("LinkedIn") %>' target="_blank">@<%# Eval("LinkedIn") %></a>
                        </p>
                        <p class="contact-info">
                            <i class="fa fa-facebook" aria-hidden="true"></i>
                            <strong>Facebook:</strong>
                            <a href='https://www.facebook.com/<%# Eval("Facebook") %>' target="_blank">@<%# Eval("Facebook")%></a>
                        </p>
                        <p class="contact-info">
                            <i class="fa fa-instagram" aria-hidden="true"></i>
                            <strong>Instagram:</strong>
                            <a href='https://www.instagram.com/<%# Eval("Instagram") %>' target="_blank">@<%# Eval("Instagram")%></a>
                        </p>
                        <p class="contact-info">
                            <i class="fa fa-twitter" aria-hidden="true"></i>
                            <strong>Twitter/X:</strong>
                            <a href='https://x.com/<%# Eval("Twitter") %>' target="_blank">@<%# Eval("Twitter")%></a>
                        </p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
</asp:Content>

