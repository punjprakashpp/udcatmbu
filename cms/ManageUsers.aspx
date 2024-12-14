<%@ Page Title="Manage Users" Language="C#" MasterPageFile="~/cms/cms.master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="Account_Manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Manage Users</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container">
        <h2 class="text-center">Manage Users</h2>
        <asp:Label ID="lblMessage" runat="server" CssClass="text-success"></asp:Label>
        <div class="row">
            <div class="col col-md-8 m-auto">
                <div class=" table-responsive">
                    <asp:GridView ID="gridUsers" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="UserId,UserName" OnRowDeleting="gridUsers_RowDeleting"
                        CssClass="table table-bordered">
                        <Columns>
                            <asp:BoundField DataField="UserName" HeaderText="Username" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                            <asp:BoundField DataField="Role" HeaderText="User Type" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                            <asp:BoundField DataField="MidName" HeaderText="Middle Name" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                            <asp:BoundField DataField="LastName" HeaderText="Last Name" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                            <asp:CommandField HeaderText="Action" ShowDeleteButton="True" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" DeleteText="Remove" ButtonType="Button" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>