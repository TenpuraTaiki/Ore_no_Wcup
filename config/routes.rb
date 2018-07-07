Rails.application.routes.draw do
  get 'favorites/new'

  get 'favorites/create'

  get 'favorites/edit'

  get 'favorites/update'

  get 'favorites/destroy'

  get 'countries/europe'

  get 'countries/africa'

  get 'countries/southamerica'

  get 'countries/concacaf'

  get 'countries/asia'

  get 'countries/oceania'

  get 'countries/32nd'

  get 'participations/index'

  get 'participations/shuffle'

  get 'wcups/index'

  get 'wcups/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
