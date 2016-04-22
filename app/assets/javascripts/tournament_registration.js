if (!window.S) { window.S = {}; }

S.tournamentRegistration = (function($, _) {

    var tournamentRegistration = function() {

        this._build_context();
        this._bind_events();
    };

    tournamentRegistration.prototype = {

        _submit_registration : function(e) {
            e.preventDefault();

            var that    = this,
                $submit = $(e.target);
            this._remove_all_errors();
            this._map_form_sections();

            if (! this._errors.length) {
                $submit.addClass('disabled');
                $.ajax({
                    url     : "/tournament_registrations",
                    type    : "POST",
                    data    : that._form_sections,
                    success : function(response){
                        $submit.removeClass('disabled');
                        window.location.replace("/annual-6-x-6-tournament-2016");
                    },
                    error: function(data) {
                        $submit.removeClass('disabled');
                        that._handle_server_errors(data.responseJSON);
                    }
                });
            } else {
                this._$form.find('input.error').first().focus();
                this._$error_notice.collapse("show");
            }
        },

        _handle_server_errors : function (response) {
            var $error_form_section = this._$form.find('.form-group[data-form-section=' + response.form_section + ']');

            _.each(response.errors, function(error, input_name){
                $error_form_section.find('[data-error-after=' + input_name + ']')
                    .closest('.form-group').addClass('has-error')
                        .end()
                    .focus()
                    .after('<div class="help-block">' + error + '</div>');
            });
            this._$error_notice.collapse("show");
        },

        _remove_all_errors : function () {
            this._errors  = [];
            this._$form.find('.help-block').remove();
            this._$form_groups.removeClass('has-error');
            this._$error_notice
                .removeClass("in")
                    .collapse("hide");
        },
        
        _validate_data : function(element) {
            var valid  = true,
                $group = $(element).closest('.form-group');

            if ($(element).data('required') == true && !element.value ) {
                valid = false;
                $(element).after('<div class="help-block">' + "Is Required" + '</div>');
            }

            if (valid) {
                $group.removeClass('has-error');
            } else {
                $group.addClass('has-error');
                this._errors.push(element.name);
            }
        },

        _reconsider_error_state : function(e) {
            var el = (e.target);
            this._validate_data(el)
        },


        _map_form_sections : function () {
            var that = this,
                data = {};

            this._form_sections = {};

            this._$form_groups.each(function(){
                that._form_sections[$(this).data('form-section')] = {}
            });

            _.map(this._form_sections, function(value, key){
                var $section_inputs  = that._$form.find('.form-group[data-form-section=' + key + ']').find('input');

                data = {};
                $section_inputs.each(function(index, element) {
                    that._validate_data(element);
                    if (element.type == "checkbox") {
                        data[element.name] = element.checked
                    } else {
                        data[element.name] = element.value || ''
                    }
                });
                that._form_sections[key] = data;
            });

            this._form_sections.tournament   = { id: this._$form.data('tournament-id')};
            this._form_sections.team_players = _.values(this._form_sections.team_players);
        },

        _build_context : function () {
            this._$form = $('form#tournament_register_form');
            this._$form_groups = this._$form.find('.form-group');
            this._$error_notice = this._$form.find('#errorNotice');
            this._form_sections = {};
            this._errors  = [];
        },
        
        _bind_events : function() {
            this._$form
                .on('click', '#submitTournamentRegistration', _.bind(this._submit_registration, this));
        }
    };

    return tournamentRegistration;

})(window.jQuery, window._);
