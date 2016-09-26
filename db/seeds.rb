# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'faker'

Category.delete_all
User.delete_all
Game.delete_all
Question.delete_all
Answer.delete_all
Result.delete_all

###############################
# SEQUENCE/ORDER IS IMPORTANT #
###############################

User.create!(
    first_name:"Shenesha",
    last_name:"Martinez",
    username:'studentuser',
    email:'student@devbootcamp.com',
    password:'123456',
    is_admin: false
  )

10.times do
User.create!(
    first_name:Faker::GameOfThrones.character,
    last_name:Faker::GameOfThrones.house,
    username:Faker::Internet.user_name,
    email:Faker::Internet.email,
    password:Faker::Internet.password,
    is_admin: true
  )
end

10.times do
Category.create!(
    name:Faker::Book.genre
  )
end


Game.create!(
    title:Faker::StarWars.quote,
    subject:Faker::Book.genre
  )

# TEST GAME - QUESTIONS
10.times do |x|
Question.create!(
    text:Faker::StarWars.quote,
    game_id: 1,
    category_id: x + 1
  )
end

# TEST GAME - ANSWERS
10.times do |x|
Answer.create!(
    text:Faker::StarWars.quote,
    question_id: x + 1
  )
end

10.times do |x|
Question.create!(
    text:Faker::StarWars.quote,
    game_id: x + 2, # skip game 1 (to avoid weirdness)
    category_id: x + 1
  )
end

10.times do |x|
Answer.create!(
    text:Faker::StarWars.quote,
    question_id: x + 11 # avoid 5 answers for first 10 questions
  )
end

10.times do |x|
Result.create!(
    is_correct: [true, false].sample,
    user_id:x + 1,
    question_id:x + 1,
    student_answer_id:x + 1,
  )
end
