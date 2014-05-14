VersatileDragon::Application.routes.draw do
	get "/" => redirect("/zh_TW")
	get "/admin" => redirect("/zh_TW/admin")
	
	scope ':locale', :locale => /en|zh_TW|zh_CN/ do
		get "/about" => "staticpage#about"
		get "/partner" => "staticpage#partner"
		get "/contact" => "staticpage#contact"

		resources :productclasses, :only => [:index, :show] do
			resources :subclasses, :only => [:show] do
				resources :products, :only => [:show]
			end
		end

		resources :productasks, :only => [:new, :create] do
			collection do
				namespace :cart do
					match "add" => "cart#add" , :via => :post
					match ":product_id/delete" => "cart#delete" , :via => :delete, :as => "delete"
				end
			end
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

				resources :subclasses, :only => [:show, :create, :update, :destroy] do
					resources :products, :except => [:index, :new] do
						["intro", "point", "form", "wrap", "size", "wash", "outro"].each do |action|
							get "/edit/#{action}", to: "products#edit_#{action}"
						end

						match 'uploadPhoto' => 'products#createPhoto', :via => [:post]
						match 'deletePhoto/:id' => 'products#destroyPhoto', :via => [:delete]
					end
				end
			end

			resources :productasks, :only => [:index, :show, :destroy] do
				member do
					match "changeStatus" => "productasks#changeStatus", :via => :put
				end
			end
		end

		root :to => "staticpage#index"
	end

	mount_sextant if Rails.env.development?
end
