class PendingUser < ActiveRecord::Base  
  attr_accessible :email, :secret
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,   :presence => true, 
                      :format=> {:with => VALID_EMAIL_REGEX},
                      :uniqueness => true
  validates :secret,  :presence => true,
                      :uniqueness => true
  
  def self.create_and_notify(email)
    secret = UUID.generate
    
    pending_user = PendingUser.new
    pending_user.email = email
    pending_user.secret = secret
    
    if (pending_user.save)    
      subject = "Someone sent you feedback"
      body = "Visit Now Tell'em to see what they said.\n\nhttp://nowtellem.com/pending_users/#{pending_user.secret}"
      UserMailer.send_email(email,subject,body)
    end
  end
  
end
