class ProductsController < ApplicationController
  
  def show
  	@productclasses = Productclass.with_translations(I18n.locale).all
    @productclass = Productclass.find(params[:productclass_id])
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

end
