class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :projects
  has_many :tasks, through: :projects

  has_many :messages, dependent: :destroy
  has_many :chat_rooms, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def build_user_name
    if check_user_names?
      self.first_name + " " + self.second_name
    else
      self.email
    end
  end

  private

  def check_user_names?
    self.first_name && self.second_name
  end
end
