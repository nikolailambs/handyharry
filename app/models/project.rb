class Project < ApplicationRecord
  belongs_to :handy, class_name: "User"
  belongs_to :client, class_name: "User"

  has_many :tasks, inverse_of: :project, dependent: :destroy
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

  def completion_percentage
    amount_tasks = tasks.count
    tasks.each do |task|
      complete = []
      if task.status
        i += 1
        complete << i
      end
      amounnt_complete = complete.count
      amounnt_complete/amount_tasks*100
    end
  end

end
