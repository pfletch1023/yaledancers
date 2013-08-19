YaleDancers::Application.routes.draw do
  
  root to: 'main#root'
  
  resources :users, :members, :shows, :performances
  
  # JSON Routes
  get "/photos", to: "main#photos"
  
  # Admin Routes
  get "/admin", to: "main#admin"  
  get "/shows/:id/performances/new", to: "performances#new"
  
end
