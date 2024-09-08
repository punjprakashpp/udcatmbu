function setSectionHeight() {
    const slider = document.querySelector('.slider');
    const sliderImg = document.querySelector('.slide-img');
    const sliderSection = document.querySelector('.slider-section');
    const noticeSection = document.querySelector('.notice-section');

    if (slider && sliderImg) {
        const setHeights = () => {
            // Ensure image height is calculated correctly
            const sliderImgHeight = sliderImg.offsetHeight;

            if (sliderImgHeight > 0) {
                // Set slider height based on the image height
                slider.style.height = sliderImgHeight + 'px';

                // Ensure the noticeSection is set after sliderSection height is calculated
                if (sliderSection && noticeSection) {
                    noticeSection.style.height = sliderSection.offsetHeight + 'px';
                }
            }
        };

        if (sliderImg.complete) {
            setHeights(); // Image is already loaded
        } else {
            sliderImg.addEventListener('load', setHeights); // Wait for the image to load
        }
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
            // Reset height to auto before calculating max height to avoid incorrect values
            boxes.forEach(box => box.style.height = 'auto');

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

// **Debounce Function to Manage Event Handler Execution:**
function debounce(func, delay) {
    let timeout;
    return function () {
        clearTimeout(timeout);
        timeout = setTimeout(() => {
            func();
        }, delay);
    };
}

// **Initialize and Add Event Listeners**
window.addEventListener('load', initialize);
window.addEventListener('resize', debounce(() => {
    initialize(); // Re-initialize to ensure heights are recalculated properly
}, 150));  // Debounce for better performance on window resize