document.addEventListener("DOMContentLoaded", function () {
    const viewer = document.getElementById('pdf-viewer');
    const lightbox = document.getElementById('lightbox');
    const closeBtn = document.getElementsByClassName('close')[0];
    const openPdfLinks = document.querySelectorAll('.open-pdf, #openPdfLink');

    function loadPdf(url) {
        if (!url) {
            console.error('No PDF URL provided.');
            return;
        }

        pdfjsLib.getDocument(url).promise.then(function (pdf) {
            const numPages = pdf.numPages;
            viewer.innerHTML = ''; // Clear any previous content

            for (let pageNum = 1; pageNum <= numPages; pageNum++) {
                pdf.getPage(pageNum).then(function (page) {
                    const scale = 1.5;
                    const viewport = page.getViewport({ scale: scale });

                    // Prepare canvas using PDF page dimensions
                    const canvas = document.createElement('canvas');
                    canvas.className = 'pdf-canvas';
                    const context = canvas.getContext('2d');
                    canvas.height = viewport.height;
                    canvas.width = viewport.width;

                    // Append canvas to viewer
                    viewer.appendChild(canvas);

                    // Render PDF page into canvas context
                    const renderContext = {
                        canvasContext: context,
                        viewport: viewport
                    };
                    page.render(renderContext);
                });
            }
        });
    }

    openPdfLinks.forEach(function (link) {
        link.addEventListener('click', function (e) {
            e.preventDefault();
            const url = link.getAttribute('data-url') || viewer.getAttribute('data-url');
            if (url) {
                lightbox.style.display = "block";
                loadPdf(url);
            } else {
                console.error('No PDF URL provided.');
            }
        });
    });

    closeBtn.onclick = function () {
        lightbox.style.display = "none";
    };

    window.onclick = function (event) {
        if (event.target == lightbox) {
            lightbox.style.display = "none";
        }
    };

    // Auto-load PDF if URL is provided via data attribute on viewer
    const initialUrl = viewer.getAttribute('data-url');
    if (initialUrl) {
        loadPdf(initialUrl);
    }
});
