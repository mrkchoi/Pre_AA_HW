# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.new(username: 'mrkchoi')
u1.password = 'testing'
u1.save!

u2 = User.new(username: 'kennethichoi')
u2.password = 'testing'
u2.save!

u3 = User.new(username: 'testing')
u3.password = 'testing'
u3.save!
