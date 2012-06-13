require 'rest_client'
require 'multimap'

class UserMailer < ActionMailer::Base  
  def self.send_email(email, subject, body, htmlBody)
    unsubscribe = Unsubscribe.find_by_email(email)
    if (!unsubscribe)
      #haven't sent email to this acocunt before
      unsubscribe = Unsubscribe.new
      unsubscribe.token = UUID.generate
      unsubscribe.unsubscribed = false
      unsubscribe.email = email
      unsubscribe.save
    elsif (unsubscribe.unsubscribed) 
      #they have unsubscribed - don't send the email
      return
    end
    unsubscribe_link = "http://www.nowtellem.com/unsubscribe/#{unsubscribe.token}"
    data = Multimap.new
    data[:from] = "NowTellEm <notify@nowtellem.com>"
    data[:to] = email
    data[:subject] = subject
    data[:text] = body+"\n\n\n\nPrefer not to receive feedback? Unsubscribe here:#{unsubscribe_link}"
    data[:html] = htmlBody+"<br /><br /><br /><br />Prefer not to receive feedback? Unsubscribe <a href=\"#{unsubscribe_link}\">here</a>"
    RestClient.post "https://api:key-18vu870tb37bjnfwtiyw7trxnutj-r56"\
    "@api.mailgun.net/v2/nowtellem.com/messages", data
  end  
end
