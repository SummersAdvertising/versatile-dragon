class Product < ActiveRecord::Base
  belongs_to :productclass
  has_many :productphotos, :dependent => :destroy
  attr_accessible :content, :name, :productclass_id
  
  translates :content, :name
  
end
