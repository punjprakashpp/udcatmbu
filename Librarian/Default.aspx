﻿<%@ Page MasterPageFile="MasterPage.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td class="tblhead">Welcome to Automated Library of UDCA</td>
        </tr>
        <tr>
            <td bgcolor="White">&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/img/dept/AdminBuilding.jpg"/>
            </td>
        </tr>
    </table>
</asp:Content>
