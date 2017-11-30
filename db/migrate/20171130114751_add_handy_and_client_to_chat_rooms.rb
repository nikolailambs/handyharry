class AddHandyAndClientToChatRooms < ActiveRecord::Migration[5.1]
  def change
    add_reference :chat_rooms, :handy, foreign_key: { to_table: :users }, index: true
    add_reference :chat_rooms, :client, foreign_key: { to_table: :users }, index: true
  end
end
