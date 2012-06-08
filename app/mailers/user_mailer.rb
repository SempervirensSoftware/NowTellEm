require 'rest_client'
require 'multimap'

class UserMailer < ActionMailer::Base  
  def self.send_email(email, subject, body)
    data = Multimap.new
    data[:from] = "postmaster@app5080777.mailgun.org"
    data[:to] = email
    data[:subject] = subject
    data[:text] = body
    data[:html] = "<html>"+body+"</html>"
    RestClient.post "https://api:key-18vu870tb37bjnfwtiyw7trxnutj-r56"\
    "@api.mailgun.net/v2/app5080777.mailgun.org/messages", data
  end  
end
