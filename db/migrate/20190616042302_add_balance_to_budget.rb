class AddBalanceToBudget < ActiveRecord::Migration[5.2]
  def change
    add_column :budgets, :balance, :integer
  end
end
