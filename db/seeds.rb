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
addresses_array = [["Herbert-Lewin-Platz 1", "Berlin"], ["Jahnstr. 40", "Stuttgart"], ["Mühlbaurstr. 16", "München"], ["Friedrichstr. 16", "Berlin"], ["Dreifertstr. 12", "Cottbus"], ["Pappelallee 5", "Potsdam"], ["Schwachhauser Heerstr. 30", "Bremen"], ["Weidestr. 122 b", "Hamburg"], ["Im Vogelsgesang 3", "Frankfurt"], ["August-Bebel-Str. 9a", "Rostock"], ["Berliner Allee 20", "Hannover"], ["Tersteegenstr. 9", "Düsseldorf"], ["Deutschhausplatz 3", "Mainz"], ["Faktoreistr. 4", "Saarbrücken"], ["Schützenhöhe 16", "Dresden"], ["Doctor-Eisenbart-Ring 2", "Magdeburg"], ["Bismarckallee 8-12", "Bad Segeberg"], ["Im Semmicht 33", "Jena-Maua"], ["Gartenstr. 210-214", "Münster"], ["Tersteegenstr. 22", "Düsseldorf"], ["Deutschhausplatz 20", "Mainz"], ["Faktoreistr. 32", "Saarbrücken"], ["Schützenhöhe 2", "Dresden"], ["Doctor-Eisenbart-Ring 11", "Magdeburg"], ["Bismarckallee 23", "Bad Segeberg"], ["Im Semmicht 3", "Jena-Maua"], ["Gartenstr. 56", "Münster"]]
counter = 0
project_array = []


5.times do

  puts 'Creating 5 fake clients...'

  client = User.new(
    email: Faker::Internet.email,
    password: "123456",
    speciality: "",
    handy: false,
    first_name: Faker::Name.first_name,
    second_name: Faker::Name.last_name,
    avatar: "/assets/images/client.png",
    phone: "017322337722",
    status: ""
  )

  puts 'Creating 5 fake handies...'

  handy = User.new(
    email: Faker::Internet.email,
    password: "123456",
    speciality: "",
    handy: true,
    first_name: Faker::Company.name,
    second_name: Faker::Name.last_name,
    avatar: "/assets/images/handy.png",
    phone: "01737348572",
    status: ""
  )

  puts 'Creating 5 fake projects'

  5.times do
      project = Project.new(
        handy: handy,
        client: client,
        address: addresses_array[counter][0],
        city: addresses_array[counter][1],
        deadline: @date,
        status: true,
        description: Faker::Commerce.department(4),
        title: Faker::Job.field,
        location: Faker::Address.secondary_address,
        photo_urls: ["http://mestrayllana.at/wp-content/uploads/2013/07/kaputtbett.jpg"],
      )
      puts counter
      counter == 24 ? counter = 0 : counter +=1
      puts counter
    puts 'Creating 2 fake tasks'

    2.times do
        task = Task.new(
          project: project,
          title: "",
          description: "Buy #{Faker::Commerce.material}",
          assigned_to: "",
          status: true,
          deadline: @date
        )
        task.save!
    end
    project.save!
  end
  client.save!
  handy.save!
end



puts 'Seeding finished!'
