class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      t.belongs_to :restaurant
      t.string :nip
      t.string :company
      t.string :address
      t.string :phone
      t.timestamps
    end
  end
end
