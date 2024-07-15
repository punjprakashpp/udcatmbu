document.addEventListener("DOMContentLoaded", function () {
    var viewer = document.getElementById('pdf-viewer');
    var url = viewer.getAttribute('data-url');  // Get URL from data attribute

    if (url) {
        // Asynchronously download PDF
        pdfjsLib.getDocument(url).promise.then(function (pdf) {
            var numPages = pdf.numPages;

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
});
