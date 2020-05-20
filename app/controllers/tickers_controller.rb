class TickersController < ApplicationController

  skip_before_action :authorized, only: [:index]

  def index
    @tickers = Ticker.all
  end

  def show
    @ticker = Ticker.find(params[:id])
  end

  def create
    ticker = Ticker.find_by name: params[:ticker][:name]
    if ticker 
      flash[:notice] = "The ticker " + ticker[:name] +  " is already in your watchlist"
    else
      @ticker = Ticker.new(ticker_params)
      if @ticker.save
        flash[:notice] = "Added ticker " + @ticker.name + " to your watchlist. Data should be available shortly."
      else
        flash[:notice] = "Something went wrong."
      end
    end
    redirect_to tickers_path
  end

  def new
    @ticker = Ticker.new
  end

  private
  def ticker_params
    params.require(:ticker).permit(:name)
  end

end
