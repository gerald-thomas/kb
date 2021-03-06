Rails.application.routes.draw do
  	#resources :buckets
	resources :rules
  	#root to: 'visitors#index'
  	root to: 'rules#index'
  	get '/rules/tree/:id', to: 'rules#tree', as:  :tree
  	#get ':controller/:action/:id'
  	get '/rules/run/:id', to: 'rules#run', as:  :run
  	get '/rules/run/:id/count', to: 'rules#count', as: :count
  	#get 'buckets/detail/:id/:branch', to: 'buckets#detail', as: :detail
  	get '/buckets/:rule/:branch/detail', to: 'buckets#detail', as: :detail
  	get '/buckets/:id', to: 'buckets#show', as: :bucket

end
