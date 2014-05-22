#encoding: utf-8
class Sendproductask < ActionMailer::Base
	default from: "mailer@versatile_dragon.com.tw"

  def sendmail(productask)
  	@productask = productask

  	mail(:to => [ @productask.askermail, "kobanae@summers.com.tw" ], :subject => "[龍全] 詢價單成立通知")
  end
end
