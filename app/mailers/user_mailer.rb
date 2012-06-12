require 'rest_client'
require 'multimap'

class UserMailer < ActionMailer::Base  
  def self.send_email(email, subject, body, htmlBody)
    data = Multimap.new
    data[:from] = "NowTellEm <notify@nowtellem.com>"
    data[:to] = email
    data[:subject] = subject
    data[:text] = body
    data[:html] = htmlBody
    RestClient.post "https://api:key-18vu870tb37bjnfwtiyw7trxnutj-r56"\
    "@api.mailgun.net/v2/nowtellem.com/messages", data
  end  
end
