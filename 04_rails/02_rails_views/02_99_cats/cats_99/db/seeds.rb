# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

c1 = Cat.create!(birth_date: '1989/04/12', color: 'orange', name: 'Tabby', sex: 'M', description: 'Amazing cat!')
c2 = Cat.create!(birth_date: '1991/07/02', color: 'white', name: 'Smith', sex: 'M', description: 'My lil'' polar bear!')
c3 = Cat.create!(birth_date: '2000/10/01', color: 'brown', name: 'Brownie', sex: 'F', description: 'Tastes like chocolate')
c4 = Cat.create!(birth_date: '1976/03/29', color: 'black', name: 'Sam', sex: 'F', description: 'Sabrina would be proud')
c5 = Cat.create!(birth_date: '1969/01/13', color: 'yellow', name: 'Snoop', sex: 'M', description: 'Na na na na naaaa')
c6 = Cat.create!(birth_date: '2010/06/17', color: 'grey', name: 'Cheez', sex: 'F', description: 'I can haZ CHEESburger?')
c7 = Cat.create!(birth_date: '2003/02/28', color: 'orange', name: 'Chester', sex: 'M', description: 'Garfieldesque')
c8 = Cat.create!(birth_date: '2017/11/28', color: 'black', name: 'Turk', sex: 'M', description: 'Catsgiving')
c9 = Cat.create!(birth_date: '2015/12/25', color: 'brown', name: 'SantaCat', sex: 'F', description: 'Ho ho ho!')
c10 = Cat.create!(birth_date: '1990/08/05', color: 'grey', name: '90''s cat', sex: 'M', description: 'Just made it in!')