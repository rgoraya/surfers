if (!window.S) { window.S = {}; }

S.groupEvents = (function($, _) {

    var groupEvents = function(group_id, is_welcome_page, is_events_page) {
        this._group_id = group_id;
        this._is_welcome_page = is_welcome_page;
        this._is_events_page = is_events_page;
        // Request for questionnaire
        this.get_events();
    };

    groupEvents.prototype = {

        get_events : function() {
            var that = this;

            if (FB) {
                FB.getLoginStatus(function(response) {
                    that._login_status_changed(response)
                });
            }
        },

        _login_status_changed : function(response) {
            var that = this;
            if (response.status == "connected"){
                this._make_events_request();
            } else {
                if (this._is_events_page) {
                    FB.login(function(response) {
                        if (response.status === 'connected') {
                            that._make_events_request();
                        };
                    });
                }
            }
        },

        _make_events_request : function () {
            var that = this,
                now = _.now();

            FB.api(
                "/" + that._group_id + "/events",
                function (response) {
                    if (response && !response.error) {
                        console.log(response.data);
                        console.log(response.data.length);
                        if (response.data && response.data.length)  {
                            that._upcoming_events = _.filter(response.data, function(event){ return (new Date(event.start_time)).getTime() > now; });
                            that._past_events = _.reject(response.data, function(event){ return (new Date(event.start_time)).getTime() > now; });
                            console.log(that._upcoming_events);
                            console.log(that._past_events);
                        }
                    }
                }
            );
        }

    };

    return groupEvents;

})(window.jQuery, window._);


