HabitApp::Application.routes.draw do
  devise_for :users
  #[NIKKI] temporary root per devise
  get "/habits/new" => "habits#new", as: 'new_habit' 
  get "/habits/:id" => "habits#show", as: 'habit'
  get "/habits/" => "habits#index", as: 'habits'
  root :to => "welcome#index"

  post "/completions", to: "completions#create"
  delete "/completions", to: "completions#destroy"

end
