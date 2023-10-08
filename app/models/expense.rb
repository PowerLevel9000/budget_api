class Expense < ApplicationRecord
  # Associations for expense
  belongs_to :category
  belongs_to :user

  # Validation for expense
  validates :is_cashin, presence: true, inclusion: { in: [true, false] }
  validates :amount, presence: true
  validates :date, presence: true
  validates :description, presence: true, length: { minimum: 4, maximum: 255 }
end
