class CreateCateringExceptions < ActiveRecord::Migration[5.0]
  def change
    create_table :catering_exceptions do |t|
      t.belongs_to :user
      t.belongs_to :catering
      t.integer :delivery_qty, default: 2
      t.date :delivery_date
      t.string :comments
      t.timestamps
    end
  end
end
