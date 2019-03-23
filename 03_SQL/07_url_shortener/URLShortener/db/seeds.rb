# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)






user1 = User.new(email: 'kennethichoi@gmail.com')
user2 = User.new(email: 'testy123@yahoo.com')
user3 = User.new(email: 'deborah_q@hotmail.com')

user1.save!
user2.save!
user3.save!


url1 = ShortenedURL.new(short_url: 'bit.ly/9123a87', submitted_by_user_id: 2)
url2 = ShortenedURL.new(short_url: 'bit.ly/83323a87', submitted_by_user_id: 2)
url3 = ShortenedURL.new(short_url: 'bit.ly/aaaa23a87', submitted_by_user_id: 3)
url4 = ShortenedURL.new(short_url: 'bit.ly/bbbca87', submitted_by_user_id: 4)

url1.save!
url2.save!
url3.save!
url4.save!