class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.belongs_to :user
      t.belongs_to :catering
      t.integer :delivery_qty, default: 1
      t.boolean :is_paid, default: false
      t.timestamps
    end
  end
end
