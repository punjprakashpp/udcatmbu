<%@ Page Title="" Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="EligiblityCriteria.aspx.cs" Inherits="Acedemic_Eligiblity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Admission Eligibility Criteria</title>
    <style>
        .content {
            line-height: 1.6;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center; /* Horizontally center */
            align-items: center; /* Vertically center */
        }

        #pageck {
            padding: 20px;
            max-width: 600px;
            width: 100%;
        }

        #prospectus {
            margin-bottom: 30px;
        }

            #prospectus p {
                font-weight: bold;
                text-decoration: underline;
                color: #369; /* Change color of "Eligibility for Admission" to #369 */
            }

        #syllabus p {
            margin: 5px 0;
        }

        .related-links {
            margin-top: 30px;
            text-align: center;
        }

            .related-links a {
                display: inline-block;
                margin: 10px;
                padding: 10px 20px;
                text-decoration: none;
                color: #fff;
                background-color: #369;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

                .related-links a:hover {
                    background-color: #266b94;
                }

        .effect {
            transition: transform 0.3s ease;
        }

            .effect:hover {
                transform: scale(1.05);
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content">
        <div id="pageck">
            <div id="prospectus">
                <h1 style="text-align: center; padding: 20px 0; background-color: #369; color: white; font-size: 1.8em; font-weight: bold; text-align: center; text-transform: uppercase; margin-bottom: 20px; border-top-left-radius: 10px; border-top-right-radius: 10px;">Eligibility for Admission:</h1>
            </div>
            <ul>
                <li>It is also brought to your notice that the above change in the duration of MCA program from 03 years to 02 Years has also been incorporated in the AICTE APH 2020-21 and the eligibility qualification is as below:
                </li>
                <li>&nbsp;</li>
                <li>
                    <p>"Passed BCA/ Bachelor Degree in Computer Science Engineering or equivalent Degree. OR passed B.Sc./ B.Com./ B.A. with Mathematics at 10+2 Level or at Graduation Level (with additional bridge Courses as per the norms of the concerned University). Obtained at least 50% marks (45% marks in case of candidates belonging to reserved category) in the qualifying Examination”</p>
                </li>
            </ul>
            <br />
            <hr>
            <div class="related-links effect">
                <p><strong>Related Links:</strong></p>
                <a href="FeeStructure.aspx" class="effect">Fee Structure</a>
                <a href="CourseStructure.aspx" class="effect">Course Structure</a>
                <a href="Calender.aspx" target="_blank" class="effect">Academic Calendar</a>
            </div>
        </div>
    </div>
</asp:Content>

