class UserMailer < ActionMailer::Base
  default from: "postmaster@app5080777.mailgun.org"
  
  def send_email(email, subject, body)
    mail(:to => email, :subject => subject) do |format|
      format.text { render :text => body }
      format.html { render :text => body }
    end
  end
  
end
