class AssociateWatchlistsAndTickers < ActiveRecord::Migration[6.0]
  def change
    create_table :watchlists_tickers, id: false do |t|
      t.belongs_to :watchlist
      t.belongs_to :ticker
    end
  end
end
