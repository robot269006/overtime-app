module SmsTool
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']
  @client = Twilio::REST::Client.new account_sid, auth_token

  def self.send_sms(number:, message: )
    @client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: "+81#{number}",
      body: "#{message}"
      )
  end
end

# Need to put in below into the console
# SmsTool.send_sms(number: '9017726822', message: "Look at me, I'm in a text")
