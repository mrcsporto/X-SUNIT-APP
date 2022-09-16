
Rails.application.routes.draw do
  mount API::Base, at: "/"
  mount GrapeSwaggerRails::Engine, at: "/documentation"
  get 'welcome/index'
  root 'welcome#index'
  resources :reports
  resources :survivors
  resources :abductions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
