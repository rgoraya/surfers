class TournamentsController < ApplicationController

  def show
    @slug = params[:slug].to_s.tr('-','_')
  end

end