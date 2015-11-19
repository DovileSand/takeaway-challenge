require "twilio-ruby"

class Sms

  TIME_FORMAT = "%H:%M"

  def initialize(config, client: nil)
    @client = client || Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
    @config = config
  end

  def deliver
    client.messages.create(message_args)
  end

  private

  attr_reader :client, :config

  def message_args
    {
      from: config[:from],
      to: config[:to],
      body: config[:body] % delivery_time
    }
  end

  def delivery_time
    (Time.now + 60 * 60).strftime(TIME_FORMAT)
  end
end

# require 'twilio-ruby'
# require 'dotenv'
# Dotenv.load
#
# class TextMessenger
#
#   # def initialize ()
#   @client = Twilio::REST::Client.new(ENV['TWILIO_ACC_SID'], ENV['TWILIO_ACC_TOKEN'])
#
#   def self.send_sms
#       @client.account.messages.create(
#           :from => ENV['TWILIO_ACC_NO'],
#           :to => ENV['MY_NO'],
#           :body => 'Hello world'
#       )
#   end
#
# rescue Twilio::REST::RequestError => e
#     puts e.message
#
# end


# BEFORE ADDING Dotenv:

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
