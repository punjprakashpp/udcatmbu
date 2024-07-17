document.addEventListener("DOMContentLoaded", function () {
    var viewer = document.getElementById('pdf-viewer');
    var lightbox = document.getElementById('lightbox');
    var closeBtn = document.getElementsByClassName('close')[0];
    var openPdfLink = document.getElementById('openPdfLink');
    var url = viewer.getAttribute('data-url');  // Get URL from data attribute

    openPdfLink.onclick = function (e) {
        e.preventDefault();
        lightbox.style.display = "block";

        if (url) {
            // Asynchronously download PDF
            pdfjsLib.getDocument(url).promise.then(function (pdf) {
                var numPages = pdf.numPages;
                viewer.innerHTML = '';  // Clear any previous content

                for (let pageNum = 1; pageNum <= numPages; pageNum++) {
                    // Fetch each page
                    pdf.getPage(pageNum).then(function (page) {
                        var scale = 1.5;
                        var viewport = page.getViewport({ scale: scale });

                        // Prepare canvas using PDF page dimensions
                        var canvas = document.createElement('canvas');
                        canvas.className = 'pdf-canvas';
                        var context = canvas.getContext('2d');
                        canvas.height = viewport.height;
                        canvas.width = viewport.width;

                        // Append canvas to viewer
                        viewer.appendChild(canvas);

                        // Render PDF page into canvas context
                        var renderContext = {
                            canvasContext: context,
                            viewport: viewport
                        };
                        page.render(renderContext);
                    });
                }
            });
        } else {
            console.error('No PDF URL provided.');
        }
    };

    closeBtn.onclick = function () {
        lightbox.style.display = "none";
    };

    window.onclick = function (event) {
        if (event.target == lightbox) {
            lightbox.style.display = "none";
        }
    };
});
