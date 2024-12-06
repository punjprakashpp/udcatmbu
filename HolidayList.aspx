<%@ Page Title="Holiday List" MasterPageFile="Site.master" AutoEventWireup="true" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <style>
        iframe {
            width: 100%;
            height: 800px; /* Default height for larger screens */
            border: none;
        }

        /* Responsive adjustments */
        @media (max-width: 1024px) {
            iframe {
                height: 600px;
            }
        }

        @media (max-width: 768px) {
            iframe {
                height: 400px;
            }
        }

        .dnld {
            color: lightseagreen;
            text-decoration: none;
        }

        .dnld:hover {
            text-decoration: underline;
        }
    </style>
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="Content" runat="Server">
    <section class="py-5 bg-light">
        <div class="container bg-white rounded shadow-sm py-5 px-4">
            <!-- Heading with download link -->
            <h1 class="text-center text-primary mb-4">
                TMBU Holiday List:
                <a class="dnld" href="docs/Uploads/HolidayList.pdf" download="HolidayList.pdf">Download PDF</a>
            </h1>

            <!-- PDF Viewer -->
            <iframe src="/pdfjs/web/viewer.html?file=/docs/Uploads/HolidayList.pdf" allowfullscreen webkitallowfullscreen></iframe>
        </div>
    </section>
</asp:Content>
