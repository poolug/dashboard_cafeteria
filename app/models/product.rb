class Product < ApplicationRecord
  has_many :sales

  validates :name, presence: true
  validates :origin, presence: true
  validates :variety, presence: true
  validates :unit_price, numericality: { greater_than_or_equal_to: 1990 }
  validates :unit_price, numericality: { less_than_or_equal_to: 5490 }
end
