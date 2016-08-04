Rails.application.routes.draw do
  resources :stores, only: [:edit,:update,:destroy,:index]

  devise_for :users
	resources :users do
		collection do
			post :start_up
		end
	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: "home#index"
end
