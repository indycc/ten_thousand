TenThousand::Application.routes.draw do
  resources :expertises
  resources :practice_logs
  root :to => "welcome#index"
end
