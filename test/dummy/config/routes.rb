Rails.application.routes.draw do
  mount Tickle::Engine => "/tickle"
  resources :tests
  root 'static_pages#root'
end
