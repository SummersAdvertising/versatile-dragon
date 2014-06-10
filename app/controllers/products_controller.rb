class ProductsController < ApplicationController
  
  def show
    @productclasses = Productclass.with_translations(I18n.locale).order("productclasses.addDate DESC, productclasses.created_at DESC").all
  	@product = Product.includes([:subclass => :productclass]).find(params[:id])
    @askitem = Productasklist.new

    @photos = Productphoto.where("img_type in ('detail', 'color', 'point', 'form', 'wrap', 'wash') AND product_id = #{@product.id}").all

    @photos_detail = @photos.select { |photo| photo.img_type == 'detail' }
    @photos_color = @photos.select { |photo| photo.img_type == 'color' }
    @photos_point = @photos.select { |photo| photo.img_type == 'point' }
    @photos_form = @photos.select { |photo| photo.img_type == 'form' }
    @photos_wrap = @photos.select { |photo| photo.img_type == 'wrap' }
    @photos_wash = @photos.select { |photo| photo.img_type == 'wash' }
  end

end
