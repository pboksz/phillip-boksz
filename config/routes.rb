Rails.application.routes.draw do
  get '/projects' => 'home#projects'
  get '/games' => 'home#games'
  get '/travels' => 'home#travels'
  get '/sitemap(.xml)' => 'home#sitemap', format: 'xml'

  root 'home#index'
end
