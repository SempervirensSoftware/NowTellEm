class AddStuffToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :sender_email, :string
    add_column :feedbacks, :confirmation_code, :string
  end
end
