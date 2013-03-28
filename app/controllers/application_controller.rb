class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :location
  
  def location
    
  	if params[ :locale ]
  		I18n.locale = params[ :locale ]
  	end
  
  end

  def require_is_admin
  	unless(session[:admin])
  		redirect_to admin_log_in_path
  	end
  end
end
