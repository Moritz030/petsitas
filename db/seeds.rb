# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

pets_array = ["Dog", "Cat", "Crocodile", "Rat", "Tiger", "Perrot", "Panda"]
puts "Creating Users with pets..."
3.times do 
  user = User.new(email: Faker::Internet.email)
  user.password = "123456"
  user.save!
  rand(1..4).times do
    species = pets_array.sample
    pet = Pet.new(user: user, name: Faker::TvShows::StarTrek.character, species: species, description: Faker::TvShows::BojackHorseman.quote, location: Faker::Address.city)
    pet.picture.attach(io: File.open("db/seed_images/#{species.downcase}.jpg"), filename: 'dog.jpg', content_type: 'image/jpg')
    pet.save!
  end
end

puts "Users created with pets"



# 10.times do

# end