class AddColumnsToBudgetsPost < ActiveRecord::Migration[5.2]
  def change
    add_column :budgets_posts, :recurring, :boolean
  end
end
