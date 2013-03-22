#encoding: utf-8
class Category < ActiveRecord::Base
  attr_accessible :content, :status, :title, :image
  
  translates :title, :content, :image
  
  accepts_nested_attributes_for :translations
  
  Translation.mount_uploader :image, CategoryCoverUploader
  
  #mount_uploader :image, CategoryCoverUploader
  
end
