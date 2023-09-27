Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/settings/m_processes", to: "m_processes#index", as: "m_processes_settings"

  resources :m_processes
end
