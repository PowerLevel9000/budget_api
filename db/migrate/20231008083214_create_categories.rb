class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false, default: ''
      t.boolean :is_main, null: false, default: false
      t.integer :order, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
