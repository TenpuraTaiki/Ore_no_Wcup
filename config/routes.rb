Rails.application.routes.draw do

  root 'wcups#top'
  post 'wcups/create' => 'wcups#create'
  get 'wcups/index' => 'wcups#index', as: 'wcups'
  get 'wcups/:id/show' => 'wcups#show', as: 'wcup'

  post 'favorites/new' => 'favorites#new'
  resources :favorites, only: [:new, :create, :edit, :update, :destroy]

  get 'countries/before' => 'countries#before', as: "country_before"
  get 'countries/europe' => 'countries#europe', as: "europe"
  post 'countries/europe' =>'countries#europe'
  get 'countries/africa' => 'countries#africa', as: "africa"
  post 'countries/africa' =>'countries#africa'
  get 'countries/southamerica' => 'countries#southamerica', as: "southamerica"
  post 'countries/southamerica' => 'countries#southamerica'
  get 'countries/concacaf' => 'countries#concacaf', as: "concacaf"
  post 'countries/concacaf' => 'countries#concacaf'
  get 'countries/asia' => 'countries#asia', as: "asia"
  post 'countries/asia' => 'countries#asia'
  get 'countries/oceania' => 'countries#oceania', as: "oceania"
  post 'countries/oceania' => 'countries#oceania'
  get 'countries/thirtysecond' => 'countries#thirtysecond', as: "thirtysecond"
  post 'countries/thirtysecond' => 'countries#thirtysecond'

  get 'participations/:id/index' => 'participations#index', as: 'participations'
  get 'participations/:id/shuffle' => 'participations#shuffle', as: 'shuffle'



  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
