Rails.application.routes.draw do

  get 'home/', to: 'home#greet', as: 'home_index'
  scope 'dashboard/' do
    get 'activity/', to: 'dashboard#activity', as: 'dashboard_activity'
    get 'monitoring/', to: 'dashboard#monitoring', as: 'dashboard_monitoring'
    get 'manage/', to: 'dashboard#manage', as: 'dashboard_manage'
  end
  
  get 'auth/login', to: 'auth#login', as: 'auth_login'
  post 'auth/login', to: 'auth#create_session', as: 'login_post' 
  delete 'logout/:id', to: 'auth#destroy_session', as: 'logout_user'  

end
