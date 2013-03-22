class ProductsController < ApplicationController
  
  def show
  	@productclasses = Productclass.all
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

end
