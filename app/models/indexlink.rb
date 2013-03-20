class Indexlink < ActiveRecord::Base
  attr_accessible :image, :link, :title, :ordernum
  
  paginates_per 15

  mount_uploader :image, ImageUploader
  
end
