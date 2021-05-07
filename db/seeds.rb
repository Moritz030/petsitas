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

locations_array = ["Leipziger Straße, Mitte, Berlin, 10117, Deutschland",
"Frankfurter Allee, Lichtenberg, Berlin, 10365, Deutschland",
"Turmstraße, Moabit, Mitte, Berlin, 10551, Deutschland",
"Storkower Straße, Fennpfuhl, Lichtenberg, Berlin, 10369, Deutschland",
"Waldstraße, Reinickendorf, Berlin, 13403, Deutschland",
"Chausseestraße, Wedding, Mitte, Berlin, 13353, Deutschland",
"Schloßstraße, Steglitz, Steglitz-Zehlendorf, Berlin, 12165, Deutschland",
"Uhlandstraße, Charlottenburg, Charlottenburg-Wilmersdorf, Berlin, 10623, Deutschland",
"Kantstraße, Charlottenburg, Charlottenburg-Wilmersdorf, Berlin, 10627, Deutschland",
"Alexanderplatz, Mitte, Berlin, 10178, Deutschland",
"Berlin Ostkreuz",
"Schloss Bellevue, 1, Spreeweg, Tiergarten, Mitte, Berlin, 10557, Deutschland",
"Friedrichstraße, Mitte, Berlin, 10117, Deutschland",
"Unter den Linden, Mitte, Berlin, 10117, Deutschland",
"Heinrich-Heine-Straße, Luisenstadt, Mitte, Berlin, 10179, Deutschland",
"Schlesisches Tor, Bevernstraße, Luisenstadt, Kreuzberg, Friedrichshain-Kreuzberg, Berlin, 10997, Deutschland",
"Hermannplatz, Reuterkiez, Neukölln, Berlin, 10967, Deutschland",
"Hermannstraße, Rollbergsiedlung, Neukölln, Berlin, 12051, Deutschland",
"Flughafenstraße, Schillerkiez, Neukölln, Berlin, 12049, Deutschland",
"Fennpfuhl, Lichtenberg, Berlin, 10369, Deutschland",
"Britz, Neukölln, Berlin, Deutschland",
"Berlin Südkreuz, Hildegard-Knef-Platz, Schöneberg, Tempelhof-Schöneberg, Berlin, 10829, Deutschland"]
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