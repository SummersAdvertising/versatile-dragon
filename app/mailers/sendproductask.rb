class Sendproductask < ActionMailer::Base
  default from: "from@example.com"

  def send(receiver, productask)
  	@productask = productask

  	mail(:to => [ receiver, "kobanae@summers.com.tw" ], :subject => "詢價單成立通知")
  end
end
