# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require_relative 'seeds_helper'

# Categories
%w[Клавиши Двери Лужи].each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

# Users
User.find_or_create_by(email: 'pochta@pochta.com') do |user|
  user.password = '123456'
end

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

# Posts
users = User.all
users.each do |user|
  rand(0..2).times do
    user.posts.create!(
      title: Faker::Lorem.paragraph_by_chars(number: rand(Post.title_length_range)),
      body: Faker::Lorem.paragraph_by_chars(number: rand(Post.body_length_range)),
      category: Category.all.sample
    )
  end
end

# Comments
posts = Post.all
posts.each do |post|
  SeedsHelper.create_comment_replies(post, users, 5)
end
