class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.belongs_to :user
      t.string :name
      t.string :domain
      t.string :street
      t.string :city
      t.string :postcode
      t.string :logo_file
      t.timestamps
    end
    add_index :restaurants, [:domain]
  end
end
