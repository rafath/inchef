class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.belongs_to :restaurant
      t.string :name
      t.decimal :quantity, precision: 10, scale: 2, default: 1.00
      t.string :qty_type, default: 'gr'
      t.decimal :price, precision: 10, scale: 2, default: 0.00
      t.decimal :gross_price, precision: 10, scale: 2, default: 0.00
      t.decimal :vat, precision: 5, scale: 2, default: 1.05
      t.timestamps
    end
  end
end
