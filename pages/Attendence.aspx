<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Pages.master" AutoEventWireup="true" CodeFile="Attendence.aspx.cs" Inherits="pages_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>Attendance Protocol</title>
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="content">
    <div class="container">
        <h1>Attendance Protocol</h1>
        <div class="points">
            <div class="point">1. Consistent and timely attendance is vital for student success.</div>
            <div class="point">2. Students are expected to be punctual for every class. Attendance will not be recorded for late arrivals exceeding five minutes.</div>
            <div class="point">3. While a minimum of 75% attendance is recommended, scholarships are exclusively awarded to those maintaining over 90% attendance.</div>
            <div class="point">4. Students falling below the 75% attendance threshold will be ineligible to participate in Semester Examinations.</div>
            <div class="point">5. Absences require prior authorization.</div>
            <div class="point">6. Leave requests must be submitted using the designated form well in advance or at least one day before the intended absence.</div>
            <div class="point">7. In unavoidable circumstances, leave applications must be submitted on the day of return to campus.</div>
            <div class="point">8. Any unauthorized absence, even for part of a day, will be considered a full day's absence.</div>
            <div class="point">9. Attendance will only be recorded for students with a valid Identity Card and in proper attire.</div>
            <div class="point">10. Continuous unexcused absence for three days will result in the removal of the student's name from the attendance roster.</div>
            <div class="point">11. Removal from the roster will entail the loss of attendance until the student is readmitted.</div>
            <div class="point">12. Violations of attendance regulations may result in warnings, academic penalties, suspension, expulsion, document withholding, loss of privileges, or other appropriate actions determined by University authorities.</div>
        </div>
    </div>
</div>
</asp:Content>

