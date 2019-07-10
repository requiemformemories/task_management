Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "pages#index"
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  
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
  
  get "/404", to: "errors#not_found"
  get "/422", to: "errors#unprocessable_entity"
  get "/500", to: "errors#internal_error"
end
