<%@ Page Title="Delete Student" Language="C#" MasterPageFile="cms.master" AutoEventWireup="true" CodeFile="DeleteStudent.aspx.cs" Inherits="Librarian_RemoveStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="../style/StyleSheet.css" />
    <script type="text/javascript">
        function confirmDelete() {
            return confirm("Are you sure you want to delete this student?");
        }
        function confirmSessionDelete() {
            return confirm("Are you sure you want to delete this session?");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <div class="container">
        <h2 class="text-center">Delete Student Data</h2>
        <div class="row">
            <div class="col col-12">
                <table class="table">
                    <tr>
                        <td class="lbl">Select an entire Session to Remove :</td>
                        <td>
                            <asp:DropDownList ID="ddlSession" runat="server" CssClass="txt"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="btnRemSem" runat="server" CssClass="btn btn-secondary" OnClick="btnRemSem_Click" ValidationGroup="SessionValidation"
                                Text="Delete Session" OnClientClick="return confirmSessionDelete();" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlSession"
                                ErrorMessage="Please select a session" ForeColor="Red" ValidationGroup="SessionValidation" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col col-12">
                <table class="table">
                    <tr>
                        <td>Search a Student to Remove via :</td>
                        <td>
                            <asp:RadioButton ID="rdRoll" runat="server" Text="Roll No. :" GroupName="SearchCriteria"
                                AutoPostBack="True" />
                            <asp:RadioButton ID="rdName" runat="server" Text="First Name :" GroupName="SearchCriteria"
                                AutoPostBack="True" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtsearch" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnsearch" runat="server" CssClass="btn btn-primary" OnClick="btnsearch_Click"
                                Text="Search" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <asp:Label ID="lblmsg" runat="server" CssClass="label" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="row">
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <asp:Label ID="lbl" CssClass="label text-center" runat="server"></asp:Label>
                    <div class="col col-12">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table text-center"
                            OnRowCommand="GridView1_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="Session" HeaderText="Session" />
                                <asp:BoundField DataField="RollNo" HeaderText="Roll No" />
                                <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                                <asp:BoundField DataField="MidName" HeaderText="Middle Name" />
                                <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                                <asp:TemplateField HeaderText="Remove">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkRem" runat="server" CommandName="Remove" CommandArgument='<%# Eval("StudentID") %>'
                                            CssClass="lnk" Text="Remove" OnClientClick="return confirmDelete();" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>
