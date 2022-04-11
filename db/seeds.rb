# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "Seeding..."

User.create(
  email: 'test@test.com',
  name: 'Test',
  password: '123456',
  password_confirmation: '123456'
)

prng = Random.new

10.times do
  user = User.create(
    email: Faker::Internet.unique.email,
    name: Faker::Games::Pokemon.unique.name,
    password: '123456',
    password_confirmation: '123456'
  )
  5.times do
    length = prng.rand(1..40)
    post_body = Array.new(length, user.name).join(' ')
    Post.create!(
      title: Faker::Book.title,
      user_id: user.id,
      body: post_body
    )
  end
end

# Post.all.each do |post|
#   ActionText::RichText.create!(record_type: 'Post', record_id: post.id, name: 'content', body: Faker::Lorem.sentence)
# end


puts "Seeding Done."