class Unsubscribe < ActiveRecord::Base
  attr_accessible :email
  
  before_save { |unsub| unsub.email = email.downcase }
  
end
