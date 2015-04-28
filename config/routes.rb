Rails.application.routes.draw do
  resources :purchases, :inventories, :products, :employees

  scope '/api' do
  	get '/available', to: 'api#get_available_inventory'
  	get '/issued', to: 'api#get_issued_inventory'
  	get '/retired', to: 'api#get_retired_inventory' 
  	post '/issue', to: 'api#issue_inventory'
  	post '/return', to: 'api#return_inventory'
  	post '/retire', to: 'api#retire_inventory'
    get '/config', to: 'api#get_config'
  end
  #resources :allotments, except: [:edit, :update, :destroy]
end
