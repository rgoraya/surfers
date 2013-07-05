if (!window.S) { window.S = {}; }

S.welcomeCarousel = (function($, _) {

    var carousel = function(element, albumid) {
        this._$el = element;
        this._album_id = albumid;
        // Request for questionnaire
        this.get_photos();
    };

    carousel.prototype = {

        get_photos : function() {
            var that = this,
                albumURL = "https://picasaweb.google.com/data/feed/base/user/114202720155216332234/albumid/" + this._album_id +  "?alt=json&kind=photo";

            $.getJSON(albumURL, function(data) {
                var feed = that._extended_feed(data.feed);
                that._$el.html(that._template().render(feed));
                that._initialize_carousel();
            });
        },

        _extended_feed : function(feed) {
            $.each( feed.entry, function( i, photo ) {
                photo.index = i;
                photo.active_class = i == 0 ? "active" : null;
            });
            return feed;
        },

        _template : function() {
            return Hogan.compile($('#carouselTemplate').html());
        },

        _initialize_carousel : function() {
//            $('.carousel').carousel({
//                interval: 5000
//            })
        }
    };

    return carousel;

})(window.jQuery, window._);
