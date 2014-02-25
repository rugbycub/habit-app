HabitApp::Application.routes.draw do
  devise_for :users

  root :to => "welcome#index"

  get "/habits/:id" => "habits#show", as: 'habit'
  get "/habits/" => "habits#index", as: 'habits'
  get "/habits/new" => "habits#new", as: 'new_habit' 

  post "/completions", to: "completions#create"
  delete "/completions", to: "completions#destroy"

  get "/profile", to: "profile#show", as: 'profile'

end
