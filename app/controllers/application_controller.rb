class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :location
  before_filter :count_cartitems
  
  def location
    
  	if params[ :locale ]
  		I18n.locale = params[ :locale ]
  	end
  
  end

  def count_cartitems

    if(cookies[:cart] && JSON.is_json?(cookies[:cart]) )
      @cart = JSON.parse(cookies[:cart])
      @cartitems_count = @cart[params[:locale]] ? @cart[params[:locale]].length : 0
    else
      cookies[:cart] = Hash.new
      @cartitems_count = 0
    end

  end

  def checkItem(checkItems)
    @askItems = Array.new
    @items = Product.includes([:subclass => :productclass]).where(:id => checkItems.map{ |item| item } ).all
    
    @items.each do |item|
      @askItems.push({:id => item.id ,:name => item.name, :path => productclass_subclass_product_path(item.subclass.productclass.id, item.subclass.id, item.id, :locale => params[:locale]) })
    end

    return @askItems
  end

  def require_is_admin
  	unless(session[:admin])
  		redirect_to admin_log_in_path
  	end
  end
end
