Frisk::Engine.routes.draw do
  resources :requests, only: [:create]
end
