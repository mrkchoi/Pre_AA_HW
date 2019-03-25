# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# USERS
user1 = User.create!(username: 'mrkchoi')
user2 = User.create!(username: 'cschoi')
user3 = User.create!(username: 'jkcyohan')
user4 = User.create!(username: 'chrischoi')
user5 = User.create!(username: 'jeannieschoi')

# POLLS
poll1 = Poll.create!(author_id: 1, title: 'Food')
poll2 = Poll.create!(author_id: 2, title: 'Cars')
poll3 = Poll.create!(author_id: 3, title: 'Places')
poll4 = Poll.create!(author_id: 4, title: 'Music')
poll5 = Poll.create!(author_id: 5, title: 'Colors')


# QUESTIONS

q1 = Question.create!(poll_id: 1, text: 'Favorite food?')
q2 = Question.create!(poll_id: 1, text: 'Last meal?')
q3 = Question.create!(poll_id: 2, text: 'Dream car?')
q4 = Question.create!(poll_id: 2, text: 'Favorite car?')
q5 = Question.create!(poll_id: 3, text: 'Next vacation destination?')
q6 = Question.create!(poll_id: 3, text: 'Favorite past trip?')
q7 = Question.create!(poll_id: 4, text: 'Favorite genre?')
q8 = Question.create!(poll_id: 4, text: 'Least favorite genre?')
q9 = Question.create!(poll_id: 5, text: 'Favorite color?')
q10 = Question.create!(poll_id: 5, text: 'Least favorite color?')

# ANSWER CHOICES

a1 = AnswerChoice.create!(question_id: 1, text: 'Pizza')
a2 = AnswerChoice.create!(question_id: 1, text: 'Sushi')
a3 = AnswerChoice.create!(question_id: 1, text: 'Korean')
a4 = AnswerChoice.create!(question_id: 2, text: 'Omakase')
a5 = AnswerChoice.create!(question_id: 2, text: 'Homecooked Meal')
a6 = AnswerChoice.create!(question_id: 2, text: 'Lasagna')
a7 = AnswerChoice.create!(question_id: 3, text: 'Mclaren')
a8 = AnswerChoice.create!(question_id: 3, text: 'Porsche')
a9 = AnswerChoice.create!(question_id: 3, text: 'BMW')
a10 = AnswerChoice.create!(question_id: 4, text: 'Tesla P100D')
a11 = AnswerChoice.create!(question_id: 4, text: 'Mustang GT')
a12 = AnswerChoice.create!(question_id: 4, text: '911 GT3RS')
a13 = AnswerChoice.create!(question_id: 5, text: 'Hawaii')
a14 = AnswerChoice.create!(question_id: 5, text: 'Germany')
a15 = AnswerChoice.create!(question_id: 5, text: 'Belize')
a16 = AnswerChoice.create!(question_id: 6, text: 'Paris')
a17 = AnswerChoice.create!(question_id: 6, text: 'London')
a18 = AnswerChoice.create!(question_id: 6, text: 'Korea')
a19 = AnswerChoice.create!(question_id: 7, text: 'Classical')
a20 = AnswerChoice.create!(question_id: 7, text: 'Hip-Hop')
a21 = AnswerChoice.create!(question_id: 7, text: 'Rock')
a22 = AnswerChoice.create!(question_id: 8, text: 'Techno')
a23 = AnswerChoice.create!(question_id: 8, text: 'Country')
a24 = AnswerChoice.create!(question_id: 8, text: 'Pop')
a25 = AnswerChoice.create!(question_id: 9, text: 'Black')
a26 = AnswerChoice.create!(question_id: 9, text: 'Red')
a27 = AnswerChoice.create!(question_id: 9, text: 'Grey')
a28 = AnswerChoice.create!(question_id: 10, text: 'Green')
a29 = AnswerChoice.create!(question_id: 10, text: 'Yellow')
a30 = AnswerChoice.create!(question_id: 10, text: 'Orange')

# RESPONSES

r1 = Response.create!(user_id: 1, answer_choice_id: 8)
r2 = Response.create!(user_id: 1, answer_choice_id: 12)
r3 = Response.create!(user_id: 1, answer_choice_id: 20)
r4 = Response.create!(user_id: 1, answer_choice_id: 23)

r5 = Response.create!(user_id: 2, answer_choice_id: 14)
r6 = Response.create!(user_id: 2, answer_choice_id: 18)
r7 = Response.create!(user_id: 2, answer_choice_id: 27)
r8 = Response.create!(user_id: 2, answer_choice_id: 29)

r9 = Response.create!(user_id: 3, answer_choice_id: 3)
r10 = Response.create!(user_id: 3, answer_choice_id: 5)
r11 = Response.create!(user_id: 3, answer_choice_id: 21)
r12 = Response.create!(user_id: 3, answer_choice_id: 22)

r13 = Response.create!(user_id: 4, answer_choice_id: 9)
r14 = Response.create!(user_id: 4, answer_choice_id: 10)
r15 = Response.create!(user_id: 4, answer_choice_id: 15)
r16 = Response.create!(user_id: 4, answer_choice_id: 16)

r17 = Response.create!(user_id: 5, answer_choice_id: 14)
r18 = Response.create!(user_id: 5, answer_choice_id: 18)
r19 = Response.create!(user_id: 5, answer_choice_id: 19)
r20 = Response.create!(user_id: 5, answer_choice_id: 22)