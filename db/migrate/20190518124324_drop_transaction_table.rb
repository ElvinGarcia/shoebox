class DropTransactionTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :receipts
  end

end
