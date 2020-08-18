# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

50.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name ,
    email: Faker::Internet.email
  )
  user.save!
end

25.times do
  castle = Castle.new(
    name:  Faker::Games::Pokemon.name,
    description: Faker::String.random,
    address: Faker::Address.city,
    price_per_day: rand(10..20)
  )
  random_user = User.order(Arel.sql('RANDOM()')).first

  castle.user = random_user

  castle.save!

end


