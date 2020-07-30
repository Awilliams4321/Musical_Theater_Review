class User < ApplicationRecord
    has_secure_password
    validates :email, :username, uniqueness: true
    has_many :reviews
    has_many :musicals, through: :reviews
end
