class User < ApplicationRecord
    has_secure_password
    
    validates :email, presence: true, unless: :uid
    validates :username, uniqueness: true

    has_many :reviews
    has_many :musicals, through: :reviews
end
