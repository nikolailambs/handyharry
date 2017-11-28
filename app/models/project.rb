class Project < ApplicationRecord
  belongs_to :handy, class_name: "User"
  belongs_to :client, class_name: "User"

  has_many :tasks, inverse_of: :project, dependent: :destroy
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

end
