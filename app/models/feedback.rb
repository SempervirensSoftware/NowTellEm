class Feedback < ActiveRecord::Base
  attr_accessible :email, :message
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,   :presence => true, :format=> {:with => VALID_EMAIL_REGEX}
  validates :message, :presence => true
  
  before_save { |feedback| feedback.email = email.downcase }  
end
