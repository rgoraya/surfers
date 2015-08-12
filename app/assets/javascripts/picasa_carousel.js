if (!window.S) { window.S = {}; }

S.picasaCarousel = (function($, _) {

    var carousel = function(element, albumid, userid, template) {
        this._$el = $(element);
        this._album_id = albumid;
        this._user_id  = userid;
        this._$template  = $(template);

        // Request for questionnaire
        this.get_photos();
    };

    carousel.prototype = {

        get_photos : function() {
            var that = this,
                albumURL = "https://picasaweb.google.com/data/feed/base/user/" + this._user_id + "/albumid/" + this._album_id +  "?alt=json&kind=photo";

            $.getJSON(albumURL, function(data) {
                var feed = that._extended_feed(data.feed);
                console.log(feed);
                that._$el.html(that._template().render(feed));
            });
        },

        _extended_feed : function(feed) {
            $.each( feed.entry, function( i, photo ) {
                photo.index = i;
                photo.active_class = i == 0 ? "active" : null;
            });
            feed.show_carousel_indicators = feed.entry.length < 10;
            return feed;
        },

        _template : function() {
            return Hogan.compile(this._$template.html());
        }
    };

    return carousel;

})(window.jQuery, window._);
