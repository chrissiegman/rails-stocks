class WatchlistsController < ApplicationController

  def index
    @watchlists = current_user.watchlists
  end

  def new
    @watchlist = Watchlist.new
  end

  def create
  end
end
