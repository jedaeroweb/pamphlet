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

  devise_for :users, :controllers => { :sessions => "users/sessions",:registrations => "users/registrations" }, :path_names =>  {:sign_up=>'new',:sign_in => 'login', :sign_out => 'logout'} do
    get '/users', :to => 'users/registrations#index'
    get '/login', :to => 'users/sessions#new'
    get '/signup', :to => 'users/registrations#new'
  end

  resources :intro, :about, :galleries, :notices, :locations, :histories, :contacts

  resources :blogs do
    resources :blog_comments
  end

  resources :questions do
    get 'password',:on=>:collection
    post 'password',:on=>:collection
    resources :question_comments
  end

  resources :guest_books do
    get 'password',:on=>:collection
    post 'password',:on=>:collection
    resources :guest_book_comments do
      get 'password',:on=>:collection
      post 'password',:on=>:collection
    end
  end
end
