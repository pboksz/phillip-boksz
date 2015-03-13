Rails.application.routes.draw do
  get '/projects' => 'home#work'
  get '/games' => 'home#games'
  get '/travel' => 'home#travel'

  root 'home#index'
end
