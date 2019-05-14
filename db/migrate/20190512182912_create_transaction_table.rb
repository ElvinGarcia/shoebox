class CreateTransactionTable < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
    t.integer :recurring, default: false
		t.text :content
		t.belongs_to :user
    t.belongs_to :budget
    t.belongs_to :receipt
    end
  end

  def down
    drop_table :budgets_posts
  end

  
end
