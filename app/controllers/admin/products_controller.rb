class Admin::ProductsController < ApplicationController
  before_filter :require_is_admin
  layout 'admin'
  
  before_filter :findClass
  
  def findClass
    @productclass = Productclass.find(params[:productclass_id])
  end

  def index
    @products = @productclass.products.order('created_at DESC').all
  end

  def show
    @product = @productclass.products.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  def edit
    @product = @productclass.products.find(params[:id])
    @photo = Productphoto.new
  end

  #create photo
  def createPhoto
    @product = Product.find(params[:product_id])
    @photo = @product.productphotos.new(params[:productphoto])

    respond_to do |format|
      if @photo.save
        #format.html { redirect_to photos.path } #index.html.erb
        format.json { render json: @photo, status: :created, location: @photo }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroyPhoto
    @photo = Productphoto.find(params[:id])
    #File.delete("/public" + @photo.image) #carrierwave will handle this.
    @photo.destroy

    respond_to do |format|
          #format.html { redirect_to :controller => 'photos', :action => 'index' }
          format.js
          format.json { head :no_content }
      end
  end

  def create
    @product = @productclass.products.new(params[:product])
    
    respond_to do |format|
      if @product.save
        format.html { redirect_to edit_admin_productclass_product_path(@productclass, @product, :locale => I18n.locale), notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @product = @productclass.products.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to admin_productclass_product_path(@productclass, @product, :locale => I18n.locale), notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product = @productclass.products.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to admin_productclass_products_path(@productclass, :locale => I18n.locale)}
      format.json { head :no_content }
    end
  end
end
