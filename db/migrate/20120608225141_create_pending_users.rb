class CreatePendingUsers < ActiveRecord::Migration
  def change
    create_table :pending_users do |t|
      t.string :email
      t.string :secret

      t.timestamps
    end
    
    add_index :pending_users, :email,  :unique => true
    add_index :pending_users, :secret, :unique => true

  end
end
