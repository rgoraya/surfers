$(document).ready(function() {

    var isWelcomePage = function() {
            return $('body.welcome_index').length > 0
        };

    if (isWelcomePage()) {
        var $el = $('#welcome_wrapper'),
            albumid = "5897074641148382273"
            welcomeCarousel = new S.welcomeCarousel($el, albumid);
    }

    // Bound events:

});