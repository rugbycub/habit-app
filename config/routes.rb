HabitApp::Application.routes.draw do
  devise_for :users
  #[NIKKI] temporary root per devise
  get "/habits" => "habits#index", as: 'habits_path'

  root :to => "welcome#index"

end
