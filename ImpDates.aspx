<%@ Page Title="" Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="ImpDates.aspx.cs" Inherits="Acedemic_ImpDates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Important Dates</title>
    <style>
        #body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        #pageck {
            margin: 20px auto;
            max-width: 600px;
            text-align: left;
            border-radius: 10px;
            background: linear-gradient(135deg, #ffffff, #f0f0f0);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), 0 1px 3px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        #pageck:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2), 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        #prospectus {
            padding: 20px 0;
            background-color: #369;
            color: white;
            font-size: 1.8em;
            font-weight: bold;
            text-align: center;
            text-transform: uppercase;
            margin-bottom: 20px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
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

        p {
            margin-top: 20px;
        }

        a {
            color: #369;
            text-decoration: none;
            transition: color 0.3s;
        }

        a:hover {
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="body">
    <div id="pageck">
        <div id="prospectus">
            <p>Important Dates</p>
        </div>
        <table>
            <tr>
                <th>Serial</th>
                <th>Title</th>
                <th>Date</th>
            </tr>
            <tr>
                <td>01.</td>
                <td>Online Application Start Date:</td>
                <td><asp:Label ID="lblAppStartDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>02.</td>
                <td>Online Application End Date:</td>
                <td><asp:Label ID="lblAppEndDate" runat="server"></asp:Label></td>
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
                <td><asp:Label ID="lblMeritIDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>06.</td>
                <td>Merit List-I Admission Start Date:</td>
                <td><asp:Label ID="lblAdmIStartDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>07.</td>
                <td>Merit List-I Admission End Date:</td>
                <td><asp:Label ID="lblAdmIEndDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>08.</td>
                <td>Publication of Merit List-II Date:</td>
                <td><asp:Label ID="lblMeritIIDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>09.</td>
                <td>Merit List-II Admission Start Date:</td>
                <td><asp:Label ID="lblAdmIIStartDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>10.</td>
                <td>Merit List-II Admission End Date:</td>
                <td><asp:Label ID="lblAdmIIEndDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>11.</td>
                <td>Class Commencement/Start Date:</td>
                <td><asp:Label ID="lblClassStartDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="3"><b>Note: </b>For further any queries, please <a href="Contact.aspx">contact</a> the admission officer-in-charge or <a href="mailto:udcatmbu.bgp@gmail.com">mail us</a>.</td>
            </tr>
        </table>
    </div>
</div>
</asp:Content>

