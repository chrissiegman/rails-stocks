require 'unirest'
require 'json'

response = Unirest.get "https://apidojo-yahoo-finance-v1.p.rapidapi.com/market/get-quotes?region=US&lang=en&symbols=NCLH,LVGO,TSLA",
  headers:{
    "X-RapidAPI-Host" => "apidojo-yahoo-finance-v1.p.rapidapi.com",
    "X-RapidAPI-Key" => "3f652748f1mshbfd8df51ee5fa08p1bfff1jsn074838544e52",
  },
  parameters:{
    "parameter" => "value"
  }
response.code # Status code
response.headers # Response headers
response.body # Parsed body
response.raw_body # Unparsed body

content = response.raw_body
results = JSON.parse(content)["quoteResponse"]["result"]

results.each do |quote|
  data = quote.slice("symbol", "regularMarketPrice")
  puts(data)
end

