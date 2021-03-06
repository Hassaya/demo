Rails.application.routes.draw do
  get 'project/index'

  get 'home/index'

  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


authenticated :user do
	root to: 'home#index'
	end

unauthenticated :user do
	devise_scope :user do
		root to: 'devise/sessions#new'
		end
	end
devise_for :users, controllers: { sessions: 'users/sessions' }

#devise_for :users, controllers: { sessions: 'users/sessions' }

#devise_for :users, path: 'auth', path_names: { sign_in: 'login' }
end
