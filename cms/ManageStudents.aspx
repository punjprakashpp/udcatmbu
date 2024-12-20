<%@ Page Title="" Language="C#" MasterPageFile="cms.master" AutoEventWireup="true" CodeFile="ManageStudents.aspx.cs" Inherits="ManageStudents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function confirmDelete() {
            return confirm("Are you sure you want to delete this student?");
        }
        function confirmSessionDelete() {
            return confirm("Are you sure you want to delete this session?");
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container mt-4">
        <div class="text-center mb-4">
            <h2 class="text-danger">Delete Student Data of Entire Session</h2>
        </div>
        <div class="row mb-4">
            <div class="col-12 col-md-6">
                <div class="mb-3">
                    <label for="ddlSessionDelete" class="form-label">Select a Session to Remove:</label>
                    <asp:DropDownList ID="ddlSessionDelete" runat="server" CssClass="form-select"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rvfSessionDelete" runat="server" ControlToValidate="ddlSessionDelete"
                        ErrorMessage="Please select a session" ForeColor="Red" ValidationGroup="SessionDeleteValidation" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-12 col-md-6">
                <asp:Button ID="btnDeleteSession" runat="server" CssClass="btn btn-danger" OnClick="btnDeleteSession_Click" ValidationGroup="SessionDeleteValidation"
                    Text="Delete Session" OnClientClick="return confirmSessionDelete();" />
            </div>
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="text-center d-block text-danger mb-4"></asp:Label>

        <div class="text-center mb-4">
            <h2 class="text-primary">Manage Student Detail</h2>
        </div>
        <div class="row mb-4">
            <div class="col-12">
                <div class="row g-3 align-items-end">
                    <div class="col-md-4">
                        <label for="ddlSession" class="form-label">Select Session:</label>
                        <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-select"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvSession" runat="server" ControlToValidate="ddlSession"
                            InitialValue="" ErrorMessage="Session is required." ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-4">
                        <label for="SearchCriteria" class="form-label">Search for Student via:</label>
                        <div>
                            <asp:RadioButton ID="rdRoll" runat="server" Text="Roll No." GroupName="SearchCriteria" AutoPostBack="True" class="form-check-input me-2" />
                            <asp:RadioButton ID="rdName" runat="server" Text="First Name" GroupName="SearchCriteria" AutoPostBack="True" class="form-check-input" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label for="txtsearch" class="form-label">Enter Search Text:</label>
                        <asp:TextBox ID="txtsearch" runat="server" CssClass="form-control" placeholder="Enter search term"></asp:TextBox>
                    </div>
                </div>
                <div class="d-flex justify-content-end mt-3">
                    <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" OnClick="btnSearch_Click" Text="Search" />
                    <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" CssClass="btn btn-secondary ms-2" />
                </div>
            </div>
        </div>

        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <asp:Label ID="lbl" CssClass="text-center d-block text-danger mb-4" runat="server"></asp:Label>
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped text-center"
                        OnRowCommand="GridView1_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="Session" HeaderText="Session" />
                            <asp:BoundField DataField="RollNo" HeaderText="Roll No" />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" ReadOnly="True" SortExpression="FirstName" />
                            <asp:BoundField DataField="MidName" HeaderText="Middle Name" ReadOnly="True" SortExpression="MidName" />
                            <asp:BoundField DataField="LastName" HeaderText="Last Name" ReadOnly="True" SortExpression="LastName" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkview" runat="server" CommandArgument='<%# Eval("StudentID") %>' CommandName="View" CssClass="btn btn-link" Text="View"></asp:LinkButton>
                                    <asp:LinkButton ID="lnkRem" runat="server" CommandName="Remove" CommandArgument='<%# Eval("StudentID") %>' CssClass="btn btn-link text-danger" Text="Remove" OnClientClick="return confirmDelete();"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </asp:View>

            <asp:View ID="View2" runat="server">
                <div class="text-center mb-4">
                    <label class="form-label">Student's Detail</label>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <table class="table">
                            <tr>
                                <td>Session:</td>
                                <td><asp:Label ID="lblSession" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Roll No:</td>
                                <td><asp:Label ID="lblRollNo" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Registration No:</td>
                                <td><asp:Label ID="lblRegNo" runat="server"></asp:Label>/<asp:Label ID="lblRegYear" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Full Name:</td>
                                <td>
                                    <asp:Label ID="lblFirstName" runat="server"></asp:Label>
                                    <asp:Label ID="lblMidName" runat="server"></asp:Label>
                                    <asp:Label ID="lblLastName" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Date of Birth:</td>
                                <td><asp:Label ID="lbldob" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Gender:</td>
                                <td><asp:Label ID="lblGen" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="text-center">
                                    <asp:Button ID="btnBack" runat="server" CssClass="btn btn-secondary" OnClick="btnBack_Click" Text="Back" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
