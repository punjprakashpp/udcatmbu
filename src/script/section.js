function setSectionHeight() {
    const slider = document.querySelector('.slider');
    const sliderImg = document.querySelector('.slide-img');

    // Ensure the image is fully loaded before setting the height
    if (slider && sliderImg) {
        if (sliderImg.complete) {
            // Image is already loaded, set the height
            slider.style.height = sliderImg.offsetHeight + 'px';
        } else {
            // Wait for the image to load
            sliderImg.addEventListener('load', () => {
                slider.style.height = sliderImg.offsetHeight + 'px';
            });
        }
    }

    const sliderSection = document.querySelector('.slider-section');
    const noticeSection = document.querySelector('.notice-section');
    if (sliderSection && noticeSection) {
        noticeSection.style.height = sliderSection.offsetHeight + 'px';
    }
}

function setMarqueeHeight() {
    const marquee = document.querySelector('#marq');
    const sliderSection = document.querySelector('.slider-section');
    if (marquee && sliderSection) {
        marquee.style.height = (sliderSection.offsetHeight - 70) + 'px';
    }
}

function setBoardHeight() {
    const board = document.querySelector('.board');
    if (board) {
        const newHeight = board.offsetHeight - 150 + 'px';
        ['#marq1', '#marq2', '#marq3'].forEach(selector => {
            const element = document.querySelector(selector);
            if (element) {
                element.style.height = newHeight;
            }
        });
    }
}

function adjustHeights() {
    const boxes = document.querySelectorAll('.box');
    if (window.innerWidth > 768) {
        let maxBoxHeight = Array.from(boxes).reduce((maxHeight, box) => {
            return Math.max(maxHeight, box.offsetHeight);
        }, 0);

        boxes.forEach(box => {
            box.style.height = maxBoxHeight + 'px';
        });
    } else {
        boxes.forEach(box => {
            box.style.height = 'auto';
        });
    }
}

function initialize() {
    setSectionHeight();
    setMarqueeHeight();
    setBoardHeight();
    adjustHeights();
}

// Throttle function to limit execution frequency of resize events
function throttle(func, delay) {
    let timeout;
    return function () {
        if (!timeout) {
            timeout = setTimeout(() => {
                func();
                timeout = null;
            }, delay);
        }
    };
}

// Initialize and add event listeners
window.addEventListener('load', initialize);
window.addEventListener('resize', throttle(initialize, 100));  // Throttling for better performance
