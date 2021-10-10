class Category < ApplicationRecord
    has_many :subcategories, dependent: :destroy

    def to_s
        name
    end
end
