class RemoveReferencesFromMessages < ActiveRecord::Migration[5.1]
  def change
    remove_reference :messages, :sender, foreign_key: { to_table: :users }, index: true
    remove_reference :messages, :receiver, foreign_key: { to_table: :users }, index: true

    add_reference :messages, :user, index: true
    add_reference :messages, :chat_room, index: true
  end
end
