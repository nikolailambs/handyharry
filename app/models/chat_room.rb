class ChatRoom < ApplicationRecord
  has_many :messages
  belongs_to :handy, class_name: "User"
  belongs_to :client, class_name: "User"

  serialize :name, Hash
end
