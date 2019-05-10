class AddColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :receipt_id, :integer
  end
end
