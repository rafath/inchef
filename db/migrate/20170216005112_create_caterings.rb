class CreateCaterings < ActiveRecord::Migration[5.0]
  def change
    create_table :caterings do |t|
      t.belongs_to :user
      t.decimal :price, precision: 10, scale: 2, default: 0.00
      t.integer :calories, default: 1500 # 1500 1750 2000 - sam obiad, bez obiad -> komentarze
      t.integer :week_delivery_qty, default: 5 # 1 - 7
      t.integer :ordered_qty, default: -1 #unlimited
      t.integer :delivered_qty, default: 0
      t.string :comments, limit: 1000
      t.date :delivery_start_date
      t.boolean :is_active, default: true
      t.timestamps
    end
  end
end
