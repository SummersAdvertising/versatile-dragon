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
    if(cookies[:cart])
      begin
        @cartitems = JSON.parse(cookies[:cart])
        @cartitems_count = @cartitems.length
      rescue
        cookies[:cart] = nil
        @cartitems_count = 0
      end
    else
      @cartitems_count = 0
    end
  end

  def checkItem(checkItems)
    @askItems = Array.new
    @items = Product.where(:id => checkItems.keys ).all
    
    @items.each do |item|
      @askItems.push({:id => item.id ,:name => item.name, :class_id => item.productclass_id })
    end

    return @askItems
  end

  def require_is_admin
  	unless(session[:admin])
  		redirect_to admin_log_in_path
  	end
  end
end
