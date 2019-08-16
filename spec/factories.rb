FactoryBot.define do
  factory :product do
    name { "Apples" }
    cost  { "1.99" }
    country_of_origin { "United States"}
  end

  factory :review do
    product_id { Product.all[1] }
    user_id  { User.all[1].id }
    content_body { "This is such an awesome product! I'm going to recommend it to all my friends!"}
    rating { 5 }
  end

  factory :user do
    name { "FactorBot Generated User" }
    email { "fake@email" }
    password { "123456" }
  end
end
