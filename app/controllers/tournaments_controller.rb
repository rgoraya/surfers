class TournamentsController < ApplicationController

  def show
    @slug = params[:slug].to_s
    @tournament = Tournament.find_by_slug(@slug)
  end

  def register
    @id = params[:id]
    @slug = params[:slug].to_s
    @tournament = Tournament.find_by_slug(@slug)

  end

end