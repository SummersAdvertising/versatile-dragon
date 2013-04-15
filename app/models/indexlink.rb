class Indexlink < ActiveRecord::Base
  attr_accessible :image, :link, :title, :titlesub, :ordernum, :fontcolor, :content
  
  translates :title, :link, :image
  
  accepts_nested_attributes_for :translations
  
  paginates_per 15

  Translation.mount_uploader :image, IndexlinkUploader
  
  
  def image
  	self.translation.image
  end
  
  def image=(value)  	
  	self.translation.image = value
  end
end