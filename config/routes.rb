HabitApp::Application.routes.draw do
  devise_for :users
<<<<<<< HEAD
  #[NIKKI] temporary root per devise
<<<<<<< HEAD
  #get "/habits/:id" => "habits#show", as: 'habit'
  #get "/habits/" => "habits#index", as: 'habits'
  #get "/habits/new" => "habits#new", as: 'new_habit' 
=======
  get "/habits/new" => "habits#new", as: 'new_habit' 
  get "/habits/:id" => "habits#show", as: 'habit'
  get "/habits/" => "habits#index", as: 'habits'
>>>>>>> 1bfdaeec57bbe4c2e9c443c86f7b0a5e73b64087
=======
>>>>>>> 7786e5d041bef1c749335891adc48d283d80e152
  root :to => "welcome#index"
  resources :habits
  post "/completions", to: "completions#create"
  delete "/completions", to: "completions#destroy"

end
