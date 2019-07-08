Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  
  root :to => "tasks#index"
  resources :tasks, :except => [:new] do
    post 'processing' => "tasks#processing"
    post 'finish' => "tasks#finish"
  end
  
  namespace :admin do
    resources :users do
      get 'password_edit'
      patch 'password_update' 
    end
  end
end
