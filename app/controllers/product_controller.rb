class ProductController < ApplicationController
  def new
  @product = Product.new
  end

  def index
    @products = Product.all
  end

  def show
  @product = Product.find(params[:id])
  end

  def load_products
    Product.import(params[:product][:file])
    redirect_to product_index_path
  end

  def download
    respond_to do |format|
      format.html
      format.csv{send_data Product.all.to_csv}
    end
  end

end
