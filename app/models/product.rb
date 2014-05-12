class Product < ActiveRecord::Base
  belongs_to :subclass
  has_many :productphotos, :dependent => :destroy
  attr_accessible :content, :name, :productclass_id, :status, :addDate

  #delete the img diretory
  before_destroy :remember_id
  after_destroy :remove_id_directory
  
  translates :content, :name

  before_save :stamp_addDate

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
