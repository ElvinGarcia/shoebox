class CleanReceiptTableColumns < ActiveRecord::Migration[5.2]
  def change
    change_table :receipts do |t|
    t.remove :receipt_id
    end
    change_column :receipts, :recurring, :boolean, default: false
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
