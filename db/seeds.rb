# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



def time_rand 
    from = Time.now + rand(5..100)*86400
    to = from + rand(5..100)*86400
    return [Time.at(from), Time.at(to)]
end

User.all.each do |user|
  user.destroy!
end
puts "All Users destroyed!"

# Pet.all.each do |pet|
#   pet.destroy!
# end
# puts "All Pets destroyed!"

# Offer.all.each do |offer|
#   offer.destroy!
# end
# puts "All Offers destroyed!"

locations_array = ["Apolda", "Berlin", "Hamburg", "Trier", "Potsdam", "Erfurt", "Frankfurt", "Leipzig", "München", "Dresden", "Stuttgart", "Weimar", "Jena", "Chemnitz", "Flensburg", "Bamberg", "Bochum", "Dortmund", "Mainz", "Hannover", "Waren", "Saarbrücken"]
pets_array = ["Dog", "Cat", "Crocodile", "Rat", "Tiger", "Perrot", "Panda"]
puts "Creating Users with pets and offers..."
3.times do 
  user = User.new(email: Faker::Internet.email)
  user.password = "123456"
  user.save!
  rand(1..4).times do
    species = pets_array.sample
    pet = Pet.new(user: user, name: Faker::TvShows::StarTrek.character, species: species, description: Faker::TvShows::BojackHorseman.quote, location: locations_array.sample)
    pet.picture.attach(io: File.open("db/seed_images/#{species.downcase}.jpg"), filename: 'dog.jpg', content_type: 'image/jpg')
    pet.save!
    sleep(1)
    rand(1..3).times do
      time_period = time_rand
      offer = Offer.new(pet: pet, start_date: time_period[0], end_date: time_period[1])
      offer.save!
    end
  end
end

puts "Users created with pets and offers"




# 10.times do

# end