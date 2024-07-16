function openTab(evt, tabName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tab-content");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tab-link");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
    
    // Start the marquee for the active tab
    startMarquee(tabName);
    
    setNoticeSectionHeight();
    setMarqueeHeight();
}

function startMarquee(tabName) {
    var marq;
    if (tabName === 'Notices') {
        marq = document.querySelector('#marq1');
    } else if (tabName === 'News') {
        marq = document.querySelector('#marq2');
    } else if (tabName === 'Tender') {
        marq = document.querySelector('#marq3');
    }
    if (marq) {
        marq.start();
    }
}

function setNoticeSectionHeight() {
    var slider = document.querySelector('.slider');
    var noticeSection = document.querySelector('.notice-section');
    if (slider && noticeSection) {
        noticeSection.style.height = slider.offsetHeight + 'px';
    }
}

function setMarqueeHeight() {
    var marq1 = document.querySelector('#marq1');
    var marq2 = document.querySelector('#marq2');
    var marq3 = document.querySelector('#marq3');
    var slider = document.querySelector('.slider');
    if (marq1 && slider) {
        marq1.style.height = (slider.offsetHeight - 125) + 'px';
    }
    if (marq2 && slider) {
        marq2.style.height = (slider.offsetHeight - 125) + 'px';
    }
    if (marq3 && slider) {
        marq3.style.height = (slider.offsetHeight - 125) + 'px';
    }
}

window.onload = function () {
    setNoticeSectionHeight();
    setMarqueeHeight();
    // Start marquee for the default active tab
    startMarquee('Notices');
};

window.onresize = function () {
    setNoticeSectionHeight();
    setMarqueeHeight();
};

