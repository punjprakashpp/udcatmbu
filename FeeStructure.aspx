﻿<%@ Page Title="Fee Structure" Language="C#" MasterPageFile="Website.master" AutoEventWireup="true" CodeFile="FeeStructure.aspx.cs" Inherits="Acedemic_FeeStructure" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="style/site.css">
    <link href="Styles/jquery-ui.css" rel="stylesheet" />
    <script src="Script/jquery.js"></script>
    <script src="Script/jquery-ui.js"></script>
    <style>
        .cont .container {
            max-width: 960px;
        }
        /* General table styles */
        .table-container {
            width: 100%;
            margin: 0 auto;
            overflow-x: auto;
            /* Ensure the table is scrollable on small screens */
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        th,
        td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        /* Styles for smaller screens */
        @media screen and (max-width: 600px) {

            table,
            thead,
            tbody,
            th,
            td,
            tr {
                display: block;
            }

                thead tr {
                    position: absolute;
                    top: -9999px;
                    left: -9999px;
                }

            tr {
                margin: 0 0 1rem 0;
                border: 1px solid #ccc;
            }

            th {
                display: none;
                background-color: #ccc;
                /* Background color for header cells */
            }

            td {
                border: none;
                border-bottom: 1px solid #eee;
                position: relative;
                padding-left: 50%;
                white-space: nowrap;
            }

                td:before {
                    position: absolute;
                    top: 10px;
                    left: 10px;
                    width: 45%;
                    padding-right: 10px;
                    white-space: nowrap;
                    font-weight: bold;
                    content: attr(data-label);
                }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <div class="cont">
        <div class="container">
            <h1>Fee Structure for MCA Course</h1>
            <p>Below is the semester-wise breakdown of fees for the MCA course:</p>
            <p class="note" align="right" >All fees in ₹ Rupees</p>
            <div class="table-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Semester" HeaderText="Semester" />
                        <asp:BoundField DataField="Admission" HeaderText="Admission" />
                        <asp:BoundField DataField="Academic" HeaderText="Academic" />
                        <asp:BoundField DataField="Computer" HeaderText="Computer Lab" />
                        <asp:BoundField DataField="Miscellaneous" HeaderText="Miscellaneous" />
                        <asp:BoundField DataField="Examination" HeaderText="Examination" />
                        <asp:BoundField DataField="Total" HeaderText="Total Fee" />
                    </Columns>
                </asp:GridView>
            </div>
            <p>In addition to the above fees, there are additional charges:</p>
            <p>NRI candidates and those under the donor quota have specific fee structures detailed separately.</p>
            <p>For non-resident Indian (NRI) candidates, the fee is Rs. 1,50,000/- payable in four equal installments of Rs. 37,500/- each.</p>
            <p>For students admitted under the donor quota of the University, the fee is Rs. 1,20,000/- payable in four equal installments of Rs. 30,000/- per semester.</p>

        </div>
        <script>
            window.onload = function () {
                var table = document.getElementById('Content1_GridView1');
                for (var i = 0; i < table.rows.length; i++) {
                    var row = table.rows[i];
                    if (i === 0) continue;
                    for (var j = 0; j < row.cells.length; j++) {
                        var cell = row.cells[j];
                        var columnHeader = table.rows[0].cells[j].textContent;
                        cell.setAttribute('data-label', columnHeader);
                    }
                }
            };
        </script>
    </div>
</asp:Content>
