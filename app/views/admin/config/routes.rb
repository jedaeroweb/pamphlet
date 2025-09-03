Rails.application.routes.draw do
  root 'home#index'
  get 'home/demo', to: 'home#demo'

  resources :ads
  get 'ad-complete',to: 'ads#complete', as: 'ad_complete'

  resources :addresses
  resources :answers
  resources :blogs
  resources :biddings
  resources :companies
  resources :contacts
  resources :communities
  resources :orders
  resources :products
  resources :shoppings
  resources :notices
  resources :faqs
  resources :simulations
  resources :simulation_materials
  resources :slides
  resources :portfolios
  resources :reservations
  resources :user_simulation_materials
  resources :user_point_logs
  resources :questions
  resources :reviews
  resources :requests
  resources :deletion_requests
  resources :shopping_carts
  resources :accepted_biddings
  resources :user_addresses
  resources :specialities

  #intro
  get 'intro', to: 'intro#index', as: 'intro'
  get 'privacy', to: 'intro#privacy', as: 'privacy'
  get 'agreement', to: 'intro#agreement', as: 'agreement'
  get 'point-charge', to: 'user_point_logs#new', as: 'point_charge'
  get 'point-charge/complete', to: 'user_point_logs#complete', as: 'point_charge_complete'
  get 'mypage',to: 'users#index', as: 'mypage'
  get 'contact-complete',to: 'contacts#complete', as: 'contact_complete'

  get 'my-ads', to: 'ads#my', as: 'my_ads'
  get 'my-accepted-biddings',to: 'accepted_biddings#my', as: 'my_accepted_biddings'
  get 'my',to: 'users#my', as: 'my'
  get 'my-biddings',to: 'biddings#my', as: 'my_biddings'
  get 'my-companies',to: 'companies#my', as: 'my_companies'
  get 'user-info/:id', to: 'users#show', as: 'user_info'
  get 'users/delete_confirm', to: 'users#delete_confirm', as: 'user_delete_confirm'
  get 'orders/complete', to: 'orders#complete', as: 'order_complete'
  get 'payments/new', to: 'payments#new', as: 'new_payment'
  post 'payments/callback', to: 'payments#callback', as: 'payment_callback'
  get 'payments/complete', to: 'payments#complete', as: 'payment_complete'
  get 'shares', :to=>'shares#index', as: 'shares'
  post 'biddings/accept/:id', to: 'biddings#accept', as: 'bidding_accept'


  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks', :sessions => "users/sessions", :registrations => "users/registrations", :passwords => "users/passwords" }, :path_names => { :sign_up => 'new', :sign_in => 'login', :sign_out => 'logout' } do
    get 'login', :to => 'users::Sessions#new'
    get 'logout', :to=> 'users::Sessions#destroy'
  end

  devise_for :admins, :controllers => {  :sessions => "admins/sessions",:registrations => "admins/registrations" }, :path_names =>  {:sign_up=>'complete',:sign_in => 'login', :sign_out => 'logout'} do
    get 'edit', :to => 'admins::Registrations#edit'
    get 'login', :to => 'admins::Sessions#new'
    get 'logout', :to=> 'admins::Sessions#destroy'
  end

  # 관리자
  scope 'admin', module: 'admin', as: 'admin' do
    get '/' => 'home#index'

    resources :admins
    resources :admin_pictures
    resources :address_levels
    resources :addresses
    resources :ads
    resources :answers
    resources :blog_categories
    resources :blogs
    resources :biddings
    resources :accepted_biddings
    resources :contact_categories
    resources :contacts
    resources :charge_points
    resources :users
    resources :user_pictures
    resources :user_point_logs
    resources :product_categories
    resources :products
    resources :speciality_categories
    resources :specialities
    resources :speciality_men
    resources :orders
    resources :notices
    resources :faq_categories
    resources :faqs
    resources :companies
    resources :materials
    resources :site_settings
    resources :reservations
    resources :simulation_categories
    resources :simulations
    resources :simulation_materials
    resources :user_simulation_materials
    resources :sizes
    resources :slides
    resources :settings
    resources :payments
    resources :questions
    resources :requests
    resources :reviews
    resources :portfolios
  end
end
