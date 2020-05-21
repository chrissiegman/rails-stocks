class WatchlistsController < ApplicationController

  def index
    @watchlists = current_user.watchlists
  end

  def show
    @watchlist = Watchlist.find_by(:id => params[:id])
  end

  def new
    @watchlist = Watchlist.new
  end

  def create
    @watchlist = Watchlist.create(:user_id => session[:user_id], :name => watchlist_params[:name])
    redirect_to watchlist_path(@watchlist.id)
  end

  private
  def watchlist_params
    params.require(:watchlist).permit(:name, :user_id)
  end

  private
  def tickers(wid)
    result = Ticker.all
    puts('---------------------')
    puts(result)
    puts('---------------------')
    #tickers = Ticker.joins('watchlists_tickers').where(:watchlist_id => wid)
  end

end
