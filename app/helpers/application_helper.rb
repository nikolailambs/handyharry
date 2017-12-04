module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # def phone_number_link(text)
  #   sets_of_numbers = text.scan(/[0-9]+/)
  #   number = "+49 #{sets_of_numbers.join('')}"
  #   link_to text, "tel:#{number}"
  # end
end
