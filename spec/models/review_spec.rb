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

end
