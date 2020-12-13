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
            session[:url_target] = request.url
            redirect_to auth_login_path
            return false
        end
    end

    def authorize_admin 
        user = User.find(session[:user_id]).role == 'admin'
        unless user
            flash[:error] = 'You are not authorized!'
            redirect_to home_index_path
        end
    end

    def authorize_supervisor
        user = User.find(session[:user_id]).role == 'supervisor'
        unless user
            flash[:error] = 'You are not authorized!'
            redirect_to home_index_path
        end
    end

    def authorize_employee 
        user = User.find(session[:user_id]).role == 'employee'
        unless user
            flash[:error] = 'You are not authorized!'
            redirect_to home_index_path
        end
    end

end
