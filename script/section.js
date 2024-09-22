function setSectionHeight() {
    const sliderImg = document.querySelector('.image');
    const sliderSection = document.querySelector('.slider-container');
    const noticeSection = document.querySelector('.notice-section');

    if (!sliderImg || !sliderSection || !noticeSection) return; // Ensure elements exist

    const setHeights = () => {
        const sliderImgHeight = sliderImg.offsetHeight;

        if (sliderImgHeight > 0) {
            noticeSection.style.height = sliderSection.offsetHeight + 'px';
        }
        if (window.innerWidth <= 768) {
            noticeSection.style.width = sliderSection.offsetWidth + 'px';
        }
    };

    if (sliderImg.complete) {
        setHeights(); // Image is already loaded
    } else {
        sliderImg.addEventListener('load', setHeights); // Wait for the image to load
    }
}

function setMarqueeHeight() {
    const marquee = document.querySelector('#marq');
    const sliderSection = document.querySelector('.slider-section');
    if (marquee && sliderSection) {
        const calculatedHeight = sliderSection.offsetHeight - 70;
        marquee.style.height = calculatedHeight > 0 ? calculatedHeight + 'px' : 'auto'; // Fallback for height
    }
}

function setBoardHeight() {
    const board = document.querySelector('.board');
    if (board) {
        const newHeight = board.offsetHeight - 150;
        ['#marq1', '#marq2', '#marq3'].forEach(selector => {
            const element = document.querySelector(selector);
            if (element) {
                element.style.height = newHeight > 0 ? newHeight + 'px' : 'auto'; // Fallback for height
            }
        });
    }
}

function adjustHeights() {
    const boxes = document.querySelectorAll('.box');
    if (boxes.length > 0) {
        if (window.innerWidth > 768) {
            boxes.forEach(box => box.style.height = 'auto'); // Reset height before calculation

            let maxBoxHeight = Array.from(boxes).reduce((maxHeight, box) => {
                return Math.max(maxHeight, box.offsetHeight);
            }, 0);

            // Apply the maximum height to all boxes
            boxes.forEach(box => {
                box.style.height = maxBoxHeight + 'px';
            });
        } else {
            boxes.forEach(box => {
                box.style.height = 'auto';
            });
        }
    }
}

function initialize() {
    setSectionHeight();
    setMarqueeHeight();
    setBoardHeight();
    adjustHeights();
}

// Debounce Function for performance on resize
function debounce(func, delay) {
    let timeout;
    return function () {
        clearTimeout(timeout);
        timeout = setTimeout(() => {
            func();
        }, delay);
    };
}

// Initialize on load and resize with debounced handler
window.addEventListener('load', initialize);
window.addEventListener('resize', debounce(() => {
    initialize(); // Ensure heights are recalculated properly
}, 150));
