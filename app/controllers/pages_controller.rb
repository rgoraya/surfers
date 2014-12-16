class PagesController < ApplicationController

  def contact
    @page_title = "Contact us"
  end

  def about
    @page_title = "About us"
  end

  def surfer_events
    @page_title = "Surfer Events"
  end

  def history
    @page_title = "History of the game"
  end

  def play
    @page_title = "Play with us"
  end

  def tournament
    @page_title = "Tournament 2013"
  end

end