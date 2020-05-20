class Ticker < ApplicationRecord
  has_many :prices, dependent: :destroy
  has_and_belongs_to_many :watchlist
end
