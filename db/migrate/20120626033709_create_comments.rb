class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :feedback_id

      t.timestamps
    end
    
    add_index :comments, :feedback_id
    
  end
end
