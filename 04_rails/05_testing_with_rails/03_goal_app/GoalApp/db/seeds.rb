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
g3 = Goal.create!(user_id: 2, goal_content: 'Make peace', goal_type: 'public', completed: true)
g4 = Goal.create!(user_id: 2, goal_content: 'Gain independence', goal_type: 'private', completed: false)

uc1 = UserComment.create!(author_id: 1, user_id: 1, content: 'Great job!')
uc2 = UserComment.create!(author_id: 1, user_id: 2, content: 'Keep on going!')
uc3 = UserComment.create!(author_id: 2, user_id: 1, content: 'Inspired!')
uc4 = UserComment.create!(author_id: 2, user_id: 2, content: 'Namaste!')

gc1 = GoalComment.create!(author_id: 1, goal_id: 1, content: 'Goals is life')
gc2 = GoalComment.create!(author_id: 1, goal_id: 2, content: 'Goals')
gc3 = GoalComment.create!(author_id: 2, goal_id: 3, content: 'Great idea')
gc4 = GoalComment.create!(author_id: 2, goal_id: 4, content: 'Fantastic')
gc1 = GoalComment.create!(author_id: 1, goal_id: 1, content: 'Flyyyy')
gc2 = GoalComment.create!(author_id: 1, goal_id: 2, content: 'Fam up')
gc3 = GoalComment.create!(author_id: 2, goal_id: 3, content: 'Loud')
gc4 = GoalComment.create!(author_id: 2, goal_id: 4, content: 'Noted my friend')