<%@ Page Title="CMS Login" Language="C#" EnableEventValidation="false" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="Content/pages.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <section class="py-4 bg-light">
        <div class="container contain bg-white rounded shadow-sm p-5">
            <h2 class="text-center text-primary mb-4">
                <i class="fas fa-user-lock"></i>Admin / User Login
            </h2>
            <div class="row justify-content-center">
                <div class="col-12 col-md-6">
                    <div class="card shadow border-0">
                        <div class="card-body">
                            <asp:Label ID="lblMessage" runat="server" Text="Login to Website's Content Management System" CssClass="form-text text-muted text-center mb-4"></asp:Label>
                            <div class="mb-3">
                                <label for="txtUserName" class="form-label"><i class="fas fa-user"></i>Username:</label>
                                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" Placeholder="Enter your username"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <label for="txtPassword" class="form-label"><i class="fas fa-lock"></i>Password:</label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Enter your password"></asp:TextBox>
                            </div>
                            <div class="form-check mb-3">
                                <asp:CheckBox ID="chkboxRem" runat="server" CssClass="form-check-input" />
                                <label class="form-check-label" for="chkboxRem">Remember me</label>
                            </div>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary me-md-2" Text="Login" OnClick="btnLogin_Click"></asp:Button>
                                <asp:Button ID="btnReset" runat="server" CssClass="btn btn-secondary" Text="Reset" OnClick="btnReset_Click"></asp:Button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
