class ProfileController < ApplicationController

  before_action :user_signed_in?
  helper_method :current_user
  rescue_from Pundit::NotAuthorizedError, with: :authorize_error

  def index
    @user = User.find(session[:user_id])
    authorize @user, policy_class: ProfilePolicy
    @get_user = @user.profile
    @profile = Profile.new
  end

  def create
    @user = User.find(session[:user_id])
    @profile = @user.create_profile(profile_params)
    if @profile.valid?
      flash[:success] = 'Create profile success!'
      redirect_to profile_index_path
    else
      render :index
    end
  end

  def update
    @user = User.find(session[:user_id])
    @get_user = @user.profile
    authorize @get_user
    if @get_user.update(profile_params)
      flash[:success] = 'Update profile success'
      if params[:profile][:avatar].present?
        @get_user.save
        @get_user.remove_avatar!   
      end
      redirect_to profile_index_path
    else
      render :index
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:avatar, :dob, :phone, :address)
  end
end
