class ChatRoom < ApplicationRecord
  has_many :messages
  belongs_to :handy, class_name: "User"
  belongs_to :client, class_name: "User"

  serialize :name, Hash

  def other_user?
    # loop backwards through self.messages until finding message of the other user
    # to check if he is a handyman or not
  end
end
