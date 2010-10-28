TenThousand::Application.routes.draw do
  resources :expertises
  resources :practice_logs
  root :to => "temp_auth_results#index"
end
