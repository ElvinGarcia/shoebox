class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :admin, default: false
      t.string :password_digest

      t.timestamps
    end

    create_table :stores do |t|
      t.string :name
      t.text :policy
    end

    create_table :posts do |t|
      t.integer :amount
      t.string  :date
      t.integer :user_id
      t.integer :store_id
    end
  end 
end
