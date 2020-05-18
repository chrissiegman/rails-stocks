class Ticker < ApplicationRecord
  has_many :prices, dependent: :destroy
end
