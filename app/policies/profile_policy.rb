class ProfilePolicy < ApplicationPolicy

    def index?
        @user.id == @record.id
    end

    def update?
        @user.id == @record.user_id or @user.role == 'admin'
    end

end