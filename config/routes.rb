Rails.application.routes.draw do
  devise_for :users
  mount ActionCable.server => '/cable'
  mount Messenger::Bot::Space => "/webhook"
  resources :rooms
  #devise_for :users
  root to: 'pages#home'

  get '/update_index', to:"rooms#update_index"
  # devise_for :users
  # root to: 'pages#home'

  # get 'pages/faq'
  # get 'pages/heineken'
  # get 'pages/how'
  # get 'pages/demo'
  # get 'pages/features'


  # scope '(:locale)', locale: /fr/ do
  #   resources :pages
  # end

  resources :conversations, only: [:index, :create] do
    resources :messages, only: :create
  end

  scope '(:locale)', locale: /fr/ do
    get '/', to: 'pages#home'
    get '/faq', to: 'pages#faq'
    get '/about', to: 'pages#about'
    get '/solution', to: 'pages#solution'
    get '/features', to: 'pages#features'
    get '/demo_request', to: 'pages#demo_request'
    get '/demo', to: 'pages#demo'
    get '/show', to: 'rooms#show'
    get '/contact', to: 'pages#contact'
    get '/press', to: 'pages#press'
    get '/jobs', to: 'pages#jobs'
  end


  resources :sessions


  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :sessions, only: [ :index, :show, :update, :create ]
    end
  end

  get "/webhook", to: "messenger_bot#webhook"

end
