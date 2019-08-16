require 'rails_helper'

describe "product paths" do
  before :each do
    Product.destroy_all
  end

  describe "products_path" do
    it "shows all products if params[:usa] is nil" do
      usa_product1 = FactoryBot.create(:product, name: "usa product 1", country_of_origin: "USA")
      usa_product2 = FactoryBot.create(:product, name: "usa product 2", country_of_origin: "United States of America")
      mexico_product = FactoryBot.create(:product, name: "mexico product", country_of_origin: "Mexico")
      visit products_path
      expect(page).to have_content usa_product1.name
      expect(page).to have_content usa_product2.name
      expect(page).to have_content mexico_product.name
    end

    it "shows all products if params[:usa] is not true" do
      usa_product1 = FactoryBot.create(:product, name: "usa product 1", country_of_origin: "USA")
      usa_product2 = FactoryBot.create(:product, name: "usa product 2", country_of_origin: "United States of America")
      mexico_product = FactoryBot.create(:product, name: "mexico product", country_of_origin: "Mexico")
      visit products_path(usa: false)
      expect(page).to have_content usa_product1.name
      expect(page).to have_content usa_product2.name
      expect(page).to have_content mexico_product.name
    end

    it "shows only products made in the usa if params[:usa] is 'true'" do
      usa_product1 = FactoryBot.create(:product, name: "usa product 1", country_of_origin: "USA")
      usa_product2 = FactoryBot.create(:product, name: "usa product 2", country_of_origin: "United States of America")
      mexico_product = FactoryBot.create(:product, name: "mexico product", country_of_origin: "Mexico")
      visit products_path(usa:true)
      expect(page).to have_content usa_product1.name
      expect(page).to have_content usa_product2.name
      expect(page).not_to have_content mexico_product.name
    end
  end

  describe "add a product link" do
    it "creates a new product" do
      visit products_path
      click_link "Add a product"
      fill_in "Name", with: "Artichokes"
      fill_in "Cost", with: "3.99"
      fill_in "Country of origin", with: "Guatemala"
      click_on "Create Product"
      expect(page).to have_content "Artichokes"
    end

    it "displays an error message if an input is missing" do
      visit products_path
      click_link "Add a product"
      click_on 'Create Product'
      expect(page).to have_content "Could not save new product!"
      expect(page).to have_content "Name can't be blank"
      expect(page).to have_content "Cost can't be blank"
      expect(page).to have_content "Country of origin can't be blank"
    end
  end

  describe "edit product link" do
    it "allows a product to be edited" do
      product = FactoryBot.create(:product)
      visit product_path(product)
      click_link "Edit product"
      new_name = "Everlasting Gobstoppers"
      new_cost = 99.99
      new_country = "Loompaland"
      fill_in "Name", with: new_name
      fill_in "Cost", with: new_cost
      fill_in "Country of origin", with: new_country
      click_on "Update Product"
      expect(page).to have_content new_name
      expect(page).to have_content new_cost
      expect(page).to have_content new_country
    end

    it "displays an error message if an input is missing" do
      product = FactoryBot.create(:product)
      visit product_path(product)
      click_link "Edit product"
      fill_in "Name", with: ""
      fill_in "Cost", with: ""
      fill_in "Country of origin", with: ""
      click_on "Update Product"
      expect(page).to have_content "Name can't be blank"
      expect(page).to have_content "Cost can't be blank"
      expect(page).to have_content "Country of origin can't be blank"    end
  end

  describe "delete product link" do
    it "deletes the product" do
      product = FactoryBot.create(:product)
      visit product_path(product)
      click_link "Delete product"
      click_link "NO"
      expect(page).to have_content product.name
      click_link "Delete product"
      click_link "YES"
      expect(page).not_to have_content product.name
    end
  end

end
