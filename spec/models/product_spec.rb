require 'rails_helper'

describe Product do
  before :each do
    Product.destroy_all
  end

  it { should have_many(:reviews)}
  # All fields should be filled out.
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }

  # All products are automatically titleized (first letter of each word capitalized) before they are saved to the database.
  it("titleizes the name of a product") do
    product = FactoryBot.create(:product, name: "gala apples")
    expect(product.name).to eq "Gala Apples"
  end
end
