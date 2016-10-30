Rails.application.routes.draw do

  get :paths, to: 'icons#paths', as: :paths
  get ':key(/:size)(/:color)', defaults: {format: :svg}, to: 'icons#show', as: :icon
  root to: 'icons#index'
end
