if (!window.S) { window.S = {}; }

S.groupEvents = (function($, _) {

    var groupEvents = function(group_id) {
        this._group_id = group_id;
        this._all_events = [];
        this._first_upcoming_event = null;
        this._past_events = [];
        this._upcoming_events = [];
    };

    groupEvents.prototype = {

        all_events : function() {
            this._fb_login_status(_.bind(this._authenticate_and_get_events, this));
        },

        first_upcoming_event : function () {
            this._fb_login_status(_.bind(this._get_first_upcoming_event_if_authenticated, this));
        },

        render : function () {

        },

        _fb_login_status : function (callback) {
            if (FB) {
                FB.getLoginStatus(function(response) {
                    callback(response);
                });
            }
        },

        _authenticate_and_get_events : function(response) {
            var that = this;
            if (response.status === 'connected'){
                this._get_all_events();
            } else {
                FB.login(function(response) {
                    if (response.status === 'connected') {
                        that._get_all_events();
                    }
                });
            }
        },

        _get_first_upcoming_event_if_authenticated : function (response) {
            if (response.status === 'connected'){
                this._get_first_upcoming_event();
            }
        },

        _get_first_upcoming_event : function () {
            var that = this,
                now = new Date();

            FB.api(
                "/" + that._group_id + "/events?since=" + Math.floor(now.getTime() / 1000),
                function (response) {
                    console.log(response);
                    if (response && !response.error) {

                        if (response.data && response.data.length)  {
                            that._all_events = response.data;
                            that._first_upcoming_event = _.last(that._all_events);
                            that._render_event_skeleton(that._first_upcoming_event, true, "upcomingEventContainer");
                            that._extend_and_render_event(that._first_upcoming_event, "upcomingEventTemplate");
                        }
                    }
                }
            );
        },

        _get_all_events : function () {
            var that = this;

            FB.api(
                "/" + that._group_id + "/events",
                function (response) {
                    console.log(response);
                    if (response && !response.error) {
                        console.log(response.data);
                        console.log(response.data.length);
                        if (response.data && response.data.length)  {
                            that._all_events = response.data;
                            _.each(that._all_events, function(event, i){

                                that._render_event_skeleton(event, i == 0, "eventContainer");
                                that._extend_and_render_event(event, "eventTemplate");
//                                if (event.date_time.time > now) {
//                                    that._upcoming_events.push(event);
//                                } else {
//                                    that._past_events.push(event);
//                                }
                            });
//                            that._fetch_upcoming_event_details();
//                            that._render_past_events();
                        }
                    }
                }
            );
        },

        _fetch_upcoming_event_details : function () {
            var that = this;
            _.each(this._upcoming_events, function(event) {
                FB.api(
                    "/" + event.id,
                    function (response) {
                        if (response && !response.error) {
                            response.picture = null;
                            FB.api(
                                "/" + event.id + "/picture",
                                function(picture) {
                                    if (picture && !picture.error) {
                                        response.picture = picture.data;
                                        that._render_upcoming_event(response);
                                        console.log(response);
                                    } else {
                                        that._render_upcoming_event(response);
                                        console.log(response);
                                    }
                                }
                            );
                        }
                    }
                );
            })
        },

        _extend_and_render_event : function (event, template) {
            var that = this;

            FB.api(
                "/" + event.id,
                function (response) {
                    if (response && !response.error) {
                        event = response;
                        event.picture = null;
                        event.date_time = that._get_start_date_time(event.start_time);
                        event.url_encoded_address = encodeURI(event.venue.street + event.venue.city + event.venue.state);
                        FB.api(
                            "/" + event.id + "/picture",
                            function(picture) {
                                if (picture && !picture.error) {
                                    event.picture = picture.data;
                                }
                                that._render_event(event, template);
                            }
                        );
                    }
                }
            );
        },

        _get_start_date_time : function (start_time) {
            var date = new Date(start_time);
            return {
                time: date.getTime(),
                formatted_time: date.toLocaleTimeString(),
                formatted_date: date.toLocaleDateString()
            }
        },

        _render_upcoming_event : function (event) {

        },

        _render_event_skeleton : function (event, is_first, container) {
            var $eventsContainer = $("#" + container);
            if (is_first) {
                $eventsContainer.empty();
            }

            $eventsContainer.append(Hogan.compile($('#' + container + 'Template').html()).render(event));
        },

        _render_event : function (event, template) {
            console.log(event);
            $("#" + event.id).html(Hogan.compile($('#' + template).html()).render(event));
        }

    };

    return groupEvents;

})(window.jQuery, window._);


