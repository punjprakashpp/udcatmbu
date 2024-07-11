<%@ Page Title="Dashboard" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style>
        .data {
            display: inline-block;
            vertical-align: top;
            text-align: left;
        }

            .data p {
                font-size: 20px;
                font-weight: 700;
            }

            .data a {
                font-size: 18px;
                text-decoration: none;
            }

                .data a:hover {
                    color: #007BFF;
                    text-decoration: underline;
                }
    </style>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <center>
    <h2><u><b>Welcome</b> to UDCA TMBU Website Management Portal's <b>Dashboard</b></u></h2>
    <div class="data">
        <p>Account Menu Options:</p>
        <ul>
            <li><a href="ChangePassword.aspx">Change Password</a></li>
            <li><a href="RegisterOtherUser.aspx">Register Other Users</a></li>
            <li><a href="RemoveOtherUser.aspx">Remove Other Users</a></li>
        </ul>
        <p>Manage Menu Options:</p>
        <ul>
            <li><a href="ManageNotice.aspx">Manage Notice</a></li>
            <li><a href="ManageNews.aspx">Manage News</a></li>
            <li><a href="ManageTender.aspx">Manage Tender</a></li>
            <li><a href="DeleteFiles.aspx">Delete Documents Files</a></li>
            <li><a href="DeleteAlumni.aspx">Delete Registered Alumni</a></li>
            <li><a href="ManageFaculty.aspx">Manage Faculty Member</a></li>
            <li><a href="ManageGuestFaculty.aspx">Manage Guest Faculty</a></li>
            <li><a href="ManageOfficeStaff.aspx">Manage Office Staff</a></li>
            <li><a href="ManageSupportingStaff.aspx">Manage Supporting Staff</a></li>
            <li><a href="ManageAffReg.aspx">Manage Affiliations & Regulations</a></li>
        </ul>
    </div>
    <div class="data">
        <p>Add Menu Options:</p>
        <ul>
            <li><a href="AddVideoLinks.aspx">Add Video Links</a></li>
            <li><a href="AddHomeLinks.aspx">Add Home Links</a></li>
            <li><a href="AddHomeButton.aspx">Add Home Buttons</a></li>
            <li><a href="AddFaculty.aspx">Add Faculty Member</a></li>
            <li><a href="AddGuestFaculty.aspx">Add Guest Faculty</a></li>
            <li><a href="AddOfficeStaff.aspx">Add Office Staff</a></li>
            <li><a href="AddSupportingStaff.aspx">Add Supporting Staff</a></li>
        </ul>
        <p>View Menu Options:</p>
        <ul>            
            <li><a href="ViewFeeStructure.aspx">View Fee Structure</a></li>
            <li><a href="ViewImportantDates.aspx">View Important Dates</a></li>
            <li><a href="ViewFaculty.aspx">View Faculty Members</a></li>
            <li><a href="ViewGuestFaculty.aspx">View Guest Faculty</a></li>
            <li><a href="ViewOfficeStaff.aspx">View Office Staff</a></li>
            <li><a href="ViewSupportingStaff.aspx">View Supporting Staff</a></li>
            <li><a href="ViewAlumni.aspx">View Registered Alumni</a></li>
        </ul>
    </div>
    <div class="data">
        <p>Update Menu Options:</p>
        <ul>
            <li><a href="UpdateFeeStructure.aspx">Update Fee Structure</a></li>
            <li><a href="UpdateImportantDates.aspx">Update Important Dates</a></li>
            <li><a href="UpdateCoursePDF.aspx">Update Course Related PDF</a></li>
            <li><a href="UpdateAdministration.aspx">Update Administration Details</a></li>
            <li><a href="UpdateProfilePDF.aspx">Update Administration Profile PDF</a></li>
        </ul>
        <p>Upload Menu Options:</p>
        <ul>
            <li><a href="UploadNotice.aspx">Upload Notice PDF</a></li>
            <li><a href="UploadNews.aspx">Upload News PDF</a></li>
            <li><a href="UploadTender.aspx">Upload Tender PDF</a></li>
            <li><a href="UploadFiles.aspx">Upload Documents Files</a></li>
            <li><a href="AddSliderImage.aspx">Upload Slider Image</a></li>
            <li><a href="UploadGalleryImage.aspx">Upload Gallery Image</a></li>
            <li><a href="UploadNewspaper.aspx">Upload Newspaper Image</a></li>
            <li><a href="UploadAffReg.aspx">Upload Affiliations & Regulations PDF</a></li>
        </ul>
    </div>
</center>
</asp:Content>
