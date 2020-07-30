class User < ApplicationRecord
    has_many :reviews
    has_many :musicals, through: :reviews
end
