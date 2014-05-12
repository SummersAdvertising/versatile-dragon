class Productclass < ActiveRecord::Base
  has_many :subclasses, :dependent => :destroy
  has_many :products, :through => :subclasses
  has_many :classphotos, :dependent => :destroy
  
  scope :with_products, joins( :products )
  
  attr_accessible :content, :name, :frontshow, :addDate

  before_save :stamp_addDate
  #delete the img diretory
  before_destroy :remember_id
  after_destroy :remove_id_directory
  
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

  def remember_id
    @id = id
    @products = Productclass.find(id).products
  end

  def remove_id_directory
    FileUtils.remove_dir("#{Rails.root}/public/uploads/Classphoto/#{@id}", :force => true)
    @products.each do |product|
      FileUtils.remove_dir("#{Rails.root}/public/uploads/Classphoto/#{product.id}", :force => true)
    end
  end
end