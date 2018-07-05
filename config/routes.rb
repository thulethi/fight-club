Rails.application.routes.draw do
  root to: redirect('/fighters')
  get '/fighters/newfight', to: 'fighters#newfight'
  post '/fighters/newfight', to: 'fighters#newfight_result'
  resources :fighters
  # get '/fighters/history', to: 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
