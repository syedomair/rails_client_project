Rails.application.routes.draw do
  get 'sessions/new'

  get 'store/index'
  root 'store#index'
  post   'signin'   => 'sessions#signin'
  post   'signup'   => 'sessions#signup'
  post   'signout'  => 'sessions#signout'
end
