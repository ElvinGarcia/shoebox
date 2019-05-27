class AddAmountToReceipt < ActiveRecord::Migration[5.2]
  def change
    add_column :receipts, :amount, :integer
  end
end
