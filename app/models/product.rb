class Product < ActiveRecord::Base
  belongs_to :productclass
  attr_accessible :content, :name, :productclass_id
end
