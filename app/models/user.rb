class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :messages
  has_many :projects
  has_many :tasks, through: :projects

  has_many :conversations, foreign_key: :sender_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def conversations
    messages = self.messages
    senders = messages.map { |m| return m.sender unless m.sender != self }
    receivers = messages.map { |m| return m.receiver unless m.receiver != self }
    persons = senders + receivers
  end
end
