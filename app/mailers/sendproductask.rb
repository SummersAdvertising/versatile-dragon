#encoding: utf-8
class Sendproductask < ActionMailer::Base
  default from: "from@example.com"

  def sendmail(productask)
  	@productask = productask

  	mail(:to => [ @productask.askermail, "kobanae@summers.com.tw" ], :subject => "詢價單成立通知")
  end
end
