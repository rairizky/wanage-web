class AuthController < ApplicationController

  def login
    
  end

  def create_session
    @perform = UserServices::NewSessionServices.new(params, session, flash).perform
    if @perform
      if session[:url_target].present?
        redirect_to session[:url_target]
      else
        redirect_to auth_login_path
      end
    else
      redirect_to auth_login_path
    end
  end

  def destroy_session
    session[:user_id] = nil
    flash[:success] = 'Logout success!'
    redirect_to auth_login_path
  end
end
