class PendingUser < ActiveRecord::Base  
  attr_accessible :email, :secret
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,   :presence => true, 
                      :format=> {:with => VALID_EMAIL_REGEX},
                      :uniqueness => true
  validates :secret,  :presence => true,
                      :uniqueness => true
  
  def self.create_and_notify(email,feedback)
    secret = UUID.generate
    
    pending_user = PendingUser.new
    pending_user.email = email
    pending_user.secret = secret
    
    if (pending_user.save)    
      self.notify(email,feedback)
    end
  end
  
  def self.notify_pending_user(email,feedback)   
    self.notify(email,feedback)
  end
  
  def self.notify_user(email,feedback)
      self.notify(email,feedback)
  end
  
  def self.notify_new_feedback(email,feedback)
    subject = "You have new feedback"
    body = "\"#{feedback}\"\n\nDisagree? Visit NowTellEm to rate their feedback.\nhttp://www.nowtellem.com/pending_users/#{pending_user.secret}"
    htmlBody = "<html>\"#{feedback}\"<br /><br />Disagree? Visit NowTellEm to rate their feedback.<br />http://www.nowtellem.com/pending_users/#{pending_user.secret}</html>"
    UserMailer.send_email(email,subject,body,htmlBody)
  end
  
end
