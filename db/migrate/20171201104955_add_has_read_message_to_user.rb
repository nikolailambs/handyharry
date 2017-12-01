class AddHasReadMessageToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :has_read_message, :boolean
  end
end
