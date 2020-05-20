class TickersController < ApplicationController

  def index
    @tickers = Ticker.all
  end

  def show
    @ticker = Ticker.find(params[:id])
  end

  def create
    # I think this logic could be more concise
    params[:ticker][:name] = params[:ticker][:name].upcase
    ticker = Ticker.find_by name: params[:ticker][:name] 
    if ticker
      flash[:error] = "The ticker " + ticker[:name] +  " is already in your watchlist."
    else
      @ticker = Ticker.new(ticker_params)
      data = call_chart_api(@ticker.name)
      if !data.nil?
        @ticker.save
        insert_ticker_price_data(@ticker.name, data)
      else
        flash[:error] = "Data import failed for symbol " + @ticker.name + ". Please ensure this is a valid symbol and try again."
      end
    end
    redirect_to tickers_path
  end

  def new
    @ticker = Ticker.new
  end

  private
  def ticker_params
    params[:ticker][:name].upcase!
    params.require(:ticker).permit(:name)
  end

  private
  def insert_ticker_price_data(symbol, data)
    flash[:success] = "Added ticker " + @ticker.name + " to your watchlist."
    data.each do |key, value|
      ticker = Ticker.find_by name: symbol
      ticker.prices.create({"timestamp": key, "value": value})
    end
  end

  private
  def call_chart_api(symbol)
    # Build API url string
    response = Unirest.get "https://apidojo-yahoo-finance-v1.p.rapidapi.com/market/get-charts?region=US&lang=en&interval=1d&range=1y&symbol=" + symbol,
      headers:{
        "X-RapidAPI-Host" => "apidojo-yahoo-finance-v1.p.rapidapi.com",
        "X-RapidAPI-Key" => "3f652748f1mshbfd8df51ee5fa08p1bfff1jsn074838544e52",
      }
    content = response.raw_body
    result = JSON.parse(content)["chart"]["result"]

    if !result.nil?
      result = JSON.parse(content)["chart"]["result"][0]
      timestamps = result["timestamp"]
      prices = result["indicators"]["quote"][0]["close"]
      data = Hash[timestamps.zip(prices)]
    else
      data = nil
    end
  end

end
