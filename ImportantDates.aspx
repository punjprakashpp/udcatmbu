<%@ Page Title="Important Dates" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="ImportantDates.aspx.cs" Inherits="Acedemic_ImpDates" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="Content" runat="Server">
    <section class="py-4 bg-light">
        <div style="max-width:840px" class="container bg-white rounded shadow-sm p-4">
            <!-- Page Title -->
            <h1 class="text-primary text-center mb-4">Important Dates Regarding Admissions</h1>

            <!-- Table -->
            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th>Serial</th>
                            <th>Title</th>
                            <th>Date/Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>01.</td>
                            <td>Online Application Start Date</td>
                            <td><asp:Label ID="lblAppStartDate" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>02.</td>
                            <td>Online Application End Date</td>
                            <td><asp:Label ID="lblAppEndDate" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>03.</td>
                            <td>Fee for TMBU Candidate</td>
                            <td>₹<asp:Label ID="lblTMBUCandFee" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>04.</td>
                            <td>Fee for Other Candidate</td>
                            <td>₹<asp:Label ID="lblOthCandFee" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>05.</td>
                            <td>Publication of Merit List-I Date</td>
                            <td><asp:Label ID="lblMeritIDate" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>06.</td>
                            <td>Merit List-I Admission Start Date</td>
                            <td><asp:Label ID="lblAdmIStartDate" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>07.</td>
                            <td>Merit List-I Admission End Date</td>
                            <td><asp:Label ID="lblAdmIEndDate" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>08.</td>
                            <td>Publication of Merit List-II Date</td>
                            <td><asp:Label ID="lblMeritIIDate" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>09.</td>
                            <td>Merit List-II Admission Start Date</td>
                            <td><asp:Label ID="lblAdmIIStartDate" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>10.</td>
                            <td>Merit List-II Admission End Date</td>
                            <td><asp:Label ID="lblAdmIIEndDate" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>11.</td>
                            <td>Class Commencement/Start Date</td>
                            <td><asp:Label ID="lblClassStartDate" runat="server"></asp:Label></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Note -->
            <div class="mt-4">
                <p class="text-muted">
                    <strong>Note:</strong> For any queries, please <a href="ContactUs.aspx" class="text-decoration-none">contact</a> the admission officer-in-charge or <a href="mailto:udcatmbu.bgp@gmail.com" class="text-decoration-none">mail us</a>.
                </p>
            </div>
        </div>
    </section>
</asp:Content>
