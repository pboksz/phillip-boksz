Rails.application.routes.draw do
  get '/projects' => 'home#projects'
  get '/games' => 'home#games'
  get '/travels' => 'home#travels'

  root 'home#index'
end
