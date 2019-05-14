class DropBudgetsPosts < ActiveRecord::Migration[5.2]
  def change
    drop_table :budgets_posts
  end
end
