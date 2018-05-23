class TournamentRegistrationsController < ApplicationController
  
  require 'json'
  
  def index
    @page_title = "Tournament Registration"
    @tournament_registrations = TournamentRegistration.all
  end

  def show
    @tournament_registration = TournamentRegistration.find(params[:id])
  end

  def create
    @tournament = Tournament.find(params[:tournament][:id])
    @divisions  = []
    @team = Team.new params[:team]

    if @team.valid?
      @team_captain = TeamCaptain.new params[:team_captain]
      @team_captain.team = @team

      @team_manager = TeamManager.new params[:team_manager]
      @team_manager.team = @team

      @team_voluntary_umpire = TeamVoluntaryUmpire.new params[:team_voluntary_umpire]
      @team_voluntary_umpire.team = @team

      if @team_captain.valid?
        selected_divisions = params[:division].select {|division, selected| selected == "true"}
        if selected_divisions.any?
          if @team_manager.valid?
            if @team_voluntary_umpire.valid?
              selected_divisions.each do |division, selected|
                @divisions << Division.find_by_name(division)
              end

              @tournament_registration = TournamentRegistration.new
              @tournament_registration.team = @team
              @tournament_registration.tournament = @tournament
              @tournament_registration.divisions << @divisions

              if @tournament_registration.valid?
                # save the sh** out of everything now that we know it's all validated
                @team.save
                @team_captain.save
                @team_manager.save
                @team_voluntary_umpire.save
                
                params[:team_players].reject(&:empty?).each do |player_name|
                  @team_player = TeamPlayer.new :name => player_name
                  @team_player.team = @team
                  @team_player.save
                end
                Rails.logger.info('$$$$$$$$$$$$$$$$$$$$$$$$')
                Rails.logger.info('$$$$$$$$$$$$$$$$$$$$$$$$')
                Rails.logger.info('$$$$$$$$$$$$$$$$$$$$$$$$')
                Rails.logger.info(@tournament_registration.to_json)
                Rails.logger.info(@tournament_registration.team.to_json)
                Rails.logger.info(@tournament_registration.tournament.to_json)
                Rails.logger.info('########################')
                Rails.logger.info('########################')
                Rails.logger.info('########################')
                @tournament_registration.save

                # send out registration email to Team Manager
                @registration_confirmation = RegistrationEmail.new(registration_email_params("Confirmation"))

                  if @registration_confirmation.deliver
                  # send out registration email to surfer recipients
                  @registration_email = RegistrationEmail.new(registration_email_params("Notification"))

                if @registration_email.deliver
                    flash[:notice] = "You have successfully registered for Surfer's #{@tournament.name}. A confirmation has been sent to #{@team_manager.email}."
                    render :json => { :success => true, :tournament_registration => {:tournament => @tournament.name, :registration => @tournament_registration.id} }
                  else
                    render :json => {:success => false, :form_section => nil, :errors => @registration_confirmation.errors}, status: :unprocessable_entity
                  end
                else
                  render :json => {:success => false, :form_section => nil, :errors => @registration_email.errors}, status: :unprocessable_entity
                end
              else
                render :json => { :success => false, :form_section => nil, :errors => @tournament_registration.errors }, :status => 500
              end
            else
              render :json => { :success => false, :form_section => "team_voluntary_umpire", :errors => @team_voluntary_umpire.errors }, :status => 500
            end
          else
            render :json => { :success => false, :form_section => "team_manager", :errors => @team_manager.errors }, :status => 500
          end
        else
          render :json => { :success => false, :form_section => "division", :errors => {:division => "Choose at least one Division"} }, :status => 500
        end
      else
        render :json => { :success => false, :form_section => "team_captain", :errors => @team_captain.errors }, :status => 500
      end
    else
      render :json => { :success => false, :form_section => "team", :errors => @team.errors }, :status => 500
    end

  end

  def registration_email_params(type)
    {
        :team => @team,
        :team_manager => @team_manager,
        :team_captain => @team_captain,
        :tournament => @tournament,
        :registration => @tournament_registration,
        :type => type
    }
  end

end