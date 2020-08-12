class Musical < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    accepts_nested_attributes_for :reviews, allow_destroy: true

    def musical_id=(id)
        musical = Musical.find_or_create_by(id: id)
        self.id = id
    end

    def musical_name 
        self.id ? self.id : nil 
    end

end
 