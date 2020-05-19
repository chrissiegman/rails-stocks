class PricesController < ApplicationController

  def create
    @ticker = Ticker.find(params[:ticker_id])
    @price = @ticker.prices.create(price_params)
    redirect_to ticker_path(@ticker)
  end

  def new
    @price = Price.new()
  end

  private
  def price_params
    params.require(:price).permit(:value, :timestamp)
  end

end
