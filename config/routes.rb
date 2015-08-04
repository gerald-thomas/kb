Rails.application.routes.draw do
	resources :rules
  	#root to: 'visitors#index'
  	root to: 'rules#index'
  	get '/rules/tree/:id', to: 'rules#tree', as:  :tree
  	get ':controller/:action/:id'

end
