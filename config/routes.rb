Tickle::Engine.routes.draw do
  resources :pricings, only: [:create, :index]
end
