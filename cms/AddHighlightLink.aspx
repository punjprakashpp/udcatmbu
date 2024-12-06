<%@ Page Title="" Language="C#" MasterPageFile="~/cms/cms.master" AutoEventWireup="true" CodeFile="AddHighlightLink.aspx.cs" Inherits="cms_AddHighlightLink" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col col-md-5 m-auto">
                <h2 class="text-center">Add Link for Highlights</h2>
                <table class="table table-responsive">
                    <tr>
                        <td>Link Text: </td>
                        <td>
                            <asp:TextBox ID="txtLinkText" CssClass="form-control" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>if link is external :</td>
                        <td>
                            <label class="form-control">
                                <asp:CheckBox ID="chkboxExt" runat="server" AutoPostBack="True"
                                    OnCheckedChanged="chkboxExt_CheckedChanged" />Yes, Link is external.
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>Link Url: </td>
                        <td>
                            <asp:TextBox ID="txtLinkURL" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Choose a Local Page link: </td>
                        <td>
                            <asp:DropDownList ID="ddlLinkPicker" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLinkPicker_SelectedIndexChanged"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnManage" CssClass="form-control btn btn-secondary" runat="server" Text="Manage Link" OnClick="btnManage_Click" /></td>
                        <td>
                            <asp:Button ID="btnSubmit" CssClass="form-control btn btn-primary" runat="server" Text="Submit Link" OnClick="btnSubmit_Click" /></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

