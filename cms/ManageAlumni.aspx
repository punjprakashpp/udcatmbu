<%@ Page Title="" Language="C#" MasterPageFile="cms.master" AutoEventWireup="true" CodeFile="ManageAlumni.aspx.cs" Inherits="ManageAlumni" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container mt-4">
        <!-- Title -->
        <div class="text-center mb-4">
            <h2 class="text-primary">Manage Alumni Details</h2>
        </div>

        <!-- Message Label -->
        <asp:Label ID="lblMessage" runat="server" CssClass="text-center d-block text-danger mb-4"></asp:Label>

        <!-- Search Form -->
        <div class="row g-3 mb-4">
            <div class="col-md-4">
                <label for="ddlSession" class="form-label">Select Session:</label>
                <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-select"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvSession" runat="server" ControlToValidate="ddlSession" InitialValue="" ErrorMessage="Session is required." ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-4">
                <label for="txtsearch" class="form-label">Search for Alumni via Name:</label>
                <asp:TextBox ID="txtsearch" runat="server" CssClass="form-control" placeholder="Enter search term"></asp:TextBox>
            </div>
            <div class="col-md-4 d-flex align-items-end">
                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary me-2" OnClick="btnSearch_Click" Text="Search" />
                <asp:Button ID="btnReset" runat="server" CssClass="btn btn-secondary" OnClick="btnReset_Click" Text="Reset" />
            </div>
        </div>

        <!-- MultiView Section -->
        <asp:MultiView ID="MultiView1" runat="server">
            <!-- View 1: Grid View -->
            <asp:View ID="View1" runat="server">
                <asp:Label ID="lbl" CssClass="text-center d-block text-danger mb-4" runat="server"></asp:Label>
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped text-center" OnRowCommand="GridView1_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="Session" HeaderText="Session" />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" ReadOnly="True" SortExpression="FirstName" />
                            <asp:BoundField DataField="MidName" HeaderText="Middle Name" ReadOnly="True" SortExpression="MidName" />
                            <asp:BoundField DataField="LastName" HeaderText="Last Name" ReadOnly="True" SortExpression="LastName" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkview" runat="server" CommandArgument='<%# Eval("StudentID") %>' CommandName="Manage" CssClass="btn btn-link" Text="Manage"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </asp:View>

            <!-- View 2: Student Details Form -->
            <asp:View ID="View2" runat="server">
                <div class="text-center mb-4">
                    <label class="form-label">Alumni's Details</label>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="mb-3">
                            <label for="ddlSessionUpdate" class="form-label">Session:</label>
                            <asp:DropDownList ID="ddlSessionUpdate" runat="server" CssClass="form-select"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rvfddlSessionUpdate" runat="server" ControlToValidate="ddlSessionUpdate" InitialValue="" ErrorMessage="Session is required." ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3">
                            <label for="txtFirstName" class="form-label">First Name:</label>
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="e.g. Saurabh"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is required." ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3">
                            <label for="txtMidName" class="form-label">Middle Name (if applicable):</label>
                            <asp:TextBox ID="txtMidName" runat="server" CssClass="form-control" placeholder="e.g. Kumar"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="txtLastName" class="form-label">Last Name:</label>
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="e.g. Suman"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is required." ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3">
                            <label for="txtPhone" class="form-label">Phone No:</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="e.g. 9060311534"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revPhoneNo" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone No should be 10 digits." ForeColor="Red" ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="mb-3">
                            <label for="txtEmail" class="form-label">Email ID:</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="e.g. punjprakashpp@gmail.com"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email format." ForeColor="Red" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="mb-3">
                            <label for="txtQualification" class="form-label">Qualification:</label>
                            <asp:TextBox ID="txtQualification" runat="server" CssClass="form-control" placeholder="e.g. MCA"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="txtOccupation" class="form-label">Occupation / Job:</label>
                            <asp:TextBox ID="txtOccupation" runat="server" CssClass="form-control" placeholder="e.g. Full Stack Developer"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="txtCompany" class="form-label">Work or Company Name with Location:</label>
                            <asp:TextBox ID="txtCompany" runat="server" CssClass="form-control" placeholder="e.g. Bhagalpur"></asp:TextBox>
                        </div>
                        <div class="text-center">
                            <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary me-2" OnClick="btnUpdate_Click" Text="Update" />
                            <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger me-2" OnClick="btnDelete_Click" Text="Remove" />
                            <asp:Button ID="btnBack" runat="server" CssClass="btn btn-secondary" OnClick="btnBack_Click" Text="Back" />
                        </div>
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
