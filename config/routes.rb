Rails.application.routes.draw do

  root 'store#home'
  get 'store/home'
  get 'store/products_category/:id' => 'store#products_category'
  get 'store/products/:id' => 'store#product_detail'
  get 'users/:id' => 'users#show'
  patch 'users/:id' => 'users#update'

  post   'signin'   => 'sessions#signin'
  post   'signup'   => 'sessions#signup'
  post   'signout'  => 'sessions#signout'
end
