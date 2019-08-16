require 'rails_helper'

describe Review do
  it { should belong_to(:product) }
  # All fields should be filled out, including rating.
  it { should validate_presence_of :product_id }
  it { should validate_presence_of :author }
  it { should validate_presence_of :content_body }
  it { should validate_presence_of :rating }
  # Rating can only be an integer between 1 and 5.
  it { should validate_inclusion_of(:rating).in_range(1..5) }
  # The review's content_body must be between 50 and 250 characters.
  it { should validate_length_of(:content_body).is_at_least(50).is_at_most(250) }

  it("has a product_id, author, content_body, and rating") do
    product = FactoryBot.create(:product)
    author = "Anonymous"
    content_body = "This is such an awesome product! I'm going to recommend it to all my friends!"
    rating = 5
    review = FactoryBot.create(:review, product_id: product.id, author: author, content_body: content_body, rating: rating)
    expect(review.product_id).to eq product.id
    expect(review.author).to eq author
    expect(review.content_body).to eq content_body
    expect(review.rating).to eq rating
  end
end
