class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.boolean :is_cashin, null: false, default: false
      t.integer :amount, null: false, default: 0
      t.date :date, null: false
      t.text :description, null: false, default: ''
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
