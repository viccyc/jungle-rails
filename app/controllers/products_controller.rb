class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.find_by_product_id params[:id]
    @review = Review.new(product: @product)
    @user = current_user
  end

end
