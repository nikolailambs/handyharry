class Project < ApplicationRecord
  belongs_to :handy
  belongs_to :client

  has_many :tasks
end
