# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u1 = User.new(user_name: 'mrkchoi')
u1.password = 'backtrail'

u1.save!

c1 = Cat.create!(birth_date: '2018/12/23', color: 'brown', name: 'TABBIE', sex: 'F', description: 'Amazing cat!', user_id: 1)

r1 = CatRentalRequest.create!(cat_id: 1, start_date: '2019/02/01', end_date: '2019/02/02', user_id: 1)