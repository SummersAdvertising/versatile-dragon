class Productask < ActiveRecord::Base
  attr_accessible :askermail, :askername, :askertel, :purpose

  validates :askermail, :askername, :askertel, :purpose, :presence => true

  has_many :productasklist
end
