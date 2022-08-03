Rails.application.routes.draw do
  devise_for :users
  root 'surveys#index'
  resources :surveys do 
    resources :questions
    get :report
  end 

  resources :answers
end
