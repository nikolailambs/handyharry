class Project < ApplicationRecord
  belongs_to :handy, class_name: "User"
  belongs_to :client, class_name: "User"

  has_many :tasks, inverse_of: :project, dependent: :destroy
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

  def completion_percentage
    amount_tasks = tasks.count
    status_true = tasks.select { |f| f.status == true }
    amount_true = status_true.count
    result = (amount_true.to_f / amount_tasks.to_f).to_f
    result.round(2)
  end
end
