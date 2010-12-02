TenThousand::Application.routes.draw do
  get "reports/calendar"

  resources :expertises
  resources :practice_logs
  match '/home' => 'dashboard#index', :as => 'dashboard'
  root :to => "welcome#index"
end
