class UserController < ApplicationController

  before_action :user_signed_in?
  helper_method :current_user
  before_action :authorize_admin
  rescue_from Pundit::NotAuthorizedError, with: :authorize_error

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    authorize @user
    if @user.save
      flash[:success] = 'Success created user!'
      redirect_to user_new_path
    else
      render :new
    end
  end

  def management
    @query = User.ransack(params[:q])
    @users = @query.result.page(params[:page]).per(10)
    respond_to do |format|
      format.html # management.html.erb
      format.js # management.js.erb
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end
end
