Rails.application.routes.draw do
  resources :fights, only: [:index, :show, :new, :create]
  root to: redirect('/fighters')
  # post '/fights/new', to: 'fights#newfight_result'

  resources :fighters

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
