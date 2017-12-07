class Project < ApplicationRecord
  belongs_to :handy, class_name: "User"
  belongs_to :client, class_name: "User"
  has_attachments :photos, maximum: 5

  has_many :tasks, inverse_of: :project
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

  geocoded_by :full_address
  after_validation :geocode, if: :address_changed?

  include AlgoliaSearch


  algoliasearch do
    attribute :title, :handy_id, :client_id, :address, :accepted, :deadline, :status, :description, :title, :location, :city
  end

  def completion_percentage
    amount_tasks = tasks.count
    status_true = tasks.select { |f| f.status == true }
    amount_true = status_true.count
    result = (amount_true.to_f / amount_tasks.to_f).to_f
    result.round(2)
  end

  def map_link
    google_address = "#{self.address.gsub(/\s/, '+')},+#{self.city.gsub(/\s/, '+')}"
    # "https://www.google.com/maps/dir/Berlin/#{google_address}/data=!4m2!4m1!3e0"
    "https://www.google.com/maps?saddr=Factory+Berlin&daddr=#{google_address}"
  end

  def full_address
    "#{self.address}, #{self.city}"
  end
end
