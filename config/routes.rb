Tickle::Engine.routes.draw do
  resources :pricings, only: [:index]
end
