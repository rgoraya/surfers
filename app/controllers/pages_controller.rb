class PagesController < ApplicationController

  def contact
    @page_title = "Contact us"
  end

  def about
    @page_title = "About us"
  end

  def history
    @page_title = "History of the game"
  end

  def play
    @page_title = "Play with us"
  end

  def tournament
    @page_title = "Surfers Tournament"
  end

end