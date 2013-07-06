$(document).ready(function() {

    var isWelcomePage = function() {
            return $('body.welcome_index').length > 0
        },
        isHistoryPage = function() {
            return $('body.pages_history').length > 0
        },
        carousel$el = $('#carousel_wrapper');

    if (isWelcomePage()) {
        var welcomeCarousel = new S.welcomeCarousel(carousel$el, "5897074641148382273");
    }
    if (isHistoryPage()) {
        var aboutCarousel = new S.welcomeCarousel(carousel$el, "5897342069983516161");
    }

    // Bound events:

});