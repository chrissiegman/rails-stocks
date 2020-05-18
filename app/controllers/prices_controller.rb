class PricesController < ApplicationController

  def create
    @price = Price.new(arand(1..10))
  end

  def create
    @ticker = Ticker.find(params[:ticker_id])
    @price = @ticker.prices.create(value: rand(1..10))
    redirect_to ticker_path(@ticker)
  end


  def new
    @price = Price.new()
  end


end
