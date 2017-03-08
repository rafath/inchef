class AddAmountToDeliveries < ActiveRecord::Migration[5.0]
  def change
    add_column :deliveries, :amount, :decimal, precision: 10, scale: 2, default: 0.00
  end
end
