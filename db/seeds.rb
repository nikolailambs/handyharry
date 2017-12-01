# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Rails.env.development?
  User.destroy_all
  Project.destroy_all
  Task.destroy_all
end

@user_ids = (1..10).to_a
@date = rand(1.year).seconds.from_now

@project_ids =(1..5).to_a


puts 'Creating 5 fake users...'

5.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "123456",
    speciality: "",
    handy: false,
    first_name: Faker::Name.first_name,
    second_name: Faker::Name.last_name,
    avatar: "/assets/images/client.png",
    phone: "",
    status: ""
  )
  user.save!
end

puts 'Creating 5 fake handies...'

5.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "123456",
    speciality: "",
    handy: true,
    first_name: Faker::Company.name,
    second_name: Faker::Name.last_name,
    avatar: "/assets/images/handy.png",
    phone: "",
    status: ""
  )
  user.save!
end

puts 'Creating 2 fake projects...'

5.times do
  project = Project.new(
    handy_id: @user_ids.sample,
    client_id: @user_ids.sample,
    address: Faker::Address.street_address,
    deadline: @date,
    status: false,
    description: "Toilet is broken. Please fix the toilet seat",
    title: "Toilet",
    location: Faker::Address.secondary_address
  )
  project.save!
end

puts 'Creating 2 fake tasks...'

2.times do
  task = Task.new(
    project_id: @project_ids.sample,
    title: "",
    description: "Buy toilet seat.",
    assigned_to: "",
    status: false,
    deadline: @date
  )
  task.save!
end




puts 'Seeding finished!'
