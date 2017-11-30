class ChangeNameTypeInChatRooms < ActiveRecord::Migration[5.1]
  def change
    change_column :chat_rooms, :name, :text
  end
end
