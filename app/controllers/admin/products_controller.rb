#encoding: utf-8
class Admin::ProductsController < ApplicationController
  before_filter :require_is_admin
  before_filter :find_product, :except => [:show, :create, :destroyPhoto]
  layout 'admin'

  def show
    @product = Product.with_translations(I18n.locale).find_by_id(params[:id])
  end

  def create
    @product = Product.new(:subclass_id => params[:subclass_id])
    
    respond_to do |format|
      if @product.save
        format.html { redirect_to edit_admin_productclass_subclass_product_path(params[:productclass_id], params[:subclass_id], @product, :locale => I18n.locale) }
      else
        format.html { redirect_to :back, :alert => "新增產品失敗" }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to admin_productclass_subclass_product_path(params[:productclass_id], params[:subclass_id], @product, :locale => I18n.locale) }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to admin_productclass_subclass_path(params[:productclass_id], params[:subclass_id], :locale => I18n.locale)}
    end
  end

  def edit
    @photo = Productphoto.new
  end

  #create photo
  def createPhoto
    @photo = @product.productphotos.new(params[:productphoto])
    @photo.save
    
    respond_to do |format|
      format.js
    end
  end

  def destroyPhoto
    @photo = Productphoto.find(params[:id])
    @photopath = "public/uploads/Productphoto/"+ @photo.product_id.to_s + "/" + @photo.id.to_s + "-" + @photo.name

    if(File.exist?(@photopath))
      File.delete(@photopath)
    end
        
    @photo.destroy

    respond_to do |format|
      format.js
    end
  end

  def find_product
    @product = Product.find_by_id(params[:id])
  end
end
