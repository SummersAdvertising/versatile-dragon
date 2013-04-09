class Productclass < ActiveRecord::Base
  has_many :products, :dependent => :destroy
  has_many :classphotos, :dependent => :destroy
  attr_accessible :content, :name, :frontshow, :addDate

  before_save :stamp_addDate
  
  translates :content, :name, :frontshow

  accepts_nested_attributes_for :translations

  Translation.mount_uploader :frontshow, ProductClassCoverUploader

  def frontshow
  	self.translation.frontshow
  end
  
  def frontshow=(value)
  	self.translation.frontshow = value
  end

  private
  def stamp_addDate
    if(self.addDate.blank?)

      self.addDate = DateTime.now
    end
  end
end