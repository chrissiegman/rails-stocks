class TickersController < ApplicationController

  def index
    @tickers = Ticker.all
  end

  def show
    @ticker = Ticker.find(params[:id])
  end

  def create
    @ticker = Ticker.new(ticker_params)

    if @ticker.save
      redirect_to @ticker
    else
      render 'new'
    end
  end

  def new
    @ticker = Ticker.new
  end

  private
  def ticker_params
    params.require(:ticker).permit(:name)
  end

end
