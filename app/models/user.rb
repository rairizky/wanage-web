class User < ApplicationRecord

    validates :name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
    validates :password, presence: true
    validates :password, confirmation: { case_sensitive: true }
    validates :role, presence: true
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
