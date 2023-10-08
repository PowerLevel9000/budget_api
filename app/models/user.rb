class User < ApplicationRecord
    has_many :categories, class_name: "Category"
    validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
end
