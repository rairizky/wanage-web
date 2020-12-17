class User < ApplicationRecord

    has_secure_password

    has_one :profile

    def admin?
        role == 'admin'
    end
    
    def supervisor?
        role == 'supervisor'
    end

    def employee?
        role == 'employee'
    end
end
