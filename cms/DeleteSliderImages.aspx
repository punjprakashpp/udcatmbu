<%@ Page Title="Delete Slider Images" Language="C#" MasterPageFile="~/cms/cms.master" AutoEventWireup="true" CodeFile="DeleteSliderImages.aspx.cs" Inherits="cms_DeleteSliderImages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col col-md-6 m-auto">
                <h2 class="text-center">Delete Slider Images</h2>
                <div class="search-bar">
                    <table class="table table-responsive">
                        <tr>
                            <td>Search Slider Image: </td>
                            <td>
                                <asp:TextBox ID="txtSearch" CssClass="form-control" runat="server"></asp:TextBox></td>
                            <td>
                                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="form-control btn btn-secondary" /></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col col-md-6 m-auto">
                <asp:GridView ID="gvGallery" runat="server" AutoGenerateColumns="False" DataKeyNames="ImageID"
                    CssClass="table table-bordered table-responsive table-striped"
                    OnRowDeleting="gvGallery_RowDeleting" AllowPaging="True" PageSize="10"
                    OnPageIndexChanging="gvGallery_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="ImageID" HeaderText="ImageID" ReadOnly="True" Visible="False" />
                        <asp:BoundField DataField="Title" HeaderText="Title"
                            HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:ImageField DataImageUrlField="FilePath" HeaderText="Image" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"
                            ControlStyle-Height="100px" ControlStyle-Width="150px">
                            <ControlStyle Height="100px" Width="150px" CssClass="img-thumbnail" />
                        </asp:ImageField>
                        <asp:CommandField ShowDeleteButton="True" DeleteText="Delete" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"
                            HeaderText="Action" ButtonType="Button" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>