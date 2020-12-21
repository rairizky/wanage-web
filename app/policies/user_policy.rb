class UserPolicy < ApplicationPolicy

    def create?
        @user.admin?
    end

    def role_admin?
        @user.admin?
    end

    def role_supervisor?
        @user.supervisor?
    end

    def role_employee?
        @user.employee?
    end
end