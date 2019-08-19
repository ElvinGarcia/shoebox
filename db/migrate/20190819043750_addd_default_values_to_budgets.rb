class AdddDefaultValuesToBudgets < ActiveRecord::Migration[5.2]
  def change
    change_column :budgets, :amount, :integer, :default => 0
    change_column :budgets, :balance, :integer, :default => 0
  end
end
