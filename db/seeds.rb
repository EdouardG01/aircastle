# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Castle.destroy_all
User.destroy_all
puts "creating database"

25.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'secret'
  )
  user.save!
end

12.times.with_index do |index|
  castle_image = File.open(Rails.root.join("db/fixtures/castles/castle#{index + 1}.jpg"))
  castle = Castle.new(
    name:  Faker::TvShows::GameOfThrones.house,
    description: Faker::TvShows::GameOfThrones.quote,
    address: Faker::TvShows::GameOfThrones.city,
    price_per_day: rand(10..20)
  )
  castle.photo.attach(io: castle_image, filename: "castle#{index + 1}.jpg")
  random_user = User.order(Arel.sql('RANDOM()')).first
  castle.user = random_user
  castle.save!
end


# create user
User.create!(first_name: 'julien', last_name: 'victor', email: 'julien@exemple.com', password: 'secret')

# user = User.create(first_name: 'Bob', last_name: 'Victor', email: 'bob@exemple.com', password: 'abcdef')

# castle = Castle.new(name: 'Castle1', description: 'Best castle', address: '2 rue du bois', price_per_day: 20, user: user)
# castle.photo.attach(io: castle_image_one, filename: 'castle1.jpg')
# castle.save!
