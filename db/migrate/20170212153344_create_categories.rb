class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.belongs_to :restaurant
      t.string :name
      t.string :slug
      t.string :description, limit: 1000
      t.string :image
      t.timestamps
    end
    add_index :categories, [:slug, :restaurant_id]
  end
end
