Rails.application.routes.draw do

  get 'auth/login', to: 'auth#login', as: 'auth_login'
  post 'auth/login', to: 'auth#create_session', as: 'login_post'   
  
end
