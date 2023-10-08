class Category < ApplicationRecord
  # Associations for category
  belongs_to :user
  has_many :expense, dependent: :destroy

  # Validation for category
  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :order, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :is_main, inclusion: { in: [true, false] }
end
