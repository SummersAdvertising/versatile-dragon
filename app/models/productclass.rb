class Productclass < ActiveRecord::Base
  has_many :products, :dependent => :destroy
  has_many :classphotos, :dependent => :destroy
  attr_accessible :content, :name, :frontshow
  
  translates :content, :name, :frontshow
  Translation.mount_uploader :frontshow, ProductClassCoverUploader
  
  def frontshow
  	self.translation.frontshow
  end
  
  def frontshow=(value)
  	self.translation.frontshow = value
  end
  
end
