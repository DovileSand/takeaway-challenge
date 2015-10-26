require 'send_sms'

describe TextMessenger do

  let(:client) { double :client }
  it "can send text" do
    allow(described_class).to receive(:send_sms)
    message = 'Your order was accepted.'
    twilio_message_body = { from: ENV['TWILIO_ACC_NO'], to: ENV['MY_NO'], body: message }
    allow(client).to receive_message_chain(:messages, :create).with(twilio_message_body)
    expect(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_ACC_SID'], ENV['TWILIO_ACC_TOKEN']).and_return(client)
    described_class.send_sms
  end

end
