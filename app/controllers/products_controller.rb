class ProductsController < ApplicationController

  def index
    if params[:usa] == "true"
      @products = Product.made_in_usa
      @usa = true
    else
      @products = Product.all
      @usa = false
    end
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path
    else
      flash[:alert] = "Could not save new product!"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    @show_confirm_delete = params[:show_confirm_delete]
    render :show
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if params[:delete_confirmed]
      @product.destroy
      redirect_to products_path
    else
      redirect_to product_path(id: @product.id, show_confirm_delete: true)
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end

end
