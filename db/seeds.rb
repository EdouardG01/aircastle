# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Creating 25 fake castels...'
25.times do
  castle = Castle.new(
    name:  Faker::Games::Pokemon.name,
    description: Faker::String.random,
    price: "#{Faker::Number.decimal(l_digits: 2)}€"

  )
  castle.save!
end
puts 'Finished creating 25 fake castels!'

puts 'Creating 50 fake users...'
50.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name ,
    email: Faker::Internet.email,
    address: Faker::Address.city,

  )
  user.save!
end
puts 'Finished creating 50 fake users!'
