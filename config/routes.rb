Rails.application.routes.draw do
	root to: "users#new" 
	resources :users 
	root to: "posts#index"
	resources :posts

	get "/auth/:provider/callback" => "sessions#create"
	get "/signout" => "sessions#destroy", :as => :signout
end
