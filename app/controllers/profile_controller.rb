class ProfileController < ApplicationController

  before_action :user_signed_in?
  helper_method :current_user

  def index
    @user = User.find(session[:user_id])
    @get_user = @user.profile
    @profile = Profile.new
  end

  def create
    @user = User.find(session[:user_id])
    @profile = @user.create_profile(profile_params)
    @create_profile = ProfileServices::NewProfileServices.new(@user, @profile, flash).create
    if @create_profile
      redirect_to profile_index_path
    else
      render :index
    end
  end

  def update
    @user = User.find(session[:user_id])
    @get_user = @user.profile
    if @get_user.update(profile_params)
      flash[:success] = 'Update profile success'
    else
      
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:avatar, :dob, :phone, :address)
  end
end
