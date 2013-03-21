class Productclass < ActiveRecord::Base
  has_many :products, :dependent => :destroy
  has_many :classphotos, :dependent => :destroy
  attr_accessible :content, :name, :frontshow
end
