<%@ Page Title="Dashboard" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style>
        .my-h2 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2 class="my-h2">Welcome to UDCA TMBU Website Management's Dashboard</h2>
    <div class="cen">
        <div class="data">
            <p>Account Menu Options:</p>
            <ul>
                <li><a href="ChangePassword.aspx">Change Login Password</a></li>
                <li><a href="RegisterOtherUser.aspx">Register Other Users</a></li>
                <li><a href="RemoveOtherUser.aspx">Remove Other Users</a></li>
            </ul>
            <p>Manage Menu Options:</p>
            <ul>
                <li><a href="ManageHomeButton.aspx">Manage Home Button</a></li>
                <li><a href="ManageHomeLinks.aspx">Manage Home Links</a></li>
                <li><a href="ManageVideoLinks.aspx">Manage Video Links</a></li>
                <li><a href="ManageSliderImage.aspx">Manage Slider Image</a></li>
                <li><a href="ManageNotice.aspx">Manage Notice</a></li>
                <li><a href="ManageNews.aspx">Manage News</a></li>
                <li><a href="ManageTender.aspx">Manage Tender</a></li>
                <li><a href="ManageFaculty.aspx">Faculty & Guest Faculty</a></li>
                <li><a href="ManageStaff.aspx">Office & Supporting Staff</a></li>
                <li><a href="ManageAffReg.aspx">Affiliations & Regulations</a></li>
            </ul>
        </div>
        <div class="data">
            <p>Add Menu Options:</p>
            <ul>
                <li><a href="AddVideoLinks.aspx">Add Video Links</a></li>
                <li><a href="AddHomeLinks.aspx">Add Home Links</a></li>
                <li><a href="AddHomeButton.aspx">Add Home Buttons</a></li>
                <li><a href="AddFaculty.aspx">Add Faculty & Guest Faculty</a></li>
                <li><a href="AddStaff.aspx">Add Office & Supporting Staff</a></li>
            </ul>
            <p>Upload Menu Options:</p>
            <ul>
                <li><a href="UploadNotice.aspx">Upload Notice PDF</a></li>
                <li><a href="UploadNews.aspx">Upload News PDF</a></li>
                <li><a href="UploadTender.aspx">Upload Tender PDF</a></li>
                <li><a href="UploadSliderImage.aspx">Upload Slider Image</a></li>
                <li><a href="UploadGalleryImage.aspx">Upload Gallery Image</a></li>
                <li><a href="UploadNewspaper.aspx">Upload Newspaper Image</a></li>
                <li><a href="UploadFiles.aspx">Upload Downloadable Files</a></li>
                <li><a href="UploadAffReg.aspx">Affiliations & Regulations PDF</a></li>
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
            <p>Delete Menu Options:</p>
            <ul>
                <li><a href="DeleteGalleryImage.aspx">Delete Gallery Image</a></li>
                <li><a href="DeleteNewspaper.aspx">Delete Newspaper Image</a></li>
                <li><a href="DeleteAlumni.aspx">Delete Registered Alumni</a></li>
                <li><a href="DeleteFiles.aspx">Delete Downloadable Files</a></li>
            </ul>
        </div>
    </div>
</asp:Content>
