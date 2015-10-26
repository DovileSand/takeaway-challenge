require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class TextMessenger

  @client = Twilio::REST::Client.new(ENV['TWILIO_ACC_SID'], ENV['TWILIO_ACC_TOKEN'])

  def self.send_sms
      @client.account.messages.create(
          :from => ENV['TWILIO_ACC_NO'],
          :to => ENV['MY_NO'],
          :body => 'Hello world'
      )
  end

rescue Twilio::REST::RequestError => e
    puts e.message

end

# begin
#
#     @client = Twilio::REST::Client.new account_sid, auth_token
#     @client.account.messages.create({
#         :from => '+441668932043',
#         :to => '+447730478364',
#         :body => 'Hello world'
#     })
# rescue Twilio::REST::RequestError => e
#     puts e.message
# end
