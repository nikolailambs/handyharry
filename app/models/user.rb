class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :messages
  has_many :projects
  has_many :tasks, through: :projects

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
