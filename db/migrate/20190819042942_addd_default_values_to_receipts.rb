class AdddDefaultValuesToReceipts < ActiveRecord::Migration[5.2]
  def change
    change_column :receipts, :amount, :integer, :default => 0
  end
end
