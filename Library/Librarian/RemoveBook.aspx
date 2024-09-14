<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="RemoveBook.aspx.cs" Inherits="Librarian_RemoveStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1 {
            width: 739px;
        }
        .style2 {
            width: 202px;
        }
        .style3 {
            text-align: right;
            color: Green;
            width: 157px;
        }
        .style4 {
            width: 561px;
        }
        .style5 {
            text-align: right;
            color: Green;
            width: 249px;
        }
        .lbl {
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        function confirmDelete() {
            return confirm("Are you sure you want to delete this Book?");
        }
        function confirmSessionDelete() {
            return confirm("Are you sure you want to delete All Books?");
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="tbl">
        <tr>
            <td class="tblhead">
                REMOVE BOOK
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="lbl">
                            Use with Caution ! If you want to remove all Books :
                            <asp:Button ID="btnRemSem" runat="server" CssClass="btn" OnClick="btnRemSem_Click" ValidationGroup="SessionValidation"
                                Text="Delete All Books" OnClientClick="return confirmSessionDelete();" />
                        </td>
                    </tr>
                    <tr>
                        <td><hr /></td>
                    </tr>
                    <tr>
                        <td>Search a Book to Remove via :-</td>
                    </tr>
                    <tr>
                        <td class="lbl">
                            <asp:RadioButton ID="rdBookNo" runat="server" Text="Book No :" GroupName="ViewOption" />
                            <asp:RadioButton ID="rdBookName" runat="server" Text="Book Name :" GroupName="ViewOption" />
                            <asp:RadioButton ID="rdAuthor" runat="server" Text="Author :" GroupName="ViewOption" />
                            <asp:RadioButton ID="rdPublication" runat="server" Text="Publisher :" GroupName="ViewOption" />
                            <asp:TextBox ID="txtsearch" runat="server" CssClass="txt"></asp:TextBox>
                            <asp:Button ID="btnsearch" runat="server" CssClass="btn" OnClick="btnsearch_Click"
                                Text="Search" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <table class="tbl">
                            <tr>
                                <td class="tblhead">
                                    <asp:Label ID="lbl" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow"
                                        BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                                        OnRowCommand="GridView1_RowCommand" Style="text-align: center" Width="748px">
                                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                        <Columns>
                                            <asp:BoundField DataField="BookNo" HeaderText="Book No" />
                                            <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                                            <asp:BoundField DataField="Author" HeaderText="Author" />
                                            <asp:BoundField DataField="Publication" HeaderText="Publisher" />
                                            <asp:TemplateField HeaderText="Remove">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkRem" runat="server" CommandName="Remove" CommandArgument='<%# Eval("bid") %>'
                                                        CssClass="lnk" Text="Remove" OnClientClick="return confirmDelete();" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="Tan" />
                                        <HeaderStyle BackColor="#FF6600" Font-Bold="True" />
                                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
