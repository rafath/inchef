class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phone, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :role_type, :string, default: 'customer' # admin | customer | owner-admin  | employee?
    add_column :users, :is_trusted, :boolean, default: false
    User.where(email: 'ichef@zaraz.pl').update(is_trusted: true, role_type: 'admin')
  end

end
