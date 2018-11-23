class CleanUpUnnecessaryColumnsUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.remove :gdrive_token
      t.remove :gdrive_refresh_token
      t.remove :gdrive_auth_token
      t.remove :reset_password_token
      t.remove :reset_password_sent_at
      t.remove :remember_created_at
    end
  end
end
