HabitApp::Application.routes.draw do
  devise_for :users

  root :to => "welcome#index"
  resources :habits

  post "/completions", to: "completions#create"
  delete "/completions", to: "completions#destroy"

  get "/profile", to: "profiles#show", as: "profiles"
  get "/sign_up/profile", to: "profiles#new", as: "add_profile"
  post "/profile", to: "profiles#create"

end
