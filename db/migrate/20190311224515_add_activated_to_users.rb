class AddActivatedToUsers < ActiveRecord::Migration[5.2]
  # def change
  #   add_column :users, :activated, boolean, default: false
  #   add_column :users, :activation_digest, string
  #   add_column :users, :activated_at, :datetime
  # end

    def change
      change_table :users do |t|
        t.boolean :activated, default: false
        t.string :activation_digest
        t.datetime :activated_at
      end
      
    end
    
end
