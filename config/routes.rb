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
  get 'countries/europe'
  get 'countries/africa'
  get 'countries/southamerica'
  get 'countries/concacaf'
  get 'countries/asia'
  get 'countries/oceania'
  get 'countries/32nd'

  get 'participations/index'
  get 'participations/shuffle'



  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
