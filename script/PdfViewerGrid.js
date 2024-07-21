document.addEventListener("DOMContentLoaded", function () {
    const viewer = document.getElementById('pdf-viewer');
    const lightbox = document.getElementById('lightbox');
    const closeBtn = document.getElementsByClassName('close')[0];

    document.querySelectorAll('.open-pdf').forEach(function (link) {
        link.addEventListener('click', function (e) {
            e.preventDefault();
            const url = this.getAttribute('data-url');
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

    function loadPdf(url) {
        pdfjsLib.getDocument(url).promise.then(function (pdf) {
            const numPages = pdf.numPages;
            viewer.innerHTML = '';  // Clear any previous content

            for (let pageNum = 1; pageNum <= numPages; pageNum++) {
                // Fetch each page
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
});
