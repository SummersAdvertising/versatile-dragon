class Subclass < ActiveRecord::Base
  has_many :products, :dependent => :destroy
  belongs_to :productclass

  attr_accessible :name, :productclass_id
end
