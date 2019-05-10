class CreateTableReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.string :name
      t.string :type
      t.integer :amount
      t.date :date
    end
  end
end
