# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'



# if Rails.env.development?
#   Chat_room.destroy_all
#   Message.destroy_all
#   User.destroy_all
#   Project.destroy_all
#   Task.destroy_all
# end

@date = rand(1.year).seconds.from_now

addresses_array = [["Herbert-Lewin-Platz 1", "Berlin"], ["Wörther Straße 26", "Berlin"], ["Charlottenstraße 60", "Berlin"], ["Gipsstraße 3", "Berlin"], ["
Chausseestraße 8", "Berlin"], ["Karl-Marx-Allee 33", "Berlin"], ["Warschauer Str. 74", "Berlin"], ["Gabriel-Max-Straße 4", "Berlin"], ["Neue Bahnhofstraße 21", "Berlin"], ["Revaler Str. 99", "Berlin"], ["Warschauer Str. 33", "Berlin"], ["Rykestraße 45", "Berlin"], ["Knaackstraße 30", "Berlin"], ["Knaackstraße 16", "Berlin"], ["Kollwitzstraße 54", "Berlin"], ["Kollwitzstraße 18", "Berlin"], ["Schwedter Str. 269", "Berlin"], ["Christinenstraße 24", "Berlin"], ["Schwedter Str. 2", "Berlin"], ["Straßburger Str. 16", "Berlin"], ["Straßburger Str. 7c", "Berlin"], ["Prenzlauer Allee 247", "Berlin"], ["Prenzlauer Allee 4", "Berlin"], ["Johannisstraße 20", "Berlin"], ["Jägerstraße 35", "Berlin"], ["Mohrenstraße 67-69", "Berlin"], ["Prinzenstraße 81", "Berlin"]]
phone_array = ["0032499319337", "0033762503843", "004915228937149", "004917632827239"]
counter = 0
title_counter = 0
project_hash = {
  toilet: {location: ["1st Floor", "2nd Floor", "3rd Floor"], photo_urls: ["app/assets/images/toilet.png"]},
  shower: {location: ["1st Floor", "2nd Floor", "3rd Floor"], photo_urls: ["app/assets/images/shower.jpg"]},
  bath: {location: ["1st Floor", "2nd Floor", "3rd Floor"], photo_urls: ["app/assets/images/bath.jpg"]},
  sink: {location: ["Kitchen"], photo_urls: ["app/assets/images/kitchen_sink.jpg"]},
  dishwasher: {location: ["Kitchen"], photo_urls: ["app/assets/images/dishwasher.jpg"]}
}

random = rand(0..2)
project_array = []
client_array = []







  puts 'Creating 5 fake clients...'

5.times do
  client_array << User.create(
    email: Faker::Internet.email,
    password: "123456",
    speciality: "",
    handy: false,
    first_name: Faker::Name.first_name,
    second_name: Faker::Name.last_name,
    avatar: "/assets/images/client.png",
    phone: phone_array.sample,
    status: ""
  )
end


  puts 'Creating 1 fake handy...'

  handy = User.create(
    email: Faker::Internet.email,
    password: "123456",
    speciality: "",
    handy: true,
    first_name: Faker::Company.name,
    second_name: Faker::Name.last_name,
    avatar: "https://kitt.lewagon.com/placeholder/users/ssaunier",
    phone: phone_array.sample,
    status: ""
  )


  puts 'Creating 5 fake projects'
  5.times do
      @title = project_hash.keys[title_counter]
      project = Project.create(
        handy: handy,
        client: client_array.sample,
        address: addresses_array[counter][0],
        city: addresses_array[counter][1],
        deadline: @date,
        status: true,
        description: "The #{@title} has stopped working since yesterday. There seems to be no water supply?",
        title: @title.capitalize,
        location: project_hash[@title][:location][random],
        photo_urls: project_hash[@title][:photo_urls]
      )
      counter == 24 ? counter = 0 : counter += 1
      title_counter == 4 ? title_counter = 0 : title_counter += 1

    puts 'Creating on fake task'


    task = Task.new(
      project: project,
      title: "",
      description: "Check water supply",
      assigned_to: "",
      status: true,
      deadline: @date
    )
    task.save!

  end

puts 'Seeding finished!'
