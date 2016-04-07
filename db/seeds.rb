require 'random_data'

 
 admin = User.create!(
   email:    'toddwoznyNew@yahoo.com',
   password: 'helloworld',
   role:     'admin'
 )
 
 # Create a member
 standard = User.create!(
   email:    'toddwoznyNew@gmail.com',
   password: 'helloworld'
 )
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

