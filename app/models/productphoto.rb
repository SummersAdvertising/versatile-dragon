class Productphoto < ActiveRecord::Base
  belongs_to :product
  attr_accessible :image, :name, :product_id, :img_type, :description

  mount_uploader :image, ImageUploader
  
  before_create :update_filename
  after_create :set_cover
  
  private
  def update_filename
  	self.name = image.file.filename
  end

  def set_cover
  	@product = Product.find_by_id(self.product_id)

  	if(@product && @product.cover_id.blank?)
  		@product.cover_id = self.id
  		@product.save
  	end
  end
end
