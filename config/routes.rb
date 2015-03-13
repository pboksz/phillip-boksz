Rails.application.routes.draw do
  get '/travel' => 'home#travel'

  root 'home#index'
end
