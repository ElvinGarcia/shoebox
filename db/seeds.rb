# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do 
    user = User.new
    user.name = Faker::Name.unique.name
    user.email = Faker::Internet.unique.email
    user.password = "password" 
    user.activated = true
    user.activated_at = Time.zone.now
    user.save
    user.posts(title: Faker::Book.unique.title, description: Faker::Quote.unique.most_interesting_man_in_the_world, date: Faker::Date.backward)  
end

User.create!(name: "admin", email: "admin@admin.com", password: "password", admin: true, activated: true, activated_at: Time.zone.now )