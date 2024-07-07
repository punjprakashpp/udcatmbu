<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Pages.master" AutoEventWireup="true" CodeFile="CourseSyllabus.aspx.cs" Inherits="pages_CourseSyllabus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Course Syllabus</title>
    <link rel="stylesheet" type="text/css" href="style/syllabus.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="cont">
        <div class="container">
            <h1 style="text-align: center; padding: 20px 0; background-color: #369; color: white; font-size: 1.8em; font-weight: bold; text-align: center; text-transform: uppercase; margin-bottom: 20px; border-top-left-radius: 10px; border-top-right-radius: 10px;">Course Syllabus</h1>
            <iframe id="pdf-viewer" src="../doc/Uploads/CourseSyllabus.pdf" type="application/pdf" style="height: 100vh; width:100%;"></iframe>
        </div>
    </div>
</asp:Content>

