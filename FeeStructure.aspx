<%@ Page Title="Fee Structure" Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="FeeStructure.aspx.cs" Inherits="Acedemic_FeeStructure" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>MCA Course Fee Structure</title>
    <link rel="stylesheet" href="style/table.css">
    <link rel="stylesheet" href="style/tablefee.css">
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="cont">
            <h1 style="text-align: center; padding: 20px 0; background-color: #369; color: white; font-size: 1.8em; font-weight: bold; text-align: center; text-transform: uppercase; margin-bottom: 20px; border-top-left-radius: 10px; border-top-right-radius: 10px;">Fee Structure for MCA Course</h1>
            <p>Below is the semester-wise breakdown of fees for the MCA course:</p>
            <p style="text-align: right; color:Red;" >All fees in ₹ Rupees</p>
            <div class="table-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Semester" HeaderText="Semester" />
                        <asp:BoundField DataField="Admission" HeaderText="Admission Fee" />
                        <asp:BoundField DataField="Academic" HeaderText="Academic Fee" />
                        <asp:BoundField DataField="Computer" HeaderText="Computer Lab Fee" />
                        <asp:BoundField DataField="Miscellaneous" HeaderText="Miscellaneous Fee" />
                        <asp:BoundField DataField="Examination" HeaderText="Examination Fee" />
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
                var table = document.getElementById('ContentPlaceHolder1_GridView1');
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
