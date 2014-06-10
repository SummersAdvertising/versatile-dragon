#encoding: utf-8
class Productask < ActiveRecord::Base
  attr_accessible :askermail, :askername, :askertel, :purpose, :status, :note, :askercompany, :country, :subject, :askamount, :purpose_customize, :purpose_other

  validates :askername, :askertel, :askermail, :purpose, :status, :askercompany, :country, :subject, :askamount, :presence => true
  validates :askermail, format: { with: /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9])+$/, message: "請輸入正確的email" }, :if => :is_email?
  validates :askertel, format: { with: /^[-()0-9 ]+$/, message: "請輸入正確的電話" }, :if => :is_tel?
  validates :askamount, numericality: { only_integer: true, greater_than_or_equal_to: 100 }

  has_many :productasklists, :dependent => :destroy

  def is_email?
    self.askermail && self.askermail.length > 0
  end
  
  def is_tel?
    self.askertel && self.askertel.length > 0
  end
end
