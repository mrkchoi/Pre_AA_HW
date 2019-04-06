# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

###################################
# USERS
###################################

u1 = User.new(username: 'mrkchoi')
u1.password = 'testing'
u1.save!

u2 = User.new(username: 'kennethichoi')
u2.password = 'testing'
u2.save!

u3 = User.new(username: 'Schoolboy Q')
u3.password = 'testing'
u3.save!




###################################
# SUBS
###################################

s1 = Sub.create!(title: 'Popular', description: 'Most Popular Posts on Reddit', moderator_id: 1)
s2 = Sub.create!(title: 'World News', description: 'Breaking news from around the world', moderator_id: 2)
s3 = Sub.create!(title: 'Funny', description: 'Reddit''s largest humor depository', moderator_id: 3)
s4 = Sub.create!(title: 'TIL', description: 'Today I Learned', moderator_id: 1)
s5 = Sub.create!(title: 'Movies', description: 'News & Discussion about Major Motion Pictures', moderator_id: 2)
s6 = Sub.create!(title: 'Mildly Interesting', description: 'A place for things that are of slight interest.', moderator_id: 3)
s7 = Sub.create!(title: 'Technology', description: 'For all things technology.', moderator_id: 1)
s8 = Sub.create!(title: 'Bitcoin', description: 'Bitcoin - The Currency of the Internet', moderator_id: 2)
s9 = Sub.create!(title: 'MMA', description: 'A subreddit for all things Mixed Martial Arts.', moderator_id: 3)
s10 = Sub.create!(title: 'Documentaries', description: 'tl;dw', moderator_id: 1)
s11 = Sub.create!(title: 'Memes', description: 'Memes!', moderator_id: 2)
s12 = Sub.create!(title: 'CryptoCurrency', description: 'The official source for CryptoCurrency News, Discussion & Analysis.', moderator_id: 3)
s13 = Sub.create!(title: 'Cars', description: 'r/Cars - For Car Enthusiasts', moderator_id: 1)
s14 = Sub.create!(title: 'Food', description: 'Cooking, restaurants, recipes, food network, foodies, talk about it here!', moderator_id: 2)
s15 = Sub.create!(title: 'LPT', description: 'Tips that improve your life in one way or another.', moderator_id: 3)



###################################
# POSTS
###################################

50.times do 
  Post.create!(title: "#{Faker::Hipster.sentence}", url: "#{Faker::Internet.url}", content: "#{Faker::Hipster.paragraph}", author_id: rand(1..3))
end


###################################
# POST SUBS
###################################

100.times do
  PostSub.create!(post_id: rand(1..50), sub_id: rand(1..15))
end


###################################
# COMMENTS
###################################

# TOP LEVEL COMMENTS
300.times do
  Comment.create!(content: "#{Faker::Hipster.sentence}", author_id: rand(1..3), post_id: rand(1..50))
end

# SECOND LEVEL COMMENTS
300.times do
  Comment.create!(content: "#{Faker::Hipster.sentence}", author_id: rand(1..3), post_id: rand(1..50), parent_comment_id: rand(1..300))
end

# THIRD LEVEL COMMENTS

300.times do
  Comment.create!(content: "#{Faker::Hipster.sentence}", author_id: rand(1..3), post_id: rand(1..50), parent_comment_id: rand(301..600))
end