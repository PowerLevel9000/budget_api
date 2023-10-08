class User < ApplicationRecord
    # Associations for user
    has_many :categories, class_name: "Category", dependent: :destroy
    has_many :expenses, class_name: "Expense", dependent: :destroy

    # Validation for user
    validates :name, presence: true, uniqueness: true, length: { minimum: 3 }

    # Callbacks for user
    after_create :create_default_categories

    private

    def create_default_categories
        Category.create(name: "Food", user_id: self.id, order: 1, is_main: true)
        Category.create(name: "Transportation", user_id: self.id, order: 2, is_main: true)
        Category.create(name: "Entertainment", user_id: self.id, order: 3, is_main: true)
        Category.create(name: "Work", user_id: self.id, order: 4, is_main: true)
    end
end
