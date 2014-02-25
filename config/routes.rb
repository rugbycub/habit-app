HabitApp::Application.routes.draw do
  devise_for :users
  root :to => "welcome#index"
  resources :habits
  post "/completions", to: "completions#create"
  delete "/completions", to: "completions#destroy"

end
