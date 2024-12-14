function openLightbox(title) {
    document.getElementById('galleryLightbox').style.display = 'block';
    loadGalleryImages(title);
}

function closeGalleryLightbox() {
    document.getElementById('galleryLightbox').style.display = 'none';
}

function displayImage(src) {
    document.getElementById('lightboxImage').src = src;
    document.getElementById('lightbox').style.display = 'block';
}

function closeLightbox() {
    document.getElementById('lightbox').style.display = 'none';
}

window.onclick = function (event) {
    const lightbox = document.getElementById('lightbox');
    const galleryLightbox = document.getElementById('galleryLightbox');
    if (event.target === lightbox) {
        lightbox.style.display = 'none';
    } else if (event.target === galleryLightbox) {
        galleryLightbox.style.display = 'none';
    }
};

function loadGalleryImages(title) {
    const xhr = new XMLHttpRequest();
    xhr.open("GET", "ImageGallery.aspx?Title=" + encodeURIComponent(title), true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            const galleryContainer = document.getElementById('galleryLightbox').getElementsByClassName('gallery')[0];
            galleryContainer.innerHTML = xhr.responseText;
        }
    };
    xhr.send();
}