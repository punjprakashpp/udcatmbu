<%@ Page MasterPageFile="Root.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>Student Discipline and Library Rules</title>
<style>
        #content {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        #content .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            transition: background-color 0.3s ease;
        }
        #content .container:hover {
            background-color: #f9f9f9;
        }
        #content h1 {
            text-align: center;
            color: #fff;
            font-size: 36px;
            font-weight: bold;
            padding: 20px;
            background-image: linear-gradient(to right, #4A90E2, #36D1DC);
            border-radius: 10px 10px 0 0;
            margin-top: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        #content .points {
            margin-left: 20px;
            color: #666;
        }
        #content .point {
            margin-bottom: 10px;
            transition: background-color 0.3s ease;
            cursor: pointer;
            padding: 8px;
            border-radius: 5px;
        }
        #content .point:hover {
            background-color: #f0f0f0;
        }

        #content .container ul li {
            margin-bottom: 5px;
            list-style:circle;
        }
        #content .container ol li {
            margin-bottom: 5px;
            
        }
        #content h2 {
            color: #27ae60; /* Green color */
            text-align:center;
        }

/* Add some hover effect to list items */
        #content li:hover {
            background-color: #f0f0f0;
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="content">
    <div class="container">
        <h1>Student Discipline Rules</h1><br />
        <p>Students enrolled in the University must recognize their responsibilities towards the faculty, office staff, and fellow students. Failure to maintain appropriate standards of conduct will attract disciplinary action.</p><br />
        <p>The University believes that duty, decorum, and discipline are the hallmarks of a good student. The following acts would be deemed to be acts of indiscipline:</p><br />
        <ul style="line-height: 1.6; margin-left:10px; margin-bottom: 10px; padding-left: 20px;">
            <li>Any overt or covert act leading to ragging and eve-teasing.</li>
            <li>Disruption of classroom activities or disturbing the studies of other students.</li>
            <li>Marring the operations of the University or its educational activities.</li>
            <li>Harming the health or safety of staff or students.</li>
            <li>Damage to property or possession of any intoxicants or illicit drugs or weapons on the University campus.</li>
            <li>Misconduct during examinations.</li>
            <li>Production of false information or documents for admission purposes.</li>
            <li>Failure to return loaned materials or settle debts with the University.</li>
        </ul>
        <h2>Prohibition of Ragging</h2><br />
        <p>Ragging in any form is strictly prohibited. If any incident of ragging comes to notice, the authority would expel the student from the University.</p><br />
        <h2>Specific Rules for Student Discipline</h2><br />
        <ol style="line-height: 1.6; margin-left:10px; margin-bottom: 10px; padding-left: 20px;">
            <li>Students are expected to use only courteous and polite language and behave with decorum with others including the faculty members and the staff.</li>
            <li>Students shall avoid using any insulting, inciting, threatening and explicit language when talking with fellow students and should abstain themselves from violence.</li>
            <li>Students shall not talk or act in any manner that would bring disrepute to the University.</li>
            <li>The students shall be regular and punctual in attending classes and all activities connected with the University. Attendance of minimum 75% compulsory for appearing in the examinations.</li>
            <!-- Add more specific rules here -->
        </ol>
        <h2>Attendance Rules</h2><br />
        <ol style="line-height: 1.6; margin-left:10px; margin-bottom: 10px; padding-left: 20px;">
            <li>Students should attend all classes regularly and punctually.</li>
            <li>Students must be punctual to each lecture hour. Students coming late to the class by more than five minutes will not be given attendance for that period.</li>
            <li>Although the University prescribes a minimum of 75% of attendance, the University insists on regular attendance in all classes. Students are eligible for scholarships only when they earn more than 90% of attendance.</li>
            <li>A student with less than 75% of attendance will not be eligible to write the Semester Examinations of the University.</li>
            <li>Students are not permitted to absent themselves without prior permission.</li>
            <li>An application for leave must be submitted in the prescribed form well in advance or at least a day before the leave is required.</li>
            <li>When absence without prior permission is unavoidable, the leave application must be submitted on the day of return to the University after the leave period.</li>
            <li>Absence without leave for even a part of the day will be counted as absence for one day.</li>
            <li>Students without Identity Card & proper Uniform will be marked absent.</li>
            <li>If a student absents himself/herself for three consecutive days without leave, his/her name will be removed from the rolls.</li>
            <li>Removal of the names from the rolls shall entail forfeiture of attendance till the date of re-admission.</li>
            <li>In case of any violation of rules and regulations by the student, action initiated against the student may include a warning or a reprimand, awarding a fail mark for an assignment or course, suspension or expulsion from a particular class or from the University, withholding of official documents, withdrawal of campus privileges, and any other action which the University authorities deem appropriate at that time.</li>
        </ol>
        <h2 align="center">Library Rules</h2><br />
        <ol style="line-height: 1.6; margin-left:10px; margin-bottom: 10px; padding-left: 20px;">
            <li>The Library is open to all the Students, Faculty, and Staff of the University.</li>
            <li>Readers are not allowed to enter the library with their personal belongings.</li>
            <li>Readers are prohibited from engaging in any activity which may disturb or distract the attention of other readers and will result in severe disciplinary action.</li>
            <li>No reader shall write upon, damage or make marks on any library book. Each student of the University will be issued two tickets. A book will be lent to a reader only in exchange of one of his/her tickets which will be returned back to the reader when he/she returns the book.</li>
            <li>Date label and book pockets shall not be tampered with. Serious notice will be taken on any violation of this rule.</li>
            <li>Library tickets are not transferable. A reader who misses a ticket shall follow the stipulated process including remittance of Rs.100 as a fine to get another Ticket. In case he/she happens to get the ticket at a later date, the reader should return the same immediately.</li>
            <li>A reader who fails to return a book on the due date will be charged a sum of Rs. 10 per day as fine till he/she returns the book. Such a reader will not be allowed to use the library till the book is returned and fine paid.</li>
            <li>At the end of each semester before receiving the Admit card, the student should return all the books to the library. Without a clearance certificate (NO DUE) to this effect from the Librarian, the University will not permit a student to write the End Semester Examination.</li>
            <li>The Provisional / Diploma and Certificate shall be issued to the students only after they return all the books and remit dues outstanding against them.</li>
            <li>A book may be renewed for a further period of a fortnight provided: (a) No other reader has applied for the book in the meantime and (b) not more than two consecutive renewals may be made for the same book.</li>
            <li>In the case of books for which there is an exceptional demand, the period of loan may be reduced to fifteen days.</li>
            <li>The Librarian in exigencies may recall any book at any time even if the normal period of loan has not expired and readers are not allowed to sub-lend the books of the Library.</li>
            <li>Dictionaries and books which might be difficult to replace and such other books declared as Reference Books shall not be issued.</li>
            <li>Readers shall be responsible for any damage done to the books or other property belonging to the Library of the University. If the replacement of the books or other properties is not possible, four times the value of the book/property may be collected from the student concerned.</li>
        </ol>
    </div>
</div>
</asp:Content>

