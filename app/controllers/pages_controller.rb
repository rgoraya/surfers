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
    @page_title = "History of Field Hockey"
    @picasa_album_id = "5897342069983516161"
    @picasa_user_id = "114202720155216332234"
  end

  def play
    @page_title = "Play with us"
  end

  def tournament
    @page_title = "Tournament 2013"
  end

end