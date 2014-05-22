#encoding: utf-8
class Productphoto < ActiveRecord::Base
  belongs_to :product
  attr_accessible :image, :name, :product_id, :img_type, :description, :is_cover

  mount_uploader :image, ImageUploader

  validate :count_within_limit, :on => :create
  
  before_create :update_filename
  after_create :set_cover
  after_destroy :subtract_cache
  
  private
  def count_within_limit
    return unless(["detail", "color", "point"].include?(self.img_type))

    @product = Product.find_by_id(self.product_id)
    return unless @product

    case self.img_type
    when "detail"
      errors.add("細節展示圖片張數", "最多5張") if @product.detail_count == 5
    when "color"
      errors.add("商品顏色圖片張數", "最多5張") if @product.color_count == 5
    when "point"
      errors.add("商品特色圖片張數", "最多6張") if @product.point_count == 6
    end
  end

  def update_filename
    if self.img_type.blank?
      self.img_type = "peditor"
    end

  	self.name = image.file.filename
  end

  def set_cover
    @product = Product.find_by_id(self.product_id)

    unless @product
      return      
    end
    
    case self.img_type
    when "detail"
      @product.detail_count += 1
    when "color"
      @product.color_count += 1
    when "point"
      @product.point_count += 1
    else
      return
    end

    if(self.is_cover)
      @product.cover_id = self.id
      @product.save
    else
      @product.save
    end
  end

  def subtract_cache
    @product = Product.find_by_id(self.product_id)

    unless @product
      return      
    end

    case self.img_type
    when "detail"
      @product.detail_count -= 1
    when "color"
      @product.color_count -= 1
    when "point"
      @product.point_count -= 1
    else
      return
    end

    @product.save
    
  end
end
