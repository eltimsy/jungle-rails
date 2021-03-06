class ProductsController < ApplicationController

  # before_filter :authorize

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.where(product_id: params[:id]).order('created_at DESC')
    @review = Review.new()
  end

end
