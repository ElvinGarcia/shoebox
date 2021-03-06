# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do 
    user = User.new
    user.name = Faker::Name.unique.name
    user.email = Faker::Internet.unique.email
    user.password = "password" 
    user.activated = true
    user.activated_at = Time.zone.now
    user.save
    user.posts.create(title: Faker::Book.unique.title, description: Faker::Quote.unique.most_interesting_man_in_the_world, date: Faker::Date.backward)  
end

# admin sample creation
    admin = User.create!(name: "admin", email: "admin@admin.com", password: "password", admin: true, activated: true, activated_at: Time.zone.now )
    admin.budgets.create(category:"Take Out",amount:"100",balance: "100")
    admin.budgets.create(category:"Transportation",amount:"200",balance: "200")
    admin.budgets.create(category:"Utilities",amount:"300",balance: "300")
12.times do
    admin.posts.create(title: Faker::Book.unique.title, description: Faker::Quote.unique.most_interesting_man_in_the_world, date: Faker::Date.backward)  
end