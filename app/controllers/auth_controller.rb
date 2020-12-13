class AuthController < ApplicationController

  def login

  end

  def create_session
    @perform = UserServices::NewSessionServices.new(params, session, flash).perform
    if @perform
      redirect_to auth_login_path
    else
      redirect_to auth_login_path
    end
  end

  def destroy_session

  end
end
