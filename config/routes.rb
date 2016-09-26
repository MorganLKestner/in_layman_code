Rails.application.routes.draw do
	root to: "users#index" 
	resources :users 
	root to: "posts#index"
	resources :posts


	root to: "articles#index"
	resources :articles

	get "https://github.com/login/oauth/authorize" => "sessions#create"
	post "https://github.com/login/oauth/access_token"

	# get "/auth/:provider/callback" => "sessions#create"
	get "/signout" => "sessions#destroy", :as => :signout
end
