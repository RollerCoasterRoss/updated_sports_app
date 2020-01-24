Rails.application.routes.draw do
  namespace :api do
    get '/sport_teams' => 'sport_teams#index'
    post '/sport_teams' => 'sport_teams#create'
    get '/sport_teams/:id' => 'sport_teams#show'
    patch '/sport_teams/:id' => 'sport_teams#update'
    delete '/sport_teams/:id' => 'sport_teams#destroy'
  end 
end
