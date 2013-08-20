class ProductsController < ApplicationController
  
  def show
  	@productclasses = Productclass.with_translations(I18n.locale).order("productclasses.addDate DESC, productclasses.created_at DESC").all
    @productclass = Productclass.find(params[:productclass_id])
    @products = @productclass.products.order("addDate DESC, created_at DESC").all
    @product = Product.find(params[:id])

    @askitem = Productasklist.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

end
