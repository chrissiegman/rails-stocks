class AddTimestampToPrice < ActiveRecord::Migration[6.0]
  def change
    add_column :prices, :timestamp, :string
  end
end
