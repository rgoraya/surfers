$(document).ready(function() {

    var isWelcomePage = function() {
            return $('body.welcome_index').length > 0;
        },
        isTournamentPage = function() {
            return $('body.tournaments_show').length > 0;
        },
        isHistoryPage = function() {
            return $('body.pages_history').length > 0;
        },
        initTournamentFeedback = function() {
            return $('#tournamentFeedbackModal').length > 0;
        },
        carousel$el = $('#carousel_wrapper');

    if (isWelcomePage() || isTournamentPage()) {
        var albumID = "5898663168003572401",
            userID  = "108613443650075185421",
            welcomeCarousel = new S.picasaCarousel(carousel$el, albumID, userID);
    }
    if (isHistoryPage()) {
        var albumID = "5897342069983516161",
            userID  = "114202720155216332234",
            aboutCarousel = new S.picasaCarousel(carousel$el, albumID ,userID);
    }
    if (initTournamentFeedback) {
        var tournamentFeedback = new S.tournamentFeedbackModal();
    }

    // Bound events:

});