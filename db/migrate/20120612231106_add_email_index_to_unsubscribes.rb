class AddEmailIndexToUnsubscribes < ActiveRecord::Migration
  def change
    add_index :unsubscribes, :email, :unique => true
  end
end
