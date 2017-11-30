# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first

User.destroy_all
Project.destroy_all
Task.destroy_all


client_one = User.create!(
  :email => "client@user.de",
  :password => "123456",
  :handy => false,
)

client_two = User.create!(
  :email => "client2@user.de",
  :password => "123456",
  :handy => false,
)

handy = User.create!(
  :email => "handy@user.de",
  :password => "123456",
  :handy => true,
)

p1= Project.create!(
  :address => "Berliner Allee",
  :status => false,
  :description => "Repair Toilet",
  :title => "Toilet",
  :client_id => client_one.id,
  :handy_id => handy.id,
  )

p2 = Project.create!(
  :address => "Frankfurter Allee",
  :status => false,
  :description => "Set up kitchen",
  :title => "Kitchen",
  :client_id => client_two.id,
  :handy_id => handy.id,
  )

t1 = Task.create!(
  :description => "abcdefgh",
  :status => false,
  :project_id => p1.id
  )

t2 = Task.create!(
  :description => "jhagdfjhlafgsdhj",
  :status => false,
  :project_id => p1.id
  )

t3 = Task.create!(
  :description => "lkahflk",
  :status => true,
  :project_id => p1.id
  )

t4 = Task.create!(
  :description => "a,jbdakjs",
  :status => true,
  :project_id => p1.id
  )

t5 = Task.create!(
  :description => "kahdflksh",
  :status => false,
  :project_id => p1.id
  )

t1 = Task.create!(
  :description => "abcdefgh",
  :status => false,
  :project_id => p2.id
  )

t2 = Task.create!(
  :description => "jhagdfjhlafgsdhj",
  :status => true,
  :project_id => p2.id,
  )

t3 = Task.create!(
  :description => "lkahflk",
  :status => true,
  :project_id => p2.id
  )

t4 = Task.create!(
  :description => "a,jbdakjs",
  :status => true,
  :project_id => p2.id,
  )

t5 = Task.create!(
  :description => "kahdflksh",
  :status => false,
  :project_id => p2.id,
  )
