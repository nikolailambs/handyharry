class AddHandyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :speciality, :string
    add_column :users, :handy, :boolean
    add_column :users, :first_name, :string
    add_column :users, :second_name, :string
    add_column :users, :avatar, :string
    add_column :users, :phone, :string
    add_column :users, :status, :string
  end
end
