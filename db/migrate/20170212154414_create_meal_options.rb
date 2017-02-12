class CreateMealOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :meal_options do |t|
      t.belongs_to :restaurant
      t.belongs_to :category, null: true
      t.string :name
      t.decimal :price, precision: 10, scale: 2, default: 0.00
      t.decimal :gross_price, precision: 10, scale: 2, default: 0.00
      t.decimal :vat, precision: 5, scale: 2, default: 1.08
      t.decimal :quantity, precision: 10, scale: 2, default: 1.00
      t.string :qty_type, default: 'gr'
      t.boolean :is_available, default: true
      t.timestamps
    end
  end
end
