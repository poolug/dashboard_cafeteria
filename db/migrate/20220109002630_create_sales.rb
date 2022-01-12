class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.date :date
      t.references :product, foreign_key: true
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
