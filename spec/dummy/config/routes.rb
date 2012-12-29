Dummy::Application.routes.draw do
  resources :examples, :only => [:index, :create]
  resources :tests, :only => [:index]
  root :to => 'examples#index'
end
