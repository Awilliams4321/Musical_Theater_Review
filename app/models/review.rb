class Review < ApplicationRecord
    validates :headline, presence: true
    belongs_to :user, optional: true
    belongs_to :musical

    accepts_nested_attributes_for :musical

    scope :most_recent, -> { order(created_at: :desc) }

    def review_id=(id)
        review = Review.find_or_create_by(id: id)
        self.id = id
    end

    def review_name 
        self.id ? self.id : nil 
    end
end
