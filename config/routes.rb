HabitApp::Application.routes.draw do
  devise_for :users
  #[NIKKI] temporary root per devise
  root :to => "welcome#index"

  get "/habits/:id", to: "habits#show"

end
