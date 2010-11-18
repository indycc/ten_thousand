TenThousand::Application.routes.draw do
  resources :expertises
  resources :practice_logs
  match '/home' => 'dashboard#index', :as => 'dashboard'
  root :to => "welcome#index"
end
