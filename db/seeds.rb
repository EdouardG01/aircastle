# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Reservation.destroy_all
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

descriptions = ["Un château haut en couleur qui vous permettra de partager de supers moments en famille", "Si vous avez une piscine, ce château répondra à vos attentes. Je l'ai utilisé pour plusieurs anniversaires. Location avec compresseur.", "A vous de choisir, ce château à tout les atouts pour passer des moments inoubliables.", "N'attendez plus! dès que vous aurez essayé ce château, vous ne pourrez plus vous en passer!", "Un chateau robuste et génial pour parents et enfants. Au top lors de soirées avec les collègues de travail.", "Choisir ce château, c'est l'adopter! Rien de tel qu'un week-end en famille à rebondir de joie! ce château répond à norme CE. Nous mettons à votre disposition un compresseur.", "Le château qui changera votre vie à tout jamais! Rebondir ne sera plus un problème pour vous. Ulra résitant, ce château répond à toutes les normes de sécurité en vigueur.",
  "Quoi de mieux que vivre un moment cool en famille. Barbecue, piscine, château... Ajouter du fun à vos week-end! Ce château sera vraiment à la hauteur de vos attentes.", "Mes enfants me répètent souvent que ce château est vraiment formidable. Sauter toute la journée avec ce chateau renforcé, sera la meilleure expérience que vous pourrez vivre.", "Château facile à mettre en place, temps de gonflage 30 min. Il sera idéal pour tout vos événements.", "Ce château et 'LE' château qu'il vous faut. Spacieux, coloré et fiable, il vous permettra de transformer vos weekend et vos vacances en pur moment de bonheur.", "Château fort, château d'eau ou château gonflable ? Choisissez THE château gonflable, le best des bests. Il est énorme 10m x 6m, il accueil aussi bien les enfants que les parents."]

12.times.with_index do |index|
  castle_image = File.open(Rails.root.join("db/fixtures/castles/castle#{index + 1}.jpg"))
  castle = Castle.new(
    name:  Faker::TvShows::GameOfThrones.house,
    description: descriptions[index],
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
User.create!(first_name: 'edouard', last_name: 'goisbault', email: 'edouard@exemple.com', password: 'secret')

# user = User.create(first_name: 'Bob', last_name: 'Victor', email: 'bob@exemple.com', password: 'abcdef')

# castle = Castle.new(name: 'Castle1', description: 'Best castle', address: '2 rue du bois', price_per_day: 20, user: user)
# castle.photo.attach(io: castle_image_one, filename: 'castle1.jpg')
# castle.save!
