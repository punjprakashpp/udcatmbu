<%@ Page MasterPageFile="Root.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Admission Entrance Test Syllabus</title>
    <link rel="stylesheet" type="text/css" href="style/site.css">
    <style>
        .cont .container {
            max-width:720px;
        }
        table {
            margin-top: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="cont">
    <div class="container">
        <h1>Admission Entrance Test Syllabus</h1>
        <p class="effect">* Selection procedure for the MCA course will go under three phases:</p>
        <h2 class="effect">PHASE I: Written Test</h2>
        <p class="effect">The written test examination paper will contain questions in the following subjects:</p>
        <table class="effect">
            <thead>
                <tr>
                    <th>Sl.No.</th>
                    <th>Name of Test</th>
                    <th>Medium of Exam</th>
                    <th>No. of questions<span class="note">*</span></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1.</td>
                    <td>Mathematics<br /><b>Level:</b> 10+2</td>
                    <td>English</td>
                    <td>40%</td>
                    
                </tr>
                <tr>
                    <td>2.</td>
                    <td>Reasoning<br /><b>Level:</b> High level</td>
                    <td>English</td>
                    <td>20%</td>
                </tr>
                <tr>
                    <td>3.</td>
                    <td>Computer Fundamental</td>
                    <td>English</td>
                    <td>20%</td>
                </tr>
                <tr>
                    <td>4.</td>
                    <td>English</td>
                    <td>English</td>
                    <td>20%</td>
                </tr>
                <tr>
                    <td></td>
                    <td>Total:</td>
                    <td></td>
                    <td>100%</td>
                </tr>
                <tr>
                    <td></td>
                    <td>Examination Time:</td>
                    <td></td>
                    <td>Composite time of<br /> 2 hours</td>
                </tr>
            </tbody>
        </table>
        <p class="note effect">*questions in percentage out of total questions</p>
        <h2 class="effect">PHASE II: Group Discussion</h2>
        <p class="effect">Group Discussion will be conducted to assess the communication skills, analytical ability, and leadership qualities of the candidates.</p>
        <h2 class="effect">PHASE III: Interview</h2>
        <p class="effect">The interview will be conducted to evaluate the overall suitability of the candidates for the MCA course. It will focus on assessing the candidate's academic background, personal achievements, career goals, and aptitude for the program.</p>
    </div>
</div>
</asp:Content>
