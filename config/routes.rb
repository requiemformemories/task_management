Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "tasks#index"
  resources :tasks, :except => [:new] do
    post 'processing' => "tasks#processing"
    post 'finish' => "tasks#finish"
  end
end
