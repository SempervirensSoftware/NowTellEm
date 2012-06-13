class CreateUnsubscribes < ActiveRecord::Migration
  def change
    create_table :unsubscribes do |t|
      t.string :email
      t.string :token
      t.boolean :unsubcribed, :default => false

      t.timestamps
    end
  end
end
