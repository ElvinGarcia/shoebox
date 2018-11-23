class RemoveColumnsFromUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.remove :uid
      t.remove :encrypted_password
      t.remove :provider
    end
  end
end
