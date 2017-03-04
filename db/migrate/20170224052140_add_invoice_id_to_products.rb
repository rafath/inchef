class AddInvoiceIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :invoice_id, :integer, default: 0
    add_index :products, :invoice_id
  end
end
