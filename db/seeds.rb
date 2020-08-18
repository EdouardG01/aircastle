require 'faker'

25.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name ,
    email: Faker::Internet.email
  )
  user.save!
end

12.times do
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


