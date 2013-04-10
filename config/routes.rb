VersatileDragon::Application.routes.draw do
	get "/" => redirect("/zh_TW")
	scope ':locale', :locale => /en|zh_TW|zh_CN/ do
		get "/about" => "staticpage#about"
		get "/partner" => "staticpage#partner"
		get "/contact" => "staticpage#contact"

		resources :productclasses, :only => [:index, :show] do
			resources :products, :only => :show
		end

		match "/admin/createAdmin" => "admin#createAdmin", :via => :post
		match "/admin/loginCheck" => "admin#loginCheck", :via => :post
		match "/admin/update" => "admin#update", :via => :put
		match "/admin/deleteAdmin/:id" => "admin#destroy", :via => :delete

		namespace :admin do
			get "showAdmins", "log_in", "log_out", "edit"
			get "/" => "indexlinks#index"

			resources :indexlinks
			resources :productclasses do
				match 'uploadPhoto' => 'productclasses#createPhoto', :via => [:post]
				match 'deletePhoto/:id' => 'productclasses#destroyPhoto', :via => [:delete]

				resources :products, :except => [:new] do
					match 'uploadPhoto' => 'products#createPhoto', :via => [:post]
					match 'deletePhoto/:id' => 'products#destroyPhoto', :via => [:delete]
				end
			end
		end

		root :to => "staticpage#index"
	end
end
