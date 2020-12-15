class Profile < ApplicationRecord

    belongs_to :user

    mount_uploader :avatar, AvatarUploader
    validates :avatar, presence: true
    validates :dob, presence: true
    validates :phone, presence: true, numericality: true
    validates_length_of :phone, minimum: 9
    validates :address, presence: true
end
