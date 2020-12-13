class DashboardController < ApplicationController

  before_action :user_signed_in?
  helper_method :current_user

  def activity
  end

  def monitoring
  end

  def manage
  end
end
