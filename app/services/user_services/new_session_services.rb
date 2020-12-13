module UserServices
    class NewSessionServices

        attr_accessor :params, :session, :flash, :user

        def initialize(params, session, flash)
            @params = params
            @session = session
            @flash = flash
            @user = User.find_by(email: @params[:email])
        end

        def perform
            check_user_has_email
        end

        private
        def check_user_has_email
            if @user
                matching_credentials
            else
                @flash[:error] = 'Email not found!'
                return false
            end
        end

        def matching_credentials
            if @user.authenticate(@params[:password])
                @session[:user_id] = @user.id
                @flash[:success] = "Welcome back, #{@user.name}!"
            else
                @flash[:error] = 'Credentials not match!'
                return false
            end
        end
    end
end