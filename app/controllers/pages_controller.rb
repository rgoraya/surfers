class PagesController < ApplicationController

  def contact
    @title = "Contact us"
  end

  def about
    @title = "About us"
  end

  def history
    @title = "History of the game"
  end

  def play
    @title = "Play with us"
  end

end