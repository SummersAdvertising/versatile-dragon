class Classphoto < ActiveRecord::Base
  belongs_to :productclass
  attr_accessible :image, :name, :productclass_id

  mount_uploader :image, ImageUploader  
  before_create :update_filename
  
  private
  def update_filename
  	self.name = image.file.filename
  end
end
