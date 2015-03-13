Rails.application.routes.draw do
  get '/work' => 'home#work'
  get '/games' => 'home#games'
  get '/travel' => 'home#travel'

  root 'home#index'
end
