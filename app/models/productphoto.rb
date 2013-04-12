class Productphoto < ActiveRecord::Base
  belongs_to :product
  attr_accessible :image, :name, :product_id

  mount_uploader :image, ImageUploader
  
  before_create :update_filename
  
  private
  def update_filename
  	self.name = image.file.filename
  end
end
