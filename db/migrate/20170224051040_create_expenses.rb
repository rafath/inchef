class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.belongs_to :restaurant
      t.belongs_to :supplier
      t.string :invoice_number
      t.boolean :is_paid, default: false
      t.date :issue_date
      t.date :due_date
      t.timestamps
    end
  end
end
