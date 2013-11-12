class ProductsController < ApplicationController

	before_filter :get_product_list

  def index    
  end
  
  def show
  	#@productclasses = Productclass.with_translations(I18n.locale).order("productclasses.addDate DESC, productclasses.created_at DESC").all
    #@productclass = Productclass.find(params[:productclass_id])
    #@products = @productclass.products.order("addDate DESC, created_at DESC").all
    begin
    	@product = Product.with_translations(I18n.locale).find(params[:id])
    rescue
    	redirect_to root_url
    	return
    end
    #@askitem = Productasklist.new

    respond_to do |format|
      if @product.status != 'enable'
      	format.html { redirect_to :index }
      else
	      format.html # show.html.erb
	      format.json { render json: @product }
	  end
    end
  end

private
  def get_product_list
  	@products = Product.with_translations(I18n.locale).where( :status => 'enable' ).order("addDate DESC, products.created_at DESC")
  end

end
