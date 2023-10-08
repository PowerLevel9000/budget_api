class User < ApplicationRecord
    # Associations for user
    has_many :categories, class_name: "Category"
    has_many :expenses, class_name: "Expense"

    # Validation for user
    validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
end
