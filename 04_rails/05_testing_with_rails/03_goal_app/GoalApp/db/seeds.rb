# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u1 = User.create!(username: 'mrkchoi',password: 'testing')
u2 = User.create!(username: 'kennethichoi',password: 'testing')

g1 = Goal.create!(user_id: 1, goal_content: 'Reach for the stars', goal_type: 'public', completed: false)
g2 = Goal.create!(user_id: 1, goal_content: 'Win win win win', goal_type: 'private', completed: true)
g1 = Goal.create!(user_id: 2, goal_content: 'Make peace', goal_type: 'public', completed: true)
g2 = Goal.create!(user_id: 2, goal_content: 'Gain independence', goal_type: 'private', completed: false)