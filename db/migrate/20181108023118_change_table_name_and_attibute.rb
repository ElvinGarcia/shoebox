class ChangeTableNameAndAttibute < ActiveRecord::Migration[5.2]
  def change
    change_table :posts do |t|
      t.remove :amount, :store_id
    end
    rename_table :posts, :posts
    drop_table :stores
  end
end
