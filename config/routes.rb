Rails.application.routes.draw do
	resources :rules
  	#root to: 'visitors#index'
  	root to: 'rules#index'
end
