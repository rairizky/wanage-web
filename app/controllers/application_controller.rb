class ApplicationController < ActionController::Base

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
            redirect_to auth_login_path
            return false
        end
    end
end
