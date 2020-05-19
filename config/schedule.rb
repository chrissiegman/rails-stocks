env :PATH, ENV['PATH']
env :GEM_PATH, ENV['GEM_PATH']
set :output, "log/whenever.log"
every 1.hour do
  rake "prices:update"
end
