# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin_user = User.create(name: "test name", email: "testname@gmail.com", password: "123456789", 
password_confirmation: "123456789", is_admin: true)

5.times do 
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "123456789",
    password_confirmation: "123456789"
  )
end 

users = User.all 
users.each do |user|
  post = user.posts.build(content: Faker::Lorem.sentence)
  post.save
end 


posts = Post.all 
posts.each do |post|
  post.comments.build(user: users.sample, content: Faker::Lorem.sentence)
  post.save
end 