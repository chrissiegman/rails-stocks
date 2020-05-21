class Ticker < ApplicationRecord
  has_many :prices, dependent: :destroy
  belongs_to :watchlist
end
