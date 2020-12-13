class ProfileController < ApplicationController

  before_action :user_signed_in?
  helper_method :current_user

  def index
  end
end
