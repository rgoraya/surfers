$("#fb-root").bind("facebook:init", function() {
    S.groupEvents = (function($, _) {

        var groupEvents = function(group_id) {
            this._group_id = group_id;

            // Request for questionnaire
            this.get_events();
        };

        groupEvents.prototype = {

            get_events : function() {
                var that = this;

                console.log("came here");

                if (FB) {
                    FB.getLoginStatus(function(response) {
                        that._login_status_changed(response)
                    });
                }
            },

            _login_status_changed : function(response) {
                var that = this;
                if (response.status == "connected"){
                    that._make_events_request();
                } else {
                    FB.login(function(response) {
                        if (response.status === 'connected') {
                            console.log("Logged into your app and Facebook.");
                            that._make_events_request();
                        };
                    });
                }
            },

            _make_events_request : function () {
                var that = this;
                FB.api(
                    "/" + that._group_id + "/events",
                    function (response) {
                        if (response && !response.error) {
                            console.log(response);
                        }
                    }
                );
            }

        };

        return groupEvents;

    })(window.jQuery, window._);

    var group_events = new S.groupEvents("115374325161195");

});
