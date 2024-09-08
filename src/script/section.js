function setSliderHeight() {
    var slider = document.querySelector('.slider');
    var sliderimg = document.querySelector('.slide-img');
    if (slider && sliderimg) {
        slider.style.height = sliderimg.offsetHeight + 'px';
    }
}

function setNoticeSectionHeight() {
    var slider = document.querySelector('.slider-section');
    var noticeSection = document.querySelector('.notice-section');
    if (slider && noticeSection) {
        noticeSection.style.height = slider.offsetHeight + 'px';
    }
}

function setMarqueeHeight() {
    var marq = document.querySelector('#marq');
    var slider = document.querySelector('.slider-section');
    if (marq && slider) {
        marq.style.height = (slider.offsetHeight - 70) + 'px';
    }
}

function setBoardHeight() {
    var marq1 = document.querySelector('#marq1');
    var marq2 = document.querySelector('#marq2');
    var marq3 = document.querySelector('#marq3');
    var board = document.querySelector('.board');

    if (board) {
        var newHeight = board.offsetHeight - 150 + 'px';

        if (marq1) {
            marq1.style.height = newHeight;
        }
        if (marq2) {
            marq2.style.height = newHeight;
        }
        if (marq3) {
            marq3.style.height = newHeight;
        }
    }
}

function adjustHeights() {
    if (window.innerWidth > 768) {
        let boxes = document.querySelectorAll('.box');

        let maxBoxHeight = Array.from(boxes).reduce((maxHeight, box) => {
            return Math.max(maxHeight, box.offsetHeight);
        }, 0);

        boxes.forEach(box => {
            box.style.height = maxBoxHeight + 'px';
        });
    } else {
        document.querySelectorAll('.box').forEach(element => {
            element.style.height = 'auto';
        });
    }
}

function initialize() {
    setSliderHeight();
    setNoticeSectionHeight();
    setMarqueeHeight();
    setSliderHeight();
    setBoardHeight();
    adjustHeights();
    if (typeof startMarquee === 'function') {
        startMarquee('Notice');
    }
}

window.onload = initialize;
window.onresize = function () {
    setSliderHeight();
    setNoticeSectionHeight();
    setMarqueeHeight();
    setSliderHeight();
    setBoardHeight();
    adjustHeights();
};