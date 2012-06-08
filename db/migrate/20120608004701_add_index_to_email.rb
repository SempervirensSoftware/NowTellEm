class AddIndexToEmail < ActiveRecord::Migration
  def change
    add_index :feedbacks, :email
  end
end
