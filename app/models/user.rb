class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :projects
  has_many :tasks, through: :projects

  has_many :messages, dependent: :destroy
  has_many :chat_rooms

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
