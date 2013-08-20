class Productasklist < ActiveRecord::Base
  attr_accessible :product_id, :productask_id, :productname

  validates :product_id, :productask_id, :productname, :presence => true

  belongs_to :productask
end
