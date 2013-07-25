Tradr::Application.routes.draw do



  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout

  resources :user_sessions
  resources :users do
    resources :stocks
  end


  root :to => 'users#index'


end
