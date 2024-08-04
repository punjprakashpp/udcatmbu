<%@ Page Title="Dashboard" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style>
        .cen {
            width: 90%;
            text-align: center;
            margin: 0 auto;
        }

            .cen .data {
                background: #fff;
                padding: 10px;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease;
                margin-bottom: 15px;
                text-align: left;
            }

            .cen ul {
                list-style: none;
                padding: 0 20px;
            }

            .cen li {
                margin-bottom: 10px;
            }

            .cen a {
                color: #007bff;
            }

                .cen a:hover {
                    text-decoration: underline;
                }

        @media (min-width: 768px) {
            .cen {
                width: 100%;
                display: flex;
                flex-wrap: wrap;
            }

                .cen .data {
                    width: 30%;
                    margin-left:20px;
                }
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2 class="title">Welcome to UDCA TMBU Website Management's Dashboard</h2>
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
                <li><a href="ManageHomeButton.aspx">Manage Button</a></li>
                <li><a href="ManageVideoLinks.aspx">Manage Video Links</a></li>
                <li><a href="ManageHomeLinks.aspx">Manage Highlight Links</a></li>
                <li><a href="ManageNotice.aspx">Manage Notice PDF</a></li>
                <li><a href="ManageEvents.aspx">Manage Events PDF</a></li>
                <li><a href="ManageTender.aspx">Manage Tender PDF</a></li>
                <li><a href="ManageFaculty.aspx">Faculty & Guest Faculty</a></li>
                <li><a href="ManageStaff.aspx">Office & Supporting Staff</a></li>
                <li><a href="ManageAffReg.aspx">Affiliations & Regulations PDF</a></li>
            </ul>
        </div>
        <div class="data two">
            <p>Add Menu Options:</p>
            <ul>
                <li><a href="AddVideoLinks.aspx">Add Video Links</a></li>
                <li><a href="AddHomeLinks.aspx">Add Highlight Links</a></li>
                <li><a href="AddHomeButton.aspx">Add Buttons for home Page</a></li>
                <li><a href="AddFacultyMember.aspx">Add Faculty & Guest Faculty</a></li>
                <li><a href="AddOfficeStaff.aspx">Add Office & Supporting Staff</a></li>
            </ul>
            <p>Upload Menu Options:</p>
            <ul>
                <li><a href="UploadNotice.aspx">Upload Notice PDF</a></li>
                <li><a href="UploadEvents.aspx">Upload Events PDF</a></li>
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
                <li><a href="DeleteSliderImage.aspx">Delete Slider Image</a></li>
                <li><a href="DeleteGalleryImage.aspx">Delete Gallery Image</a></li>
                <li><a href="DeleteNewspaper.aspx">Delete Newspaper Image</a></li>
                <li><a href="DeleteAlumni.aspx">Delete Registered Alumni</a></li>
                <li><a href="DeleteFiles.aspx">Delete Downloadable Files</a></li>
            </ul>
        </div>
    </div>
</asp:Content>
