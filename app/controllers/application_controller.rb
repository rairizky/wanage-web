class ApplicationController < ActionController::Base

    include Pundit

    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        else
            nil
        end
    end

    def user_signed_in?
        if current_user
            true
        else
            flash[:error] = 'Login first!'
            session[:url_target] = request.url
            redirect_to auth_login_path
            return false
        end
    end
    
    def authorize_error
        flash[:error] = 'You are not authorized!'
        redirect_to home_index_path, method: :get
    end

    def authorize_admin 
        user = User.find(session[:user_id]).admin?
        authorize_error unless user
    end

    def authorize_supervisor
        user = User.find(session[:user_id]).supervisor?
        authorize_error unless user
    end

    def authorize_employee 
        user = User.find(session[:user_id]).employee?
        authorize_error unless user
    end

end
