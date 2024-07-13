<%@ Page MasterPageFile="Root.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Admission Entrance Test Syllabus</title>
    <style>
        #body {
            font-family: 'Arial', sans-serif;
            font-size: 16px;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .cont {
            max-width: 800px;
            padding: 30px;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
        }
        .cont:hover {
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
        }
        .cont h2 {
            color: #369;
            text-decoration: underline;
            text-align: center;
            transition: color 0.3s ease;
        }
        .cont h2:hover {
            color: #266b94;
        }
        .effect {
            color: #444;
            line-height: 1.6;
            margin-bottom: 20px;
            transition: color 0.3s ease;
        }
        .effect:hover {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .note {
            color: red;
            font-style: italic;
        }
        .effect {
            transition: transform 0.3s ease;
        }
        .effect:hover {
            transform: scale(1.05);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="body">
    <div class="cont">
        <h1 style="text-align: center; padding: 20px 0; background-color: #369; color: white; font-size: 1.8em; font-weight: bold; text-align: center; text-transform: uppercase; margin-bottom: 20px; border-top-left-radius: 10px; border-top-right-radius: 10px;">Admission Entrance Test Syllabus</h1>
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
