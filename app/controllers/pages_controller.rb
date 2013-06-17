class PagesController < ApplicationController

  def contact
    @title = "Contact us"
  end

  def about
    @title = "About us"
  end

  def play
    @title = "Play with us"
  end

end