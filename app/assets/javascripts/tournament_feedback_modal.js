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

        _submit_feedback : function(e) {
            e.preventDefault();
            var $form   = $(e.target).closest('#tournamentFeedbackModal').find('form'),
                $inputs = $form.find('input, textarea'),
                that    = this,
                data    = {};

            this._errors  = [];

            $inputs.each(function(index, element) {
                that._validate_data(element);
                data[element.name] = element.value || '';
            });

            console.log(data);

            if (! this._errors.length) {
                $.ajax({
                    url     : "/tournament_feedbacks",
                    type    : "POST",
                    data    : {feedback : data},
                    success : function(resp){
                        $('#tournamentFeedbackModal')
                            .addClass('submitted');
                    }
            });
            } else {
                $form.find('input.error').first().focus();
            }
        },

        _validate_data : function(element) {
            var valid  = true,
                $group = $(element).closest('.control-group');

            if ($(element).data('required') == true && !element.value ) {
                valid = false;
                $(element).siblings('.error-message').html("Required");
            }

            if (valid) {
                $group.removeClass('error');
            } else {
                $group.addClass('error');
                this._errors.push(element.name);
            }
        },

        _reconsider_error_state : function(e) {
            var el = (e.target);
            this._validate_data(el)
        },


        _reset_modal : function() {
            this._errors  = [];
            $("form#tournamentFeedbackForm")
                .find('input')
                    .val('')
                    .end()
                .find('.control-group')
                    .removeClass('error')
                    .end()
                .find('.btn')
                    .removeClass('active')
                    .end()
                .find('input:text')
                    .first()
                    .focus()
                    .end();
            $('#tournamentFeedbackModal')
                .removeClass('submitted');
        },

        _bind_events : function() {
            $('body')
                .on('click', '.btn-group[data-toggle=buttons-radio] .btn', _.bind(this._get_radio_btn_val, this))
                .on('change', 'form#tournamentFeedbackForm input', _.bind(this._reconsider_error_state, this))
                .on('click', '#submitTournamentFeedback', _.bind(this._submit_feedback, this));

            $('#tournamentFeedbackModal')
                .on('show', _.bind(this._reset_modal, this));
        }
    };

    return feedbackModal;

})(window.jQuery, window._);
