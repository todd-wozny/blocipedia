require 'random_data'

 
 5.times do
   User.create!(
 
   #name:     RandomData.random_name,
   email:    RandomData.random_email,
   password: RandomData.random_sentence
   )
 end
 users = User.all

 
 50.times do
 
   Wiki.create!(
     user:   users.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
   wikis = Wiki.all
   
   user = User.first
   user.update_attributes!(
   email: 'toddwozny@gmail.com', 
   password: 'helloworld'
 )
 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Wiki.count} wikis created"

