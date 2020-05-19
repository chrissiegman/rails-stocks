require 'unirest'
require 'json'

namespace :prices do

  task :update => :environment do

    # Get all ticker symbols
    puts('update-test')
    tickers = Ticker.all
    symbols = ""
     
    tickers.each do |ticker|
      symbols += ticker.name += ","
    end

    symbols.delete_suffix!(',')
    puts("Updating prices for: " + symbols)

    # Build API url string
    response = Unirest.get "https://apidojo-yahoo-finance-v1.p.rapidapi.com/market/get-quotes?region=US&lang=en&symbols=" + symbols,
      headers:{
        "X-RapidAPI-Host" => "apidojo-yahoo-finance-v1.p.rapidapi.com",
        "X-RapidAPI-Key" => "3f652748f1mshbfd8df51ee5fa08p1bfff1jsn074838544e52",
      }

    content = response.raw_body
    results = JSON.parse(content)["quoteResponse"]["result"]

    results.each do |quote|
      data = quote.slice("symbol", "regularMarketPrice")
      puts(data)
      ticker = Ticker.find_by name: data["symbol"]
      ticker.prices.create({"value": data["regularMarketPrice"]})

    end
  end

end

