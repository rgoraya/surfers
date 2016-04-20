class WelcomeController < ApplicationController

  def index
    @page_title = "Welcome"
    @tournament = Tournament.last
  end

end