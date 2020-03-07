class InterestPlace < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :x, :y, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
