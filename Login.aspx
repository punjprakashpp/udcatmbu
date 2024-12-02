<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/Website.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* Center the form on the page */
        .bg {
            width: 480px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

            /* Title */
            .bg h2 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }

            /* Table styling */
            .bg table {
                width: 100%;
                border-collapse: collapse;
            }

            .bg td {
                padding: 10px;
            }

                .bg td:first-child {
                    text-align: right;
                    color: #666;
                }

                .bg td:last-child {
                    text-align: left;
                }

            /* Textbox styling */
            .bg input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 8px;
                margin: 5px 0;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            /* Button styling */
            .bg .logbtn {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                border: none;
                color: #fff;
                font-size: 16px;
                cursor: pointer;
                border-radius: 3px;
                text-align: center;
            }

                .bg .logbtn:hover {
                    background-color: #0056b3;
                }

            /* Error message styling */
            .bg .erlbl {
                display: block;
                margin-top: 10px;
                text-align: center;
                color: red;
            }

            /* Validator styling */
            .bg .val {
                display: block;
                margin-top: 5px;
                font-size: 12px;
                color: red;
            }

        @media (max-width: 768px) {
            .bg {
                width: 90%;
                margin: 20px;
                padding: 10px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="Content" runat="Server">
    <div class="bg">
        <h2><i class="fa fa-sign-in"></i> Administrator Login</h2>
        <table>
            <tr>
                <td>
                    Username:
                </td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUserName" CssClass="val" runat="server" ControlToValidate="txtUserName"
                        ErrorMessage="User Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Password:
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" CssClass="val" runat="server" ControlToValidate="txtPassword"
                        ErrorMessage="Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="logbtn" OnClick="btnLogin_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblMessage" runat="server" CssClass="erlbl" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
