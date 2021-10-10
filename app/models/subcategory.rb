class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :products, dependent: :destroy

  def to_s
    name
  end
end
