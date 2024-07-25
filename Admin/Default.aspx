<%@ Page Title="Dashboard" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2 class="my-h2">Welcome to UDCA TMBU Website Management Portal's Dashboard</h2>
    <div class="cen">
        <div class="data">
            <p>Account Menu Options:</p>
            <ul>
                <li><a href="ChangePassword.aspx">Change Password</a></li>
                <li><a href="RegisterOtherUser.aspx">Register Other Users</a></li>
                <li><a href="RemoveOtherUser.aspx">Remove Other Users</a></li>
            </ul>
            <p>Manage Menu Options:</p>
            <ul>
                <li><a href="ManageHomeButton.aspx">Home Button</a></li>
                <li><a href="ManageHomeLinks.aspx">Home Links</a></li>
                <li><a href="ManageVideoLinks.aspx">Video Links</a></li>
                <li><a href="ManageSliderImage.aspx">Slider Image</a></li>
                <li><a href="ManageNotice.aspx">Notice</a></li>
                <li><a href="ManageNews.aspx">News</a></li>
                <li><a href="ManageTender.aspx">Tender</a></li>
                <li><a href="ManageFaculty.aspx">Faculty & Guest Faculty</a></li>
                <li><a href="ManageStaff.aspx">Office & Supporting Staff</a></li>
                <li><a href="ManageAffReg.aspx">Affiliations & Regulations</a></li>
            </ul>
        </div>
        <div class="data">
            <p>Add Menu Options:</p>
            <ul>
                <li><a href="AddVideoLinks.aspx">Video Links</a></li>
                <li><a href="AddHomeLinks.aspx">Home Links</a></li>
                <li><a href="AddHomeButton.aspx">Home Buttons</a></li>
                <li><a href="AddFaculty.aspx">Faculty & Guest Faculty</a></li>
                <li><a href="AddStaff.aspx">Office & Supporting Staff</a></li>
            </ul>
            <p>Upload Menu Options:</p>
            <ul>
                <li><a href="UploadNotice.aspx">Notice PDF</a></li>
                <li><a href="UploadNews.aspx">News PDF</a></li>
                <li><a href="UploadTender.aspx">Tender PDF</a></li>
                <li><a href="UploadFiles.aspx">Documents Files</a></li>
                <li><a href="UploadSliderImage.aspx">Slider Image</a></li>
                <li><a href="UploadGalleryImage.aspx">Gallery Image</a></li>
                <li><a href="UploadNewspaper.aspx">Newspaper Image</a></li>
                <li><a href="UploadAffReg.aspx">Affiliations & Regulations PDF</a></li>
            </ul>
        </div>
        <div class="data">
            <p>Update Menu Options:</p>
            <ul>
                <li><a href="UpdateFeeStructure.aspx">Fee Structure</a></li>
                <li><a href="UpdateImportantDates.aspx">Important Dates</a></li>
                <li><a href="UpdateCoursePDF.aspx">Course Related PDF</a></li>
                <li><a href="UpdateAdministration.aspx">Administration Details</a></li>
                <li><a href="UpdateProfilePDF.aspx">Administration Profile PDF</a></li>
            </ul>
            <p>Delete Menu Options:</p>
            <ul>
                <li><a href="DeleteGalleryImage.aspx">Gallery Image</a></li>
                <li><a href="DeleteNewspaper.aspx">Newspaper Image</a></li>
                <li><a href="DeleteFiles.aspx">Documents Files</a></li>
                <li><a href="DeleteAlumni.aspx">Registered Alumni</a></li>
            </ul>
        </div>
    </div>
</asp:Content>
