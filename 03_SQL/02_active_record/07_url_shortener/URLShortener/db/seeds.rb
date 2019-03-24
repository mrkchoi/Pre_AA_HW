# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)






user1 = User.create!(email: 'kennethichoi@gmail.com')
user2 = User.create!(email: 'testy123@yahoo.com')
user3 = User.create!(email: 'deborah_q@hotmail.com')

url1 = ShortenedURL.create_shortened_url_from_user_and_long_url(User.find(1), "https://www.youtube.com")
url2 = ShortenedURL.create_shortened_url_from_user_and_long_url(User.find(2), "https://www.techcrunch.com")
url3 = ShortenedURL.create_shortened_url_from_user_and_long_url(User.find(3), "https://www.medium.com")
url4 = ShortenedURL.create_shortened_url_from_user_and_long_url(User.find(1), "https://www.vimeo.com")
url5 = ShortenedURL.create_shortened_url_from_user_and_long_url(User.find(2), "https://www.flipboard.com")
url6 = ShortenedURL.create_shortened_url_from_user_and_long_url(User.find(3), "https://open.appacademy.io")


topic1 = TagTopic.create!(name: 'Videos')
topic2 = TagTopic.create!(name: 'News')
topic3 = TagTopic.create!(name: 'Education')


tagging1 = Tagging.create!(url_id: 1, topic_id: 1)
tagging2 = Tagging.create!(url_id: 2, topic_id: 2)
tagging3 = Tagging.create!(url_id: 3, topic_id: 3)
tagging4 = Tagging.create!(url_id: 4, topic_id: 1)
tagging5 = Tagging.create!(url_id: 5, topic_id: 2)
tagging6 = Tagging.create!(url_id: 6, topic_id: 3)

tagging1 = Tagging.create!(url_id: 2, topic_id: 3)
tagging2 = Tagging.create!(url_id: 3, topic_id: 2)
tagging3 = Tagging.create!(url_id: 4, topic_id: 1)
tagging4 = Tagging.create!(url_id: 5, topic_id: 3)
tagging5 = Tagging.create!(url_id: 6, topic_id: 2)
tagging6 = Tagging.create!(url_id: 1, topic_id: 1)


visit1 = Visit.record_visit!(User.find(1), ShortenedURL.find(1))
visit2 = Visit.record_visit!(User.find(2), ShortenedURL.find(2))
visit3 = Visit.record_visit!(User.find(3), ShortenedURL.find(3))
visit4 = Visit.record_visit!(User.find(1), ShortenedURL.find(4))
visit5 = Visit.record_visit!(User.find(2), ShortenedURL.find(5))
visit6 = Visit.record_visit!(User.find(3), ShortenedURL.find(6))
visit7 = Visit.record_visit!(User.find(3), ShortenedURL.find(1))
visit8 = Visit.record_visit!(User.find(2), ShortenedURL.find(1))
visit9 = Visit.record_visit!(User.find(1), ShortenedURL.find(2))
visit10 = Visit.record_visit!(User.find(3), ShortenedURL.find(2))
visit11 = Visit.record_visit!(User.find(2), ShortenedURL.find(2))
visit12 = Visit.record_visit!(User.find(1), ShortenedURL.find(3))




# 


ShortenedURL.create_shortened_url_from_user_and_long_url(User.find(1), "https://www.amazon.com")
ShortenedURL.create_shortened_url_from_user_and_long_url(User.find(1), "https://www.cnet.com")
ShortenedURL.create_shortened_url_from_user_and_long_url(User.find(1), "https://www.bhphotovideo.com")
ShortenedURL.create_shortened_url_from_user_and_long_url(User.find(1), "https://www.huffpost.com")
ShortenedURL.create_shortened_url_from_user_and_long_url(User.find(1), "https://www.reddit.com")
ShortenedURL.create_shortened_url_from_user_and_long_url(User.find(2), "https://www.leetcode.com")