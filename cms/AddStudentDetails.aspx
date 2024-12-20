<%@ Page Title="" Language="C#" MasterPageFile="cms.master" AutoEventWireup="true" CodeFile="AddStudentDetails.aspx.cs" Inherits="AddStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="/Content/flatpickr.min.css">
    <script type="text/javascript" src="/Scripts/flatpickr.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-3.7.1.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Initialize Flatpickr on the TextBox
            const fp = flatpickr('.flatpickr-input', {
                enableTime: false,       // Disable time
                dateFormat: "d-m-Y",     // Date format
                allowInput: true,        // Allow manual input
                clickOpens: false,       // Calendar opens on click
                disableMobile: true,     // Force Flatpickr on mobile
                maxDate: "today"         // today is maximum date
            });

            // Open the calendar when clicking on the calendar icon
            document.getElementById('calendar-icon').addEventListener('click', function () {
                fp.open();
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container">
        <h2 class="text-center">Add New Student</h2>
        <div class="row">
            <div class="col col-3"></div>
            <div class="col col-6">
                <table class="table">
                    <tr>
                        <td>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="UploadStudentData.aspx">Click here to upload student data using an Excel file</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <table class="table">
                                <tr>
                                    <td>Session:<br />
                                        <br />
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlSession" runat="server" CssClass="input"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvSession" runat="server" ControlToValidate="ddlSession"
                                            ErrorMessage="Please select a session" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Roll No.:<br />
                                        <br />
                                        <br />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRollNo" runat="server" CssClass="input"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="revRollNo" runat="server" ControlToValidate="txtRollNo"
                                            ErrorMessage="Roll number must be numeric" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^\d+$"></asp:RegularExpressionValidator><br />
                                        <asp:RequiredFieldValidator ID="rfvRollNo" runat="server" ControlToValidate="txtRollNo"
                                            ErrorMessage="Roll number is required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Registration No.:<br />
                                        <br />
                                        <br />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRegNo" runat="server" CssClass="input"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="revRegNo" runat="server" ControlToValidate="txtRegNo"
                                            ErrorMessage="Registration No. must be numeric" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^\d+$"></asp:RegularExpressionValidator><br />
                                        <asp:RequiredFieldValidator ID="rfvRegNo" runat="server" ControlToValidate="txtRegNo"
                                            ErrorMessage="Registration No. is required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Registration Year:<br />
                                        <br />
                                        <br />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRegYear" runat="server" CssClass="input"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="revRegYear" runat="server" ControlToValidate="txtRegYear"
                                            ErrorMessage="Year must be a 4-digit number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^\d{4}$"></asp:RegularExpressionValidator><br />
                                        <asp:RequiredFieldValidator ID="rfvRegYear" runat="server" ControlToValidate="txtRegYear"
                                            ErrorMessage="Registration Year is required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>First Name:<br />
                                        <br />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="input"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName"
                                            ErrorMessage="First name is required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Middle Name:<br />
                                        <br />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtMidName" runat="server" CssClass="input"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Last Name:<br />
                                        <br />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtLastName" runat="server" CssClass="input"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName"
                                            ErrorMessage="Last name is required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Gender:</td>
                                    <td>
                                        <asp:RadioButton ID="rdoMale" runat="server" Text="Male" GroupName="Gender" CssClass="input" Checked="true" />
                                        <asp:RadioButton ID="rdoFemale" runat="server" Text="Female" GroupName="Gender" CssClass="input" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Date of Birth:</td>
                                    <td>
                                        <div class="input-group">
                                            <asp:TextBox ID="txtDOB" placeholder="e.g. 08-07-2000" runat="server"
                                                CssClass="form-control flatpickr-input"></asp:TextBox>
                                            <span class="input-group-text" id="calendar-icon">
                                                <i class="fa-solid fa-calendar"></i>
                                            </span>
                                        </div>
                                        <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ControlToValidate="txtDOB"
                                            ErrorMessage="Date of Birth is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnAddStudent" runat="server" CssClass="btn btn-primary" OnClick="btnAddStudent_Click"
                                            Text="Add Student" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="col col-3"></div>
        </div>
    </div>
</asp:Content>
