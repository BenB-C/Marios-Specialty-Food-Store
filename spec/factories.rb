FactoryBot.define do
  factory :product do
    name { "Apples" }
    cost  { "1.99" }
    country_of_origin { "United States"}
  end

  factory :review do
    product_id { 1 }
    author  { "Douglas Adams" }
    content_body { "This is such an awesome product! I'm going to recommend it to all my friends!"}
    rating { 5 }
  end
end
