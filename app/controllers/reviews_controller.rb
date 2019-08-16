class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @product.reviews.new(review_params)
    if @product.save
      flash[:notice] = "Review successfully added!"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Could not save new review!"
      render :new
    end
  end

  private
    def review_params
      params.require(:review).permit(:user_id, :rating, :content_body)
    end
end
