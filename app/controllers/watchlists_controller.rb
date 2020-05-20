class WatchlistsController < ApplicationController

  def index
  end

  def new
    @watchlist = Watchlist.new
  end

  def create
  end
end
