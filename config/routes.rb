YaleDancers::Application.routes.draw do
  
  root to: 'main#root'
  
  resources :users
  
end
