class Comment < ActiveRecord::Base
  attr_accessible :content, :feedback_id
  belongs_to :feedback
  
  validates :content, :presence => true 
  validates :feedback_id, :presence => true 
  
end
