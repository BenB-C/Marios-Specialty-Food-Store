# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Your project should include seed data for 50 products and 250 reviews. Use Faker with a loop to seed the database.

# Review.destroy_all
Product.destroy_all

50.times do
  Product.create!(name: Faker::Food.unique.ingredient,
                  cost: Faker::Commerce.price(range: 0..100.0),
                  country_of_origin: Faker::Address.country)
end
250.times do
  product_id = Product.all.sample.id
  body_length = rand(50..250)
  Review.create!(product_id: product_id,
                  author: Faker::FunnyName.name,
                  content_body: Faker::Hipster.paragraph_by_chars(characters: body_length, supplemental: false),
                  rating: Faker::Number.between(from: 1, to: 5))
end
