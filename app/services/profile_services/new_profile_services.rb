module ProfileServices
    class NewProfileServices

        attr_accessor :user, :profile, :flash

        def initialize(user, profile, flash)
            @user = user
            @profile = profile
            @flash = flash
        end

        def create
            if @profile.valid?
                @flash[:success] = 'Create profile success!'
                return true
            else
                return false
            end
        end
    end
end