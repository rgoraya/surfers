if (!window.S) { window.S = {}; }

S.tournamentFeedbackModal = (function($, _) {

    var feedbackModal = function() {

        // Request for questionnaire
        this._bind_events();
    };

    feedbackModal.prototype = {

        _get_radio_btn_val : function(e) {
            var $target = $(e.target),
                $input  = $target.closest('.controls').find('input');

            $input.val($target.data('val'));
        },

        _validate_data : function(element) {
            var valid = true;

            if ($(element).data('required') == true && !element.value ) {
                valid = false;
                $(element).siblings('.error-message').html("Required");
            }

            if (valid) {
                $(element).removeClass('error');
            } else {
                $(element).addClass('error');
                this._errors.push(element.name);
            }
        },

        _reconsider_error_state : function(e) {
            var el = (e.target);
            this._validate_data(el)
        },


        _bind_events : function() {
            $('body')
                .on('click', '.btn-group[data-toggle=buttons-radio] .btn', _.bind(this._get_radio_btn_val, this))
                .on('change', 'form#tournamentFeedbackForm input', _.bind(this._reconsider_error_state, this) )
        }
    };

    return feedbackModal;

})(window.jQuery, window._);
