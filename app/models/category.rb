class Category < ApplicationRecord
    has_many :products, dependent: :destroy
    def to_s
        name
    end
end
