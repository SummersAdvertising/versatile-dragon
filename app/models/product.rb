class Product < ActiveRecord::Base
  belongs_to :subclass
  has_many :productphotos, :dependent => :destroy
  attr_accessible :name, :description, :content_size, :content_intro, :content_point, :content_form, :content_wrap, :content_wash, :content_outro, :subclass_id, :status, :addDate

  #delete the img diretory
  before_destroy :remember_id
  after_destroy :remove_id_directory
  
  translates :name, :description, :content_size, :content_intro, :content_point, :content_form, :content_wrap, :content_wash, :content_outro
  accepts_nested_attributes_for :translations

  before_save :stamp_addDate

  def get_column_content(name)
    JSON.is_json?(self[name]) ? JSON.parse(self[name]) : Array.new
  end

  private
  def stamp_addDate
    if(self.addDate.blank?)
      self.addDate = DateTime.now
    end
  end
  
  def remember_id
    @id = id
  end

  def remove_id_directory
    FileUtils.remove_dir("#{Rails.root}/public/uploads/Productphoto/#{@id}", :force => true)
  end
end
