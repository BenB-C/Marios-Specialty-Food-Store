require 'rails_helper'

describe "review paths" do
  before :each do
    Product.destroy_all
    User.destroy_all
  end

  describe "new_product_review_path" do
    it "adds a new review" do
      product = FactoryBot.create(:product)
      user = FactoryBot.create(:user, email: "123@4")
      visit root_path
      click_link "Login"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
      visit product_path(product)
      click_link "Add a review"
      new_rating = 5
      new_content = "This is my review. It needs to have at least 50 characters."
      fill_in "Rating", with: new_rating
      fill_in "Content body", with: new_content
      click_button "Create Review"
      expect(page).to have_content user.name
      expect(page).to have_content new_rating
      expect(page).to have_content new_content
    end
  end

end
