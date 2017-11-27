class Project < ApplicationRecord
  belongs_to :handy
  belongs_to :client
  has_many :stati, :through => :tasks
  has_many :tasks, inverse_of: :project, dependent: :destroy
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

end
