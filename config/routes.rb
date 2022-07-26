Rails.application.routes.draw do
  devise_for :users
  root 'surveys#index'
  resources :surveys do 
    resources :questions
  end 

  resources :answers
end
