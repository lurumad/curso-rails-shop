class ProductsController < ApplicationController
  def index
    @product = Product.new
  	@products = Product.all
  end

  def create
  	@product = Product.new(product_params)
  	@product.registered_at = DateTime.now
  	if @product.save
  		redirect_to products_path, :notice => 'Your product has been succesfully created.'
    else
      redirect_to products_path, :notice => 'There was an error creating your product.'
    end
  end

  def show
    @product = Product.find params[:id]
  end

  def edit
  	@product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]
    if @product.update_attributes product_params
      redirect_to products_path, :notice => 'Your product has been succesfully updated.'
    else
      redirect_to :back, :notice => 'There was an error updating your product.'
    end
  end

  def destroy
    Product.destroy params[:id]
    redirect_to :back, :notice => 'Your product has been deleted'
  end
  
  private

  def product_params
  	params.require(:product).permit(:name, :description, :registered_at, :manufacturer, :stock)
  end
end
