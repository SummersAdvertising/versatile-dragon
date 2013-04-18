class Admin::ProductsController < ApplicationController
  before_filter :require_is_admin
  layout 'admin'
  
  before_filter :findClass
  
  def findClass
    @productclass = Productclass.find(params[:productclass_id])
  end

  def index
    @productclass = Productclass.with_translations(I18n.locale).find_by_id(params[:productclass_id])    
    if(@productclass)
      @products = @productclass.products.order("addDate DESC, created_at DESC").page(params[:page]).per(15)
    end
  end

  def show
    @product = @productclass.products.with_translations(I18n.locale).find_by_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  def edit
    @productclass = Productclass.with_translations(I18n.locale).find_by_id(params[:productclass_id])    
    if(@productclass)
      @product = @productclass.products.find_by_id(params[:id])
    end
    #@product = @productclass.products.find_by_id(params[:id])
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
    @photopath = "public/uploads/Productphoto/"+ @photo.product_id.to_s + "/" + @photo.id.to_s + "-" + @photo.name
    
    if(!File.exist?(@photopath))
      @photopath = "public/uploads/Productphoto/"+ @photo.product_id.to_s + "/" + @photo.name
    end
    File.delete(@photopath)
    
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
