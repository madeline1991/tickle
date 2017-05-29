Rails.application.routes.draw do
  mount Tickle::Engine => "/tickle"
  resources :tests
end
