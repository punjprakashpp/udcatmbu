<%@ Page Title="Fee Structure" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="FeeStructure.aspx.cs" Inherits="Acedemic_FeeStructure" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="Content" runat="Server">
    <div class="container py-5">
        <!-- Header Section -->
        <h1 class="text-center text-primary mb-4">Fee Structure for MCA Course</h1>
        <p class="text-center">Below is the semester-wise breakdown of fees for the MCA course:</p>
        <p class="text-end fw-bold">All fees in ₹ Rupees</p>

        <!-- Fee Structure Table -->
        <div class="table-responsive mb-4">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" class="table table-bordered table-striped">
                <Columns>
                    <asp:BoundField DataField="Semester" HeaderText="Semester" SortExpression="Semester" />
                    <asp:BoundField DataField="Admission" HeaderText="Admission" SortExpression="Admission" />
                    <asp:BoundField DataField="Academic" HeaderText="Academic" SortExpression="Academic" />
                    <asp:BoundField DataField="Computer" HeaderText="Computer Lab" SortExpression="Computer" />
                    <asp:BoundField DataField="Miscellaneous" HeaderText="Miscellaneous" SortExpression="Miscellaneous" />
                    <asp:BoundField DataField="Examination" HeaderText="Examination" SortExpression="Examination" />
                    <asp:BoundField DataField="Total" HeaderText="Total Fee" SortExpression="Total" />
                </Columns>
            </asp:GridView>
        </div>

        <!-- Additional Charges Section -->
        <p>In addition to the above fees, there are additional charges:</p>
        <ul>
            <li>NRI candidates and those under the donor quota have specific fee structures detailed separately.</li>
            <li>For non-resident Indian (NRI) candidates, the fee is ₹1,50,000/- payable in four equal installments of ₹37,500/- each.</li>
            <li>For students admitted under the donor quota of the University, the fee is ₹1,20,000/- payable in four equal installments of ₹30,000/- per semester.</li>
        </ul>
    </div>
</asp:Content>
