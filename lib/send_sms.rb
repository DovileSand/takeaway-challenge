require 'twilio-ruby'

account_sid = "AC9bbcc3e28bec6842697f872209e1db2d"
auth_token = "***"

begin
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
        :from => '+441668932043',
        :to => '+447730478364',
        :body => 'Hello world'
    })
rescue Twilio::REST::RequestError => e
    puts e.message
end
