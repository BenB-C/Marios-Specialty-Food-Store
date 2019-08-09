class LandingPageController < ApplicationController
  def index
    @new_products = Product.three_most_recent
    @most_reviewed_product = Product.most_reviewed
    render :index
  end
end
