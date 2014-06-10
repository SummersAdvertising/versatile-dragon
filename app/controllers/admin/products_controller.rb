#encoding: utf-8
class Admin::ProductsController < ApplicationController
  before_filter :require_is_admin
  before_filter :find_product, :except => [:create, :destroyPhoto]
  before_filter :new_productphoto, :only => [:edit, :edit_intro, :edit_point, :edit_form, :edit_size, :edit_wrap, :edit_wash, :edit_outro]
  layout 'admin'

  def show
    @photos = Productphoto.where("img_type in ('detail', 'color', 'point', 'form', 'wrap', 'wash') AND product_id = #{@product.id}").all

    @photos_detail = @photos.select { |photo| photo.img_type == 'detail' }
    @photos_color = @photos.select { |photo| photo.img_type == 'color' }
    @photos_point = @photos.select { |photo| photo.img_type == 'point' }
    @photos_form = @photos.select { |photo| photo.img_type == 'form' }
    @photos_wrap = @photos.select { |photo| photo.img_type == 'wrap' }
    @photos_wash = @photos.select { |photo| photo.img_type == 'wash' }
    
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
    params[:product] = params[:product] || Hash.new
    params[:product][:description] = params[:product][:description].to_json unless(params[:product][:description].blank?)
    params[:product][:content_point] = params[:product][:content_point].to_json unless(params[:product][:content_point].blank?)
    params[:product][:content_form] = params[:content_form].to_json unless(params[:content_form].blank?)

    case params[:next_step]
    when "edit_intro"
      params[:next_step] = admin_productclass_subclass_product_edit_intro_path(params[:productclass_id], params[:subclass_id], @product, :locale => I18n.locale)
    when "edit_point"
      params[:next_step] = admin_productclass_subclass_product_edit_point_path(params[:productclass_id], params[:subclass_id], @product, :locale => I18n.locale)
    when "edit_form"
      params[:next_step] = admin_productclass_subclass_product_edit_form_path(params[:productclass_id], params[:subclass_id], @product, :locale => I18n.locale)
    when "edit_wrap"
      params[:next_step] = admin_productclass_subclass_product_edit_wrap_path(params[:productclass_id], params[:subclass_id], @product, :locale => I18n.locale)
    when "edit_size"
      params[:next_step] = admin_productclass_subclass_product_edit_size_path(params[:productclass_id], params[:subclass_id], @product, :locale => I18n.locale)
    when "edit_wash"
      params[:next_step] = admin_productclass_subclass_product_edit_wash_path(params[:productclass_id], params[:subclass_id], @product, :locale => I18n.locale)
    when "edit_outro"
      params[:next_step] = admin_productclass_subclass_product_edit_outro_path(params[:productclass_id], params[:subclass_id], @product, :locale => I18n.locale)
    else
      params[:next_step] = admin_productclass_subclass_product_path(params[:productclass_id], params[:subclass_id], @product, :locale => I18n.locale)
    end

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to params[:next_step] }
        format.js
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
    @photos = Productphoto.where("img_type in ('detail', 'color') AND product_id = #{@product.id}").all

    @photos_detail = @photos.select { |photo| photo.img_type == 'detail' }
    @photos_color = @photos.select { |photo| photo.img_type == 'color' }
  end

  def edit_point
    @photos_point = Productphoto.where("img_type = 'point' AND product_id = #{@product.id}").all

    @points = JSON.is_json?(@product.content_point) ? JSON.parse(@product.content_point) : Array.new
  end

  def edit_form
    @photos_form = Productphoto.where("img_type = 'form' AND product_id = #{@product.id}").all

    @forms = JSON.is_json?(@product.content_form) ? JSON.parse(@product.content_form)[0] : nil
  end

  def edit_wrap
    @photos_wrap = Productphoto.where("img_type = 'wrap' AND product_id = #{@product.id}").all
  end

  def edit_wash
    @photos_wash = Productphoto.where("img_type = 'wash' AND product_id = #{@product.id}").all
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
    @product = Product.includes([:subclass => :productclass]).find_by_id(params[:product_id] || params[:id])
  end

  def new_productphoto
    @photo = Productphoto.new
  end
end
