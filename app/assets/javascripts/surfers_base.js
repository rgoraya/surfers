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
        isEventsPage = function() {
            return $('body.pages_surfer_events').length > 0;
        },

        initTournamentFeedback = function() {
            return $('#tournamentFeedbackModal').length > 0;
        },
        carousel$el = $('#carousel_wrapper');

    $("#fb-root").bind("facebook:init", function() {
        var group_events = new S.groupEvents("115374325161195");
        if (isEventsPage()) {
            group_events.all_events();
        } else {
            group_events.first_upcoming_event();
        }
    });

    if (picasa_album_id && picasa_user_id) {
        if (picasa_content_template) {
            aboutCarousel = new S.picasaCarousel(picasa_content_wrapper, picasa_album_id ,picasa_user_id, picasa_content_template);
        }
        var albumID = "5897342069983516161",
            userID  = "114202720155216332234",
            aboutCarousel = new S.picasaCarousel(carousel$el, albumID ,userID);
    }
    if (initTournamentFeedback) {
        var tournamentFeedback = new S.tournamentFeedbackModal();
    }

    // Bound events:

});