<%@ Page Title="" Language="C#" MasterPageFile="Website.master" AutoEventWireup="true" CodeFile="ImportantDates.aspx.cs" Inherits="Acedemic_ImpDates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Important Dates</title>
    <link rel="stylesheet" type="text/css" href="style/site.css">
    <style>
        .cont .container {
            max-width:600px;
        }
        th,
        td {
            padding: 15px 10px;
            text-align: left;
            transition: background-color 0.3s;
            border-right: 1px solid #ddd; /* Added vertical lines */
        }

        th:first-child,
        td:first-child {
            border-left: 1px solid #ddd; /* Added vertical line for the first column */
            text-align: center;
        }

        th {
            text-align: center;
            background-color: #cccccc;
            font-size: 1.2em;
            color: #369;
        }

        tr:hover td {
            background-color: #f9f9f9;
        }

        .cont p {
            margin-top: 20px;
        }

        .cont a {
            color: #369;
            text-decoration: none;
            transition: color 0.3s;
        }

        .cont a:hover {
            color: #ff7f0e;
        }

        tr:nth-child(odd) {
            background-color: #cccccc;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tr:hover {
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2), 0 2px 4px rgba(0, 0, 0, 0.2);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <div class="cont">
        <div class="container">
            <h1>Important Dates</h1>
            <table>
                <tr>
                    <th>Serial</th>
                    <th>Title</th>
                    <th>Date</th>
                </tr>
                <tr>
                    <td>01.</td>
                    <td>Online Application Start Date:</td>
                    <td>
                        <asp:Label ID="lblAppStartDate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>02.</td>
                    <td>Online Application End Date:</td>
                    <td>
                        <asp:Label ID="lblAppEndDate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>03.</td>
                    <td>Fee for TMBU Candidate:</td>
                    <td>₹<asp:Label ID="lblTMBUCandFee" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>04.</td>
                    <td>Fee for Other Candidate:</td>
                    <td>₹<asp:Label ID="lblOthCandFee" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>05.</td>
                    <td>Publication of Merit List-I Date:</td>
                    <td>
                        <asp:Label ID="lblMeritIDate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>06.</td>
                    <td>Merit List-I Admission Start Date:</td>
                    <td>
                        <asp:Label ID="lblAdmIStartDate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>07.</td>
                    <td>Merit List-I Admission End Date:</td>
                    <td>
                        <asp:Label ID="lblAdmIEndDate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>08.</td>
                    <td>Publication of Merit List-II Date:</td>
                    <td>
                        <asp:Label ID="lblMeritIIDate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>09.</td>
                    <td>Merit List-II Admission Start Date:</td>
                    <td>
                        <asp:Label ID="lblAdmIIStartDate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>10.</td>
                    <td>Merit List-II Admission End Date:</td>
                    <td>
                        <asp:Label ID="lblAdmIIEndDate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>11.</td>
                    <td>Class Commencement/Start Date:</td>
                    <td>
                        <asp:Label ID="lblClassStartDate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="3"><b>Note: </b>For further any queries, please <a href="Contact.aspx">contact</a> the admission officer-in-charge or <a href="mailto:udcatmbu.bgp@gmail.com">mail us</a>.</td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

