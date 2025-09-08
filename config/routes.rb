Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'home/demo', to: 'home#demo'

  # Admin 인증 라우트
  devise_for :admins,
             class_name: 'User',
             path: 'admins',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout'
             },
             controllers: {
               sessions: 'admins/sessions'
             }

  namespace :admin do
    root to: 'home#index'

    resources :contacts
    resources :users
    resources :blogs
    resources :notices
    resources :histories
    resources :galleries
  end

  devise_for :users, :controllers => { :sessions => "users/sessions",:registrations => "users/registrations" }, :path_names =>  {:sign_up=>'new',:sign_in => 'login', :sign_out => 'logout'}

  devise_scope :user do
    get '/login', to: 'users/sessions#new', as: :login_redirect
    delete '/logout', to: 'users/sessions#destroy', as: :logout_redirect
  end

  resources :intro, :galleries, :blogs, :notices, :locations, :histories, :contacts

end
