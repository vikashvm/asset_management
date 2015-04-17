Rails.application.routes.draw do
  resources :purchases, :inventories, :products, :employees
  resources :allotments, except: [:edit, :update, :destroy]
end
