class CreateBudgetTable < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.string  :category
      t.integer :amount
    end
  end
end
