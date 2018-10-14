class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gdrive_token, :string
    add_column :users, :gdrive_refresh_token, :string
    add_column :users, :gdrive_auth_token, :string
  end
end
