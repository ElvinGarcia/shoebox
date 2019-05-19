class AddColumnsToReceipt < ActiveRecord::Migration[5.2]
  def change
    rename_table :transactions, :receipts
  end

  def up
    change_table :receipts do |t|
    t.integer :recurring, default: false
		t.text :content
		t.belongs_to :user
    t.belongs_to :budget
    t.belongs_to :receipt
   end
  end
end 
