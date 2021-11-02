# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
25.times do
  User.create!(username: Faker::Internet.username)
end

User.all.each do |user|
  5.times do
    user.posts.create!(content: Faker::Lorem.paragraph(sentence_count: (5..10).to_a.sample))
  end
end

Post.all.each do |post|
  25.times do
    post.comments.create!(content: Faker::Lorem.paragraph(sentence_count: (2..3).to_a.sample), user: User.all.sample)
  end
end