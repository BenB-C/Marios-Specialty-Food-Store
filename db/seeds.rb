# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Your project should include seed data for 50 products and 250 reviews. Use Faker with a loop to seed the database.

# Review.destroy_all
User.destroy_all
Product.destroy_all

# Seed products
number_of_products = 50
number_of_products.times do
  Product.create!(name: Faker::Food.unique.ingredient,
                  cost: Faker::Commerce.price(range: 0..100.0),
                  country_of_origin: Faker::Address.country)
end
p "#{Product.count} out of #{number_of_products} products created"
# Seed users
number_of_users = 50
number_of_users.times do
  user_name = Faker::FunnyName.name
  User.create!(name: user_name,
               email: Faker::Internet.unique.safe_email(name: user_name),
               password:  Faker::Internet.password(min_length: 6))
end
p "#{User.count} out of #{number_of_users} users created"
test_user = User.create!(name: "Test User", email: "test@foo", password: "123456")
if test_user.save
  p "Test user created. email: #{test_user.email}, password: #{test_user.password}"
end
# Seed reviews
users = User.all
products = Product.all
number_of_reviews = 250
number_of_reviews.times do
  body_length = rand(50..250)
  Review.create!(product_id: products.sample.id,
                 user_id: users.sample.id,
                 content_body: Faker::Hipster.paragraph_by_chars(characters: body_length, supplemental: false),
                 rating: Faker::Number.between(from: 1, to: 5))
end
p "#{Review.count} out of #{number_of_reviews} reviews created"
