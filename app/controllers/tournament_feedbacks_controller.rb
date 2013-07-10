class TournamentFeedbacksController < ApplicationController

  def index
    @page_title = "Tournament Feedback"
    @tournament_feedback = TournamentFeedback.find(:all)
  end

  def create
    @tournament_feedback = TournamentFeedback.new params['feedback']
    if @tournament_feedback.save
      render :json => { :success => true }
    else
      render :json => { :success => false }, :status => 500
    end
  end

end