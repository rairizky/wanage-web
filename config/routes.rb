Rails.application.routes.draw do

  root 'home#greet', as: 'home_index'

  # dashboard
  scope 'dashboard/' do
    get 'activity/', to: 'dashboard#activity', as: 'dashboard_activity'
    get 'monitoring/', to: 'dashboard#monitoring', as: 'dashboard_monitoring'
    get 'manage/', to: 'dashboard#manage', as: 'dashboard_manage'
  end

  # user
  scope 'user/' do
    get 'new/', to: 'user#new', as: 'user_new'
    post 'new/', to: 'user#create', as: 'user_create'
    get 'management/', to: 'user#management', as: 'user_management'
  end
  
  # profile
  scope 'profile/' do
    get '/', to: 'profile#index', as: 'profile_index'
    post '/create', to: 'profile#create', as: 'profile_create'
    patch '/update', to: 'profile#update', as: 'profile_update'
  end

  # auth session
  get 'auth/login', to: 'auth#login', as: 'auth_login'
  post 'auth/login', to: 'auth#create_session', as: 'login_post' 
  delete 'logout/:id', to: 'auth#destroy_session', as: 'logout_user'  

end
