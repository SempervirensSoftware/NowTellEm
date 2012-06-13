class FixUnsubscribeSpelling < ActiveRecord::Migration
  def up
    rename_column :unsubscribes, :unsubcribed, :unsubscribed
  end

  def down
  end
end
