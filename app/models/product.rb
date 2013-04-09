class Product < ActiveRecord::Base
  belongs_to :productclass
  has_many :productphotos, :dependent => :destroy
  attr_accessible :content, :name, :productclass_id, :status, :addDate
  
  translates :content, :name

  before_save :stamp_addDate

  private
  def stamp_addDate
    if(self.addDate.blank?)

      self.addDate = DateTime.now
    end
  end
  
end
