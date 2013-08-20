class Productask < ActiveRecord::Base
  attr_accessible :askermail, :askername, :askertel, :purpose, :status

  validates :askermail, :askername, :askertel, :status, :presence => true

  has_many :productasklists
end
