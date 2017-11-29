class ChangeDefaultHandyOnUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :handy, false
  end
end
