Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'journals#index'

  resources :journals do
    resources :entries
  end

  # TODO:
  # need a route for the "Index & Future" view
  # what controller does this go to? and action?
  get '/future/:id', to: 'journals#future', as: 'future'

  # TODO:
  # need a route for the "Month Log" view
  # what controller does this go to? and action?

end
