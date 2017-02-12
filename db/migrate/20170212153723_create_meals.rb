class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.belongs_to :category
      t.belongs_to :restaurant
      t.string :name
      t.decimal :price, precision: 10, scale: 2, default: 0.00
      t.decimal :gross_price, precision: 10, scale: 2, default: 0.00
      t.decimal :vat, precision: 5, scale: 2, default: 1.08
      t.boolean :is_available, default: true
      t.string  :register_code
      t.string  :image
      t.text  :description
      t.timestamps
    end
    add_index :meals, [:category_id, :restaurant_id]
  end
end
