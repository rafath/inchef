class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.belongs_to :restaurant
      t.belongs_to :meal
      t.belongs_to :product
      t.decimal :quantity, precision: 10, scale: 2, default: 1.00
      t.string :qty_type, default: 'gr'
      t.timestamps
    end
    add_index :ingredients, [:meal_id, :product_id]
  end
end
