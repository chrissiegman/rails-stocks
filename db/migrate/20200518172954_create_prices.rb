class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.float :value
      t.references :ticker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
