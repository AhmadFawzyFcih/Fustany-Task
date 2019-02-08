# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FavoriteProduct.destroy_all
Product.destroy_all
Category.destroy_all
User.destroy_all

user_1     = User.create({ name: "user one" , email: "user1@gmail.com" , password: 123456 })
user_2     = User.create({ name: "user two" , email: "user2@gmail.com" , password: 123456 })

category_1 = Category.create({ name: "category one" })
category_2 = Category.create({ name: "category two" })


products = Product.create([
    { user_id: user_1.id , category_id: category_1.id , name: "Valentine Day" , description: "Azza Fahmy wants us to start seeing love differently by saying “It's not complicated”, highlighting that love is a simple, yet deep feeling. Make of it what you want and if you feel it towards someone at a certain point in time, show them you love them and don‟t." } , 
    { user_id: user_2.id , category_id: category_2.id , name: "DIY a Photography " , description: "One specific video that caught my attention was the one we're talking about today, which is how you can DIY a mini studio background at home. Seeing how incredible the images came out really inspired me, and it shows how there are no limitations or any reason." } , 
    { user_id: user_1.id , category_id: category_2.id , name: "Running out of Time?" , description: "There are only a few days left until Valentine's Day, and you're probably wracking your brain for cute gift ideas to buy him. But what if he's an Aquarius? Or what if you just celebrated your anniversary and your bank account is crying for help this month?  " }  ,
    { user_id: user_1.id , category_id: category_2.id , name: "No Matter What Type of Couple You Are" , description: "Married couples tend to get caught up at work, and sometimes they just don’t have the time or energy for a fancy date night with each other. Valentine's Day can be a reminder for anyone to take a few hours off, and spend some much needed." }  
])

p "Created #{User.count} users"
p "Created #{Category.count} categories"
p "Created #{Product.count} products"