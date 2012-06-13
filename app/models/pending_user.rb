class PendingUser < ActiveRecord::Base  
  attr_accessible :email, :secret
  
  before_save { |pendingUser| pendingUser.email = email.downcase }
  
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
    link = "http://www.nowtellem.com/pending_users/#{pending_user.secret}"
    
    if (pending_user.save)    
      self.notify_new_feedback(email,feedback,link)
    end
  end
  
  def self.notify_pending_user(email,feedback,secret) 
    mysecret = secret
    link = "http://www.nowtellem.com/pending_users/#{mysecret}"
    self.notify_new_feedback(email,feedback,link)
  end
  
  def self.notify_user(email,feedback,user_id)
    myUserId = user_id
    link = "http://www.nowtellem.com/users/#{myUserId}"
    self.notify_new_feedback(email,feedback,link)
  end
  
  def self.notify_new_feedback(email,feedback,link)
    subject = "You have new feedback"
    body = "One of your coworkers said this about you: \"#{feedback}\"\n\nVisit NowTellEm to see what other coworkers are saying about you.\n#{link}"
    htmlBody = "<html>One of your coworkers said this about you: \"#{feedback}\"<br /><br />Visit NowTellEm to see what other coworkers are saying about you.<br />#{link}</html>"
    UserMailer.send_email(email,subject,body,htmlBody)
  end
  
end
