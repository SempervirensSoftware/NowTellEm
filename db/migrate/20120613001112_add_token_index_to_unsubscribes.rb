class AddTokenIndexToUnsubscribes < ActiveRecord::Migration
  def change
    add_index :unsubscribes, :token, :unique => true
  end
end
