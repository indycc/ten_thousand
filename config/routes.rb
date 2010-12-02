TenThousand::Application.routes.draw do
  controller :reports do
    get "reports/calendar(/:year/:month)", :as => 'calendar_report', :action => 'calendar'
  end

  resources :expertises
  resources :practice_logs
  match '/home' => 'dashboard#index', :as => 'dashboard'
  root :to => "welcome#index"
end
