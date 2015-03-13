Rails.application.routes.draw do
  get '/projects' => 'home#projects'
  get '/games' => 'home#games'
  get '/travel' => 'home#travel'

  root 'home#index'
end
