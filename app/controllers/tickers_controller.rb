class TickersController < ApplicationController

  def index
  end

  def new
    @ticker = Ticker.new
  end

end
