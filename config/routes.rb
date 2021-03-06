require 'ten_thousand/api'

TenThousand::Application.routes.draw do
  TenThousand::API.versions.each do |version|
    mount version => '/api'
  end

  controller :reports do
    get "reports/calendar(/:year(/:month))", :as => 'calendar_report', :action => 'calendar', :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  end

  resources :expertises
  resources :practice_logs
  match '/home' => 'dashboard#index', :as => 'dashboard'
  root :to => "welcome#index"
end
