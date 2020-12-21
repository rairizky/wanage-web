class DashboardController < ApplicationController

  before_action :user_signed_in?
  helper_method :current_user
  before_action :authorize_admin, only: [:activity]
  before_action :authorize_supervisor, only: [:monitoring]
  before_action :authorize_employee, only: [:manage]
  rescue_from Pundit::NotAuthorizedError, with: :authorize_error

  def activity

  end

  def monitoring

  end

  def manage
    
  end
end
