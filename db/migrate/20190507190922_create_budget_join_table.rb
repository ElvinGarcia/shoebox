class CreateBudgetJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :posts, :budgets do |t|
      # t.index [:post_id, :budget_id]
      t.index [:budget_id, :post_id], unique: true
    end
  end
end
