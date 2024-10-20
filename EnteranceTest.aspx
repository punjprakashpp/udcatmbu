<%@ Page Title="Entrance Test" MasterPageFile="Website.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" Runat="Server">
<div class="cont">
    <div class="container">
        <h1>Syllabus of Entrance Test for Admission</h1>
        <p class="effect">* Selection procedure for the MCA course will go under three phases:</p>
        <h2 class="effect">PHASE I: Written Test</h2>
        <p class="effect">The written test examination paper will contain questions in the following subjects:</p>
        <h2 class="effect">PHASE II: Group Discussion</h2>
        <p class="effect">Group Discussion will be conducted to assess the communication skills, analytical ability, and leadership qualities of the candidates.</p>
        <table class="effect">
            <thead>
                <tr>
                    <th>Sl.No.</th>
                    <th>Subjects / Test</th>
                    <th>Marks</th>
                    <th>No. of questions<span class="note">*</span></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td></td>
					<td colspan="2" style="text-align:center;"><b>PHASE I : Part A</b></td>
                    <td></td>                
                </tr>
                <tr>
                    <td>1.</td>
                    <td>Mathematics<br /><b>Level:</b> 10+2</td>
                    <td>36 marks</td>
                    <td>40%</td>
                </tr>
                <tr>
                    <td>2.</td>
                    <td>Reasoning<br /><b>Level:</b> High level</td>
                    <td>18 marks</td>
                    <td>20%</td>
                </tr>
                <tr>
                    <td>3.</td>
                    <td>Computer Fundamental</td>
                    <td>18 marks</td>
                    <td>20%</td>
                </tr>
                <tr>
                    <td>4.</td>
                    <td>English</td>
                    <td>18 marks</td>
                    <td>20%</td>
                </tr>
                <tr>
                    <td></td>
					<td colspan="2" style="text-align:center;"><b>PHASE II : Part B</b></td>
                    <td></td>                    
                </tr>
                <tr>
                    <td>5.</td>
                    <td>Group Discussion</td>
                    <td>10 marks</td>
                    <td>10%</td>
                </tr>
                <tr>
                    <td></td>
                    <td>Total:</td>
                    <td>100 marks</td>
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
        <h2 class="effect">PHASE III: Interview</h2>
        <p class="effect">The interview will be conducted to evaluate the overall suitability of the candidates for the MCA course. It will focus on assessing the candidate's academic background, personal achievements, career goals, and aptitude for the program.</p>
    </div>
</div>
</asp:Content>