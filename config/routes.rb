VersatileDragon::Application.routes.draw do
  resources :productclasses, :only => [:index, :show] do
    resources :products, :only => :show
  end

  match "/admin/createAdmin" => "admin#createAdmin", :via => :post
  match "/admin/loginCheck" => "admin#loginCheck", :via => :post
  match "/admin/update" => "admin#update", :via => :put

  namespace :admin do
    get "sign_up", "log_in", "log_out", "edit"
    get '/' => 'indexlinks#index'
    
    resources :indexlinks

    resources :productclasses do
      match 'uploadPhoto' => 'productclasses#createPhoto', :via => [:post]
      match 'deletePhoto/:id' => 'productclasses#destroyPhoto', :via => [:delete]
      
      resources :products, :except => [:index, :new] do
        match 'uploadPhoto' => 'products#createPhoto', :via => [:post]
        match 'deletePhoto/:id' => 'products#destroyPhoto', :via => [:delete]
      end
    end

    resources :news, :except => :new do
      match 'uploadPhoto' => 'news#createPhoto', :via => [:post]
      match 'deletePhoto/:id' => 'news#destroyPhoto', :via => [:delete]
    end

  end

  root :to => "staticpage#index"

end
