Rails.application.routes.draw do

  root 'wcups#top'
  get 'wcups/index'
  get 'wcups/show'

  get 'favorites/new'
  get 'favorites/create'
  get 'favorites/edit'
  get 'favorites/update'
  get 'favorites/destroy'

  get 'countries/before' => 'countries#before', as: "country_before"
  get 'countries/europe' => 'countries#europe', as: "europe"
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

  get 'participations/index'
  get 'participations/shuffle'



  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
