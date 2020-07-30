class Review < ApplicationRecord
    validates :headline, presence: true
    belongs_to :user
    belongs_to :musical
end
