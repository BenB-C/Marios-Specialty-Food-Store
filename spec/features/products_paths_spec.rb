require 'rails_helper'

describe "#ProductsController" do
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
end
