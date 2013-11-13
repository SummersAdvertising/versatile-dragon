class ProductclassesController < ApplicationController
  def index
  

    @productclasses = Productclass.with_translations(I18n.locale).with_products.order("productclasses.addDate DESC, productclasses.created_at DESC").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @productclasses }
    end
    
 
  
  
  end

  def show
  
    @productclass = Productclass.find(params[:id])
    @products = @productclass.products.order("addDate DESC, created_at DESC").all
    
=begin
    @productclasses = Productclass.with_translations(I18n.locale).order("productclasses.addDate DESC, productclasses.created_at DESC").all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @productclass }
    end
=end    

  redirect_to productclass_product_path( @productclass, @products.first, :locale => I18n.locale )
    
    
  end
end
